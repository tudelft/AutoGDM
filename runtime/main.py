from settings import *
import glob
import os
import imageio
import mpi4py.MPI
from PyFoam.RunDictionary.ParsedParameterFile import ParsedParameterFile
import cv2
import imutils
import numpy as np
import matplotlib.pyplot as plt
import random
import pandas as pd
from multiprocessing import Pool


class patch:
    def __init__(self, id, start_face, nfaces ):
        self.id = id
        self.start = start_face
        self.nfaces = nfaces
        self.type = 'wall'

class flow_field:
    def __init__(self,id):
        self.id = id

class environment:
    def __init__(self,img_location):
        self.img_location = img_location
        self.id = img_location.split(".")[0].split('/')[-1]
        

    def invert_img(self):
        print('Started env:'+str(self.id))
        self.img = imageio.imread(self.img_location)
        self.img_shape = np.shape(self.img)
        self.img_inverted = -(self.img-255)
        self.img_inverted_location = os.path.abspath(env_pics_folder_inversed) + '/' + self.id +'.png'
        imageio.imwrite(self.img_inverted_location,self.img_inverted)
        
    def create_cfd_folder(self):
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        if os.path.exists(self.cfd_folder):
            os.system('rm -r '+ self.cfd_folder)

        command = 'cp -r ' + os.path.abspath(empty_cfd_dir) + ' ' +os.path.abspath(self.cfd_folder)
        os.system(command)

    def extrude_imgs(self):

        # generate cad of environment for sim
        self.env_cat_loc = self.cfd_folder + '/constant/triSurface/'+self.id+'_env.stl'
        command = "java -jar "+java_loc+" -input_file "+ self.img_location + " -output_file "+ self.env_cat_loc + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) +' > /dev/null'
        os.system(command)

        # generate cad of inside environment for cfd
        self.env_flow_loc = self.cfd_folder + '/constant/triSurface/'+self.id+'_flow_vol.stl'
        command = "java -jar "+java_loc+" -input_file "+ self.img_inverted_location + " -output_file "+ self.env_flow_loc + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) + ' > /dev/null'
        os.system(command)


    def find_largest_space(self):
        image = cv2.imread(self.img_inverted_location)

        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY)[1]
        cnts = cv2.findContours(thresh, cv2.RETR_LIST,cv2.CHAIN_APPROX_SIMPLE)
        cnts = imutils.grab_contours(cnts)
        num_cnts = np.shape(cnts)[0]
        out = np.zeros_like(image)
        areas = np.array([])
        # loop over the contours
        for c in cnts:
            areas = np.append(areas,cv2.contourArea(c))

        cv2.drawContours(out, [cnts[np.argmax(areas)]], -1, (0, 255, 0), 1)
        cnts = np.delete(cnts,np.argmax(areas))

        if num_cnts>1:
            for c in cnts:
                cv2.drawContours(out, [c], -1, (0, 255, 0), -1)

        out  = out + cv2.imread(self.img_location)
        out = np.array(cv2.threshold(cv2.cvtColor(out, cv2.COLOR_BGR2GRAY), 0, 255, cv2.THRESH_BINARY)[1])

        i=0
        found_empty_point = False 
        while found_empty_point == False:
            x, y = random.randint(0,self.img_shape[0]), random.randint(0,self.img_shape[1])
            x_min, x_max, y_min, y_max = x-point_clearance, x+point_clearance, y-point_clearance, y+ point_clearance

            if (np.count_nonzero(out[y_min:y_max,x_min:x_max])== 0 and x_min>0 and y_min >0 and x_max < self.img_shape[0] and y_max < self.img_shape[1] ):
                self.empty_point = (x*(size_x/self.img_shape[1]),(size_y-y*(size_y/self.img_shape[0])))
                found_empty_point = True

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
        
        print("xmin, xmax : (%f,%f)"% (x_min,x_max))
        print("ymin, ymax : (%f,%f)"% (y_min,y_max))

    def place_source(self):
        for patch in self.patches:
            if patch.id == self.inlet:
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
        if x<x_mid and y<y_mid:
            image = image[im_x_mid:,:im_y_mid]
            original_img = original_img[im_x_mid:,:im_y_mid]
            self.source_pos = np.array([0.,0.])
        elif x>=x_mid and y<y_mid:
            image = image[im_x_mid:,im_y_mid:]
            original_img = original_img[im_x_mid:,:im_y_mid]
            self.source_pos = np.array([x_mid,0.])
        elif x>=x_mid and y>=y_mid:
            image = image[:im_x_mid,im_y_mid:]
            original_img = original_img[im_x_mid:,:im_y_mid]
            self.source_pos = np.array([x_mid,y_mid])
        elif x<x_mid and y>y_mid:
            image = image[:im_x_mid,:im_y_mid]
            original_img = original_img[im_x_mid:,:im_y_mid]
            self.source_pos = np.array([0.,y_mid])
        
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
    
    def snappyhexmesh(self):
        print(str(self.id)+' started meshing')
        os.system('cd '+ os.path.abspath(self.cfd_folder)+' && blockMesh && surfaceFeatureExtract && decomposePar && mpirun -np 8 snappyHexMesh -overwrite -parallel &&  reconstructParMesh -constant && autoPatch -overwrite ' + str(autopatch_angle) +' && mv 0.org 0')
        
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
    
    def pick_boundaries(self):
        dtype = [('ID','U10'),('nfaces',int),('delta_z',float)]

        patches = []
        for patch in self.patches:
            patches.append((patch.id,patch.nfaces,patch.delta_z))
        
        sort_arr = np.array(patches,dtype=dtype)
        sorted_arr = np.sort(sort_arr,order=['delta_z','nfaces'])
        
        print(np.shape(sorted_arr))
        if len(patches)>=top_surfaces:
            sorted_arr = sorted_arr[-top_surfaces:]
            idxs = random.sample(range(0, top_surfaces  ), 2)
        else:
            idxs = random.sample(range(0, len(patches)  ), 2) 
        
        print(np.shape(sorted_arr))
        self.inlet, self.outlet = sorted_arr[idxs[0]][0], sorted_arr[idxs[1]][0]

        for patch in self.patches:
            if patch.id == self.inlet:
                patch.type = 'inlet'
            elif patch.id == self.outlet:
                patch.type = 'outlet'


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
                U['boundaryField'][patch.id] = {'type': 'surfaceNormalFixedValue', 'refValue': 'uniform -3 '}           
                p['boundaryField'][patch.id] = {'type': 'zeroGradient'}
                nut['boundaryField'][patch.id] = {'type': 'calculated','value':'uniform 0'}
                k['boundaryField'][patch.id] = {'type': 'fixedValue','value':'uniform 0.00375'}
                eps['boundaryField'][patch.id] = {'type': 'fixedValue','value':'uniform 0.0125'}
            
        U.writeFile()
        p.writeFile()
        nut.writeFile()
        k.writeFile()
        eps.writeFile()
    
    def run_cfd(self):
        print(str(self.id)+' started cfd')
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        os.system('cd '+ os.path.abspath(self.cfd_folder) +'&& pimpleFoam')

    def make_ros_folder(self):
        self.ros_loc = os.path.abspath(gaden_env_dir) + '/' + self.id
        if not os.path.exists(self.ros_loc):
            command = 'cp -r ' + os.path.abspath(empty_ros_dir) + ' ' + self.ros_loc
            os.system(command)
        else:
            command = 'rm -rf ' + self.ros_loc + ' && cp -r ' + os.path.abspath(empty_ros_dir) + ' ' + self.ros_loc
            os.system(command)       

    def write_data(self):
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        os.system('cd '+ os.path.abspath(self.cfd_folder) +' && postProcess -func "components(U)" -latestTime && postProcess -func "writeCellCentres" -latestTime ')

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

        # command = 'cd ' + self.ros_loc+'/cad_models  && meshlabserver -i walls.stl -o walls.dae '
        # os.system(command)

        # get new empty point for source
        self.place_source()

        ## edit launch files
        self.ros_launch_folder = self.ros_loc + '/launch/'
        f = open(self.ros_launch_folder+'preprocessing.launch')
        lines = f.readlines()
        lines[5] = '    <arg name="scenario" default="'+self.id+ '"/>'

        lines[20] ='        <param name="empty_point_x" value="'+str(self.source_pos[0])+'"/>      ### (m)'
        lines[21] ='        <param name="empty_point_y" value="'+str(self.source_pos[1])+'"/>      ### (m)'
        lines[22] ='        <param name="empty_point_z" value="'+str(source_height)+'"/>      ### (m)'

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

    def run_ros(self):
        print(str(self.id)+' started filament simulator')
        os.system('cd '+self.ros_launch_folder+' && roslaunch preprocessing.launch && roslaunch gas_simulator.launch ')

