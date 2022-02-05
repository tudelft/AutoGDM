"""
Main script to run the automated CFD pipeline
Author: Bart Duisterhof, MAVLab, Delft, Netherlands
"""

from settings import *
import glob
import os
import imageio
from PyFoam.RunDictionary.ParsedParameterFile import ParsedParameterFile
import cv2
import imutils
import numpy as np
import matplotlib.pyplot as plt
import random
import pandas as pd
# from stl import mesh

# patch class, a patch is a surface in the mesh
# we use this class to store the faces it consists of and its type, e.g., 'wall', 'inlet', 'outlet

class patch:
    def __init__(self, id, start_face, nfaces ):
        self.id = id
        self.start = start_face
        self.nfaces = nfaces
        self.type = 'wall'

# simple ( probably unnecessary ) class to store a timestep
class flow_field:
    def __init__(self,id):
        self.id = id

# the main 'environment' class, contains all major functions 
class environment:
    # init with topview img location and ID
    def __init__(self,img_location):
        self.img_location = img_location
        self.id = img_location.split(".")[0].split('/')[-1]    

    # invert topview image: white == occupancy --> black == occupancy
    # and save the inversed image
    def invert_img(self):
        print('Started env:'+str(self.id))
        self.img = imageio.imread(self.img_location)
        self.img_shape = np.shape(self.img)
        self.img_inverted = -(self.img-255)
        self.img_inverted_location = os.path.abspath(env_pics_folder_inversed) + '/' + self.id +'.png'
        imageio.imwrite(self.img_inverted_location,self.img_inverted)

    # create a folder to store all vector wind information for OpenFOAM    
    def create_cfd_folder(self):
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        if os.path.exists(self.cfd_folder):
            os.system('rm -r '+ self.cfd_folder)

        command = 'cp -r ' + os.path.abspath(empty_cfd_dir) + ' ' +os.path.abspath(self.cfd_folder)
        os.system(command)

    # generates two CAD (.stl) files:
    # 1) CAD  of walls and obstacles, useful for visualizations
    # 2) CAD of inside envrionment, used with OpenFOAM 'snappyHexMesh' to create a mesh for CFD
    def extrude_imgs(self):
        # generate cad of environment for sim
        self.env_cat_loc = self.cfd_folder + '/constant/triSurface/'+self.id+'_env.stl'
        command = "java -jar "+java_loc+" -input_file "+ self.img_location + " -output_file "+ self.env_cat_loc + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) +' > /dev/null'
        os.system(command)

        # generate cad of inside environment for cfd
        self.env_flow_loc = self.cfd_folder + '/constant/triSurface/'+self.id+'_flow_vol.stl'
        command = "java -jar "+java_loc+" -input_file "+ self.img_inverted_location + " -output_file "+ self.env_flow_loc + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) + ' > /dev/null'
        os.system(command)

    # using OpenCV to localize the largest area in the provided topview: this will be our testing area
    # outputs a 3D point (x,y,z) within that area, this is how we tell the CFD which area we want to model 
    # coordinate system: origin in bottom left corning (OpenFOAM)
    def find_largest_space(self):
        # grab all contours within the image
        image = cv2.imread(self.img_inverted_location)
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY)[1]
        cnts = cv2.findContours(thresh, cv2.RETR_LIST,cv2.CHAIN_APPROX_SIMPLE)
        cnts = imutils.grab_contours(cnts)
        num_cnts = np.shape(cnts)[0]
        out = np.zeros_like(image)
        areas = np.array([])

        # compute contour areas
        for c in cnts:
            areas = np.append(areas,cv2.contourArea(c))

        # draw largest contour as go-zone (notice the last argument: 1)
        cv2.drawContours(out, [cnts[np.argmax(areas)]], -1, (0, 255, 0), 1)
        cnts = np.delete(cnts,np.argmax(areas))

        if num_cnts>1: # if enough contours left
            for c in cnts:
                cv2.drawContours(out, [c], -1, (0, 255, 0), -1)  #draw the other contours, but now as no-go zones (see last argument: -1)

        out  = out + cv2.imread(self.img_location) # add walls as no-go zones
        out = np.array(cv2.threshold(cv2.cvtColor(out, cv2.COLOR_BGR2GRAY), 0, 255, cv2.THRESH_BINARY)[1])

        # iteratively look for an empty point within the largest space 
        # with clearance of "point clearance" pixels to closest walls (settings.py)
        i = 0
        found_empty_point = False 
        while found_empty_point == False:
            x, y = random.randint(0,self.img_shape[0]), random.randint(0,self.img_shape[1])
            x_min, x_max, y_min, y_max = x-point_clearance, x+point_clearance, y-point_clearance, y+ point_clearance

            if (np.count_nonzero(out[y_min:y_max,x_min:x_max])== 0 and x_min>0 and y_min >0 and x_max < self.img_shape[0] and y_max < self.img_shape[1] ):
                self.empty_point = (x*(size_x/self.img_shape[1]),(size_y-y*(size_y/self.img_shape[0])))
                found_empty_point = True

            # last resort
            elif i>max_it:
                self.empty_point = (size_x/2,size_y/2)
                found_empty_point = True
            i+=1
                
    def find_outlet(self):
        for patch in self.patches:
            if patch.id == self.outlet:
                start_face = patch.start
                no_faces = patch.nfaces
        f = open(self.boundary_folder+'points')
        lines = f.readlines()
        f.close()

        for i, line in enumerate(lines):
            if line.find("(") == 0:
                start_line=i+1 
                break

        x_min = y_min = np.inf
        x_max = y_max = -np.inf

        for face_no in range(start_face,(start_face+no_faces)):
            face = self.faces[face_no]
            for point in face:
                line = lines[start_line+point]
                point_on_surf = line.replace("("," ").replace(")"," ").split()
                x, y = float(point_on_surf[0]), float(point_on_surf[1])

                if x>x_max:
                    x_max = x
                if x<x_min:
                    x_min = x
                if y>y_max:
                    y_max = y
                if y<y_min:
                    y_min = y
        
        x_diff = np.abs(x_max-x_min)
        y_diff = np.abs(y_max-y_min)

        occ_grid = self.ros_loc+ '/OccupancyGrid3D.csv'
        f = open(occ_grid)
        lines = f.readlines()

        cells = (lines[2].split(' ')[1::])
        cells_x, cells_y, cells_z = int(cells[0]), int(cells[1]), int(cells[2])
        cell_size = float(lines[3].split(' ')[-1])
        start_line = 4

        ## boundary in y-direction
        if x_diff < y_diff:
            x_line = int(x_min/size_x*cells_x)
            y_line_min = int(y_min/size_y*cells_y)
            y_line_max = int(y_max/size_y*cells_y)

            x_lines = start_line+x_line+np.arange(cells_z)*(cells_x+1)
            
            for j in x_lines:
                line = lines[j]
                for i in np.arange(y_line_min,y_line_max+1):
                    line = line[:i*2] + '2' + line[i*2+1:] 
                
                lines[j] = line

        ## boundary in x-direction
        else:
            y_line = int(y_min/size_y*cells_y)
            x_line_min = int(x_min/size_x*cells_x)
            x_line_max = int(x_max/size_x*cells_x)
            
            first_line = x_line_min+start_line
            first_last_line = x_line_max+start_line

            x_lines = np.array([[np.arange(first_line+i*(cells_x+1),first_last_line+i*(cells_x+1))] for i in range(cells_z)]).flatten()    
            
            for j in x_lines:
                lines[j] = lines[j][:y_line*2] + '2' + lines[j][y_line*2+1:]

        f = open(occ_grid,"w")
        f.writelines(lines)
        f.close()

    # place source, decide and write source position with OpenCV
    def place_source(self):
        for patch in self.patches:
            if patch.id == self.outlet:
                start_face = patch.start

        f = open(self.boundary_folder+'points')
        lines = f.readlines()
        f.close()

        for i, line in enumerate(lines):
            if line.find("(") == 0:
                start_line=i+1 
                break

        face = self.faces[start_face+1]
      
        line = lines[start_line+face[0]]
        point_on_surf = line.replace("("," ").replace(")"," ").split()
        x, y = float(point_on_surf[0]), float(point_on_surf[1])  

        x_mid = size_x/2.
        y_mid = size_y/2.   
        im_x_mid = int(self.img_shape[0]/2)
        im_y_mid = int(self.img_shape[1]/2)

        image = cv2.imread(self.img_inverted_location,cv2.IMREAD_GRAYSCALE)
        original_img = cv2.imread(self.img_location)
        
        # gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        gray = image
        thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY)[1]
        cnts = cv2.findContours(thresh, cv2.RETR_LIST,cv2.CHAIN_APPROX_SIMPLE)
        cnts = imutils.grab_contours(cnts)
        num_cnts = np.shape(cnts)[0]
        out = np.zeros_like(original_img)
        areas = np.array([])
        # loop over the contours
        for c in cnts:
            areas = np.append(areas,cv2.contourArea(c))

        cv2.drawContours(out, [cnts[np.argmax(areas)]], -1, (0, 255, 0), 1)
        cnts = np.delete(cnts,np.argmax(areas))

        if num_cnts>1:
            for c in cnts:
                cv2.drawContours(out, [c], -1, (0, 255, 0), -1)

        out  = out + original_img
        out = np.array(cv2.threshold(cv2.cvtColor(out, cv2.COLOR_BGR2GRAY), 0, 255, cv2.THRESH_BINARY)[1])
        self.occ_map = -(out-255)

        if x>=x_mid and y>=y_mid:
            out = out[im_x_mid:,:im_y_mid]
            self.source_pos = np.array([0.,0.])
        elif x<x_mid and y>=y_mid:
            out = out[im_x_mid:,im_y_mid:]
            self.source_pos = np.array([x_mid,0.])
        elif x<x_mid and y<y_mid:
            out = out[:im_x_mid,im_y_mid:]
            self.source_pos = np.array([x_mid,y_mid])
        elif x>=x_mid and y<y_mid:
            out = out[:im_x_mid,:im_y_mid]
            self.source_pos = np.array([0.,y_mid])

        i=0
        found_empty_point = False 
        while found_empty_point == False:
            x, y = random.randint(0,self.img_shape[0]/2), random.randint(0,self.img_shape[1]/2)
            x_min, x_max, y_min, y_max = x-point_clearance, x+point_clearance, y-point_clearance, y+ point_clearance

            if (np.count_nonzero(out[y_min:y_max,x_min:x_max])== 0 and x_min>0 and y_min >0 and x_max < self.img_shape[0]/2 and y_max < self.img_shape[1]/2 ):
                
                self.source_pos += np.array([x*(size_x/self.img_shape[1]),(size_y/2-y*(size_y/self.img_shape[0]))])
                found_empty_point = True

            elif i>max_it:
                self.source_pos = (size_x/2,size_y/2)
                found_empty_point = True    
            i+=1
        
    # prepare OpenFOAM folder for mesh generation using snappyHexMesh
    # using pyFOAM to easily interact with dicts
    def pre_snappyhex(self):

        # pointing surfaceFeatureExtract to the right .stl file
        featuredir = os.path.abspath(self.cfd_folder)+'/system/surfaceFeatureExtractDict'
        f = ParsedParameterFile(featuredir)
        self.flow_vol_id = self.env_flow_loc.split('/')[-1]
        f[self.flow_vol_id] = {'extractionMethod': 'extractFromSurface', 'extractFromSurfaceCoeffs': {'includedAngle': 120}} 
        f.writeFile()
        
        # run surface feature extract
        os.system('cd '+ os.path.abspath(self.cfd_folder)+' && surfaceFeatureExtract'+' > /dev/null')
    
        self.feature_files = []
        for file in glob.glob(os.path.abspath(self.cfd_folder)+"/constant/triSurface/**.eMesh"):
            self.feature_files.append(file)
        
        snappydir = os.path.abspath(self.cfd_folder)+'/system/snappyHexMeshDict'
        f = ParsedParameterFile(snappydir)

        file_entry =  "\"" + self.flow_vol_id + "\""
        f['geometry'] = {self.flow_vol_id: {'type': 'triSurfaceMesh', 'file': file_entry  , 'name': 'flow_vol'}}

        features_string = []
        for feature in self.feature_files:
            features_string.append({'file': "\"" + feature.split("/")[-1] + "\"", 'level': 3})

        f['castellatedMeshControls']['features'] = features_string
        f['castellatedMeshControls']['refinementSurfaces'] = {'flow_vol': {'level': [3, 3]}}
        f['castellatedMeshControls']['locationInMesh'] = "(" + str(self.empty_point[0]) +" " + str(self.empty_point[1]) +" " + str(1) + ")"
        f.writeFile()
    
    # run snappyHexMesh: create the mesh for CFD
    def snappyhexmesh(self):
        print(str(self.id)+' started meshing')
        os.system('cd '+ os.path.abspath(self.cfd_folder)+' && blockMesh && surfaceFeatureExtract && decomposePar && mpirun -np 4 snappyHexMesh -overwrite -parallel  &&  reconstructParMesh -constant && autoPatch -overwrite ' + str(autopatch_angle) +' && mv 0.org 0')

    # read in the surfaces created by openfoam, and save them as patches (= surfaces)
    def read_surfaces(self):
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        self.boundary_folder = self.cfd_folder + '/constant/polyMesh/'
        self.patches = []

        f = open(self.boundary_folder+'boundary')
        self.patch_file = f.readlines()
        
        write_lines = []
        pause_writing = False
        for i, line in enumerate(self.patch_file):
            if line.replace('\n','').isdigit():
                line = str(int(line)-1) + '\n'
            elif 'flow_vol' in line:
                pause_writing = True
            elif 'auto' in line:
                patch_name = line.split('\n')[0].strip()
                string = self.patch_file[i+4]
                start_face = [int(s) for s in string.replace(';','').split() if s.isdigit()]
                string = self.patch_file[i+3]
                nFaces = [int(s) for s in string.replace(';','').split() if s.isdigit()]
                self.patches.append(patch(patch_name,start_face[0],nFaces[0]))
                pause_writing = False
            elif 'patch' in line:
                line = line.replace('patch','wall')
            
            if pause_writing == False:
                write_lines.append(line)
        
        f = open(self.boundary_folder+'boundary',"w")
        f.writelines(write_lines)
        f.close()

    # read in faces created by OpenFOAM
    def read_faces(self):
        f = open(self.boundary_folder+'faces')
        self.faces = f.readlines()

        found_start = False
        faces = []

        for i, line in enumerate(self.faces):
            if line.find(")") == 0:
                break
            
            elif found_start:

                line = line.replace("("," ").replace(")"," ").split()[1::]
                faces.append([int(s) for s in line if s.isdigit() ])  

            elif line.find("(") == 0:
                    found_start = True
            
        self.faces = faces
    
    # read in points created by OpenFOAM
    def read_points(self):
        f = open(self.boundary_folder+'points')
        self.points = f.readlines()

        found_start = False
        points = []

        for i, line in enumerate(self.points):
            if line.find(")") == 0:
                break

            elif found_start:
                line = line.replace("("," ").replace(")"," ").split()[-1]
                points.append(float(line))    

            elif line.find("(") == 0:
                found_start = True
                    
        self.points = points
    
    def find_walls(self):
        for patch in self.patches:
            faces = self.faces[patch.start:patch.start+patch.nfaces]
            flattened = [val for sublist in faces for val in sublist]
            points = []
            minval = maxval = self.points[flattened[0]]

            for point in flattened:
                z = self.points[point]
                if z > maxval:
                    maxval = z 
                elif z<minval:
                    minval = z 
            
            patch.delta_z = maxval-minval
    
    # pick surfaces with largest vertical distance and largest size as inlet and outlet
    def pick_boundaries(self):
        dtype = [('ID','U10'),('nfaces',int),('delta_z',float)]

        patches = []
        for patch in self.patches:
            patches.append((patch.id,patch.nfaces,patch.delta_z))
        
        sort_arr = np.array(patches,dtype=dtype)
        sorted_arr = np.sort(sort_arr,order=['delta_z','nfaces'])
        
        if len(patches)>=top_surfaces:
            sorted_arr = sorted_arr[-top_surfaces:]
            idxs = random.sample(range(0, top_surfaces  ), 2)
        else:
            idxs = random.sample(range(0, len(patches)  ), 2) 
        
        self.inlet, self.outlet = sorted_arr[idxs[0]][0], sorted_arr[idxs[1]][0]

        for patch in self.patches:
            if patch.id == self.inlet:
                patch.type = 'inlet'
            elif patch.id == self.outlet:
                patch.type = 'outlet'

    # write boundary conditions to OpenFOAM files
    def set_boundary_conditions(self):
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        featuredir = os.path.abspath(self.cfd_folder)+'/0/'
        
        U = ParsedParameterFile(featuredir+'U')
        p = ParsedParameterFile(featuredir+'p')
        nut = ParsedParameterFile(featuredir+'nut')
        k = ParsedParameterFile(featuredir+'k')
        eps = ParsedParameterFile(featuredir+'epsilon')

        for patch in self.patches:
            if patch.type == 'wall':
                # U['boundaryField'][patch.id] = {'type': 'movingWallVelocity', 'value': 'uniform (0 0 0)'}
                U['boundaryField'][patch.id] = {'type': 'noSlip'}
                p['boundaryField'][patch.id] = {'type': 'zeroGradient'}
                nut['boundaryField'][patch.id] = {'type': 'nutkWallFunction','value':'uniform 0'}
                k['boundaryField'][patch.id] = {'type': 'kqRWallFunction','value':'uniform 0.00375'}
                eps['boundaryField'][patch.id] = {'type': 'epsilonWallFunction','value':'uniform 0.0125'}
            elif patch.type == 'outlet':
                U['boundaryField'][patch.id] = {'type': 'zeroGradient'}
                p['boundaryField'][patch.id] = {'type': 'fixedValue', 'value': 'uniform 0'}
                # nut['boundaryField'][patch.id] = {'type': 'nutkWallFunction','value':'uniform 0'}
                nut['boundaryField'][patch.id] = {'type': 'calculated','value':'uniform 0'}
                k['boundaryField'][patch.id] = {'type': 'zeroGradient'}
                eps['boundaryField'][patch.id] = {'type': 'zeroGradient'}
            elif patch.type == 'inlet':
                U['boundaryField'][patch.id] = {'type': 'surfaceNormalFixedValue', 'refValue': 'uniform -0.5 '}           
                p['boundaryField'][patch.id] = {'type': 'zeroGradient'}
                nut['boundaryField'][patch.id] = {'type': 'calculated','value':'uniform 0'}
                k['boundaryField'][patch.id] = {'type': 'fixedValue','value':'uniform 0.00375'}
                eps['boundaryField'][patch.id] = {'type': 'fixedValue','value':'uniform 0.0125'}
            
        U.writeFile()
        p.writeFile()
        nut.writeFile()
        k.writeFile()
        eps.writeFile()
    
    # run OpenFOAM pimpleFOAM
    def run_cfd(self):
        print(str(self.id)+' started cfd')
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        os.system('cd '+ os.path.abspath(self.cfd_folder) +'&& pimpleFoam')

    def make_ros_folder(self):
        self.ros_loc = os.path.abspath(gaden_env_dir) + '/' + self.id
        if os.path.exists(self.ros_loc):
            command = 'rm -rf ' + self.ros_loc

        command = 'mkdir -p ' + self.ros_loc
        os.system(command)
        command = 'cp -r ' + os.path.abspath(empty_ros_dir) + ' ' + self.ros_loc
        os.system(command)
      

    # obtain grid of wind vectors 
    def write_data(self):
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        os.system('cd '+ os.path.abspath(self.cfd_folder) +' && postProcess -func "components(U)" -latestTime && postProcess -func "writeCellCentres" -latestTime ')

    # prepare ROS directory with environment-specific configurations
    def prep_ros(self):

        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        last_step = np.max([float(step.split('/')[-1]) for step in glob.glob(self.cfd_folder+"/0.*") ])
        f = open(self.cfd_folder+"/"+str(last_step)+'/C')
        self.points_file = f.readlines()    
        self.points_x = []
        self.points_y = []
        self.points_z = []

        for i,line in enumerate(self.points_file):
            if i >=22:
                if line.find(")") == 0:
                    break
                
                line = line.replace("("," ").replace(")"," ").split()
                self.points_x.append(float(line[0]))
                self.points_y.append(float(line[1]))
                self.points_z.append(float(line[2]))
        
               
        timestep = flow_field(last_step)
        f = open(self.cfd_folder+"/"+str(last_step)+'/U')
        flow_data = f.readlines()    
        Ux = []
        Uy = []
        Uz = []

        for i,line in enumerate(flow_data):
            if i >=22:
                if line.find(")") == 0:
                    break
                
                line = line.replace("("," ").replace(")"," ").split()
                Ux.append(float(line[0]))
                Uy.append(float(line[1]))
                Uz.append(float(line[2]))
        
        timestep.Ux, timestep.Uy, timestep.Uz = Ux, Uy, Uz

        data = {'U:0': timestep.Ux, 'U:1':timestep.Uy,'U:2':  timestep.Uz,'Points:0':self.points_x,'Points:1':self.points_y,'Points:2':self.points_z}
        df = pd.DataFrame(data, columns= ['U:0','U:1','U:2','Points:0','Points:1','Points:2'])
        df.to_csv(self.ros_loc+'/wind_simulations/' +'_0.csv',index=False,header=True)
    
        ## move cad file to ROS
        self.env_cad_loc = self.cfd_folder + '/constant/triSurface/'+self.id+'_env.stl'
        self.ros_cad_loc = self.ros_loc+'/cad_models/walls.stl'
        command = 'cp  '+self.env_cad_loc+' '+ self.ros_cad_loc
        os.system(command)

        # get new empty point for source
        self.place_source()

        ## edit launch files
        self.ros_launch_folder = self.ros_loc + '/launch/'
        f = open(self.ros_launch_folder+'preprocessing.launch')
        lines = f.readlines()
        lines[5] = '    <arg name="scenario" default="'+self.id+ '"/>'

        lines[21] ='        <param name="empty_point_x" value="'+str(self.source_pos[1])+'"/>      ### (m)'
        lines[22] ='        <param name="empty_point_y" value="'+str(self.source_pos[0])+'"/>      ### (m)'
        lines[23] ='        <param name="empty_point_z" value="'+str(source_height)+'"/>      ### (m)'

        f = open(self.ros_launch_folder+'preprocessing.launch',"w")
        f.writelines(lines)
        f.close()

        f = open(self.ros_launch_folder+'gas_simulator.launch')

        lines = f.readlines()
        lines[6] = '    <arg name="scenario" default="'+self.id+ '"/>'
        lines[37] ='        <param name="source_position_x" value="'+str(self.source_pos[0])+'"/>      ### (m)'
        lines[38] ='        <param name="source_position_y" value="'+str(self.source_pos[1])+'"/>      ### (m)'
        lines[39] ='        <param name="source_position_z" value="'+str(source_height)+'"/>      ### (m)'

        f = open(self.ros_launch_folder+'gas_simulator.launch',"w")
        f.writelines(lines)
        f.close()

    # roslaunch GADEN preprocessing
    def run_preprocessing(self):
        os.system('cd '+self.ros_launch_folder+' && roslaunch preprocessing.launch')
        self.replace_occ_map()
        
    def run_ros(self):
        print(str(self.id)+' started filament simulator')
        os.system('cd '+self.ros_launch_folder+' && roslaunch gas_simulator.launch ')

    def replace_occ_map(self):
        occ_loc = self.ros_loc+'/occupancy.pgm'
        imageio.imwrite(occ_loc,cv2.resize(self.occ_map,(1000,1000)))



