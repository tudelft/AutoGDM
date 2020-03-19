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
        command = "java -jar "+java_loc+" -input_file "+ self.img_location + " -output_file "+ self.env_cat_loc + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) 
        os.system(command)

        # generate cad of inside environment for cfd
        self.env_flow_loc = self.cfd_folder + '/constant/triSurface/'+self.id+'_flow_vol.stl'
        command = "java -jar "+java_loc+" -input_file "+ self.img_inverted_location + " -output_file "+ self.env_flow_loc + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) 
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
        

    def pre_snappyhex(self):

        # pointing surfaceFeatureExtract to the right .stl file
        featuredir = os.path.abspath(self.cfd_folder)+'/system/surfaceFeatureExtractDict'
        f = ParsedParameterFile(featuredir)
        self.flow_vol_id = self.env_flow_loc.split('/')[-1]
        f[self.flow_vol_id] = {'extractionMethod': 'extractFromSurface', 'extractFromSurfaceCoeffs': {'includedAngle': 120}} 
        f.writeFile()
        
        # run surface feature extract
        os.system('cd '+ os.path.abspath(self.cfd_folder)+' && surfaceFeatureExtract')
    
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
        os.system('cd '+ os.path.abspath(self.cfd_folder)+' && blockMesh && snappyHexMesh -overwrite && autoPatch -overwrite ' + str(autopatch_angle))
        
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
        sorted_arr = sorted_arr[-top_surfaces::]
        
        idxs = random.sample(range(0, top_surfaces  ), 2)
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
                U['boundaryField'][patch.id] = {'type': 'fixedValue', 'value': 'uniform (0 10 0)'}           
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
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        os.system('cd '+ os.path.abspath(self.cfd_folder) +' && pimpleFoam')

    def export_csv(self):
        self.cfd_folder = os.path.abspath(cfd_dir) + '/' + self.id
        # os.system('cd '+ os.path.abspath(self.cfd_folder) +' && postProcess -func "components(U)" && postProcess -func "writeCellCentres"  ')

        f = open(self.cfd_folder+'/0/C')
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
        
        self.flow_fields = []

        for folder in glob.glob(self.cfd_folder+"/0.*"):

            timestep = flow_field(folder.split('/')[-1])
            f = open(folder+'/U')
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
            self.flow_fields.append(timestep)
        
        for timestep in self.flow_fields:
            data = {'U:0': timestep.Ux, 'U:1':timestep.Uy,'U:2':  timestep.Uz,'Points:0':self.points_x,'Points:1':self.points_y,'Points:2':self.points_z}
            df = pd.DataFrame(data, columns= ['U:0','U:1','U:2','Points:0','Points:1','Points:2'])
            df.to_csv(self.cfd_folder+'/csv/' + timestep.id+'.csv',index=False,header=True)
            


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

    # for i,env in enumerate(environments):
    #     if i%size!=rank: continue
    #     env.invert_img()
    #     env.create_cfd_folder()
    #     env.extrude_imgs()
    #     env.find_largest_space()
    #     env.pre_snappyhex()
    #     env.snappyhexmesh()
    #     env.read_surfaces()
    #     env.read_faces()
    #     env.read_points()
    #     env.find_walls()
    #     env.pick_boundaries()
    #     env.set_boundary_conditions()
    
    for i,env in enumerate(environments):
        if i%size!=rank: continue
        # env.run_cfd()
        env.export_csv()


        