def run_ros_loop(env):
    tries = 0
    done = False

    while not done and tries < max_num_tries:
        try:
            env.make_ros_folder()
            env.prep_ros()
            env.run_ros()
            print(str(env.id)+' finished ros')
            done = True
        except:
            print(env.id+' failed')
            tries+=1



if __name__=="__main__":
    # #find out which number processor this particular instance is,
    # #and how many there are in total
    rank = mpi4py.MPI.COMM_WORLD.Get_rank()
    size = mpi4py.MPI.COMM_WORLD.Get_size()

    # # read in all environment pics
    environments = []
    for file in glob.glob(env_pics_folder+"/*"):
        environments.append(environment(os.path.abspath(file)))
    
    # # check if inversed folder exists, if not create
    if not os.path.exists(os.path.abspath(env_pics_folder_inversed)):
        os.system('mkdir ' + env_pics_folder_inversed)

    for env in environments:
        tries = 0
        done = False
        while not done and tries < max_num_tries:
            try:
                env.invert_img()
                env.create_cfd_folder()
                env.extrude_imgs()
                env.find_largest_space()
                env.pre_snappyhex()
                env.snappyhexmesh()
                env.read_surfaces()
                env.read_faces()
                env.read_points()
                env.find_walls()
                env.pick_boundaries()
                env.place_source()
                env.set_boundary_conditions()  
                env.find_outlet()    
                # env.run_cfd()
                # env.write_data()
                # env.make_ros_folder()
                # env.prep_ros()
                # env.run_ros()
                print(str(env.id)+' finished cfd')
                done = True
            except:
                print(env.id+' failed')
                tries+=1
    
    # pool = Pool()
    # pool.map(run_ros_loop,environments)



        