if __name__=="__main__":

    ## read in all environment binary pics folder 
    ## consult settings.py to change default 'env_pics_folder'
    environments = []
    for file in glob.glob(env_pics_folder+"/*.png"):
        environments.append(environment(os.path.abspath(file)))
    
    ## check if inversed folder exists, if not create
    ## inversed folder consists of environment topview images, but with black walls and white free space
    if not os.path.exists(os.path.abspath(env_pics_folder_inversed)):
        os.system('mkdir ' + env_pics_folder_inversed)

    # main loop, for each env
    for env in environments:
        # an environment may fail ocassionally, so we allow the simulator to have up to 'max_num_tries' (settings.py)
        tries = 0
        done = False
        
        while not done and tries < max_num_tries:
            env.invert_img() # generate and save the inverted image
            env.create_cfd_folder() # create a folder to store all wind information for OpenFOAM   
            env.extrude_imgs() # generates two CAD (.stl) files for visualization and CFD
            env.find_largest_space() #using OpenCV to localize the largest area in the provided topview: this will be our testing area
            env.pre_snappyhex() # prepare OpenFOAM folder for mesh generation using snappyHexMesh
            env.snappyhexmesh() # run snappyHexMesh: create the mesh for CFD

            # load in openFOAM-created mesh
            # surfaces, consisting of faces, which again consist of points
            env.read_surfaces()
            env.read_faces()
            env.read_points()

            env.find_walls() # determine orientation of the different surfaces/patches --> if vertical, possible outlet/inlet
            env.pick_boundaries() # pick surfaces with largest vertical distance and largest size as inlet and outlet
            env.place_source() # place source, decide and write source position with OpenCV
            env.set_boundary_conditions()  # write boundary conditions to OpenFOAM files
            env.run_cfd() # run OpenFOAM pimpleFOAM
            env.write_data() # obtain grid of wind vectors
            env.make_ros_folder() # make ROS directory to run GADEN
            env.prep_ros() # prepare ROS directory with environment-specific configurations
            env.run_preprocessing() # roslaunch GADEN preprocessing
            env.find_outlet() # correct the occupancy grid 
            env.run_ros() # run ROS: filament simulation
            
            print(str(env.id)+' finished cfd')
            done = True




        
