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

        i = 0
        while found_empty_point == False:
            x, y = random.randint(0,self.img_shape[0]), random.randint(0,self.img_shape[1])
            x_min, x_max, y_min, y_max = x-point_clearance, x+point_clearance, y-point_clearance, y+ point_clearance

            if (np.count_nonzero(out[y_min:y_max,x_min:x_max])== 0 and x_min>0 and y_min >0 and x_max < self.img_shape[0] and y_max < self.img_shape[1] ):
                self.empty_point = (x*(size_x/self.img_shape[1]),(size_y-y*(size_y/self.img_shape[0])))
                found_empty_point = True

            elif i>max_it:
                self.empty_point = (size_x/2,size_y/2)
                found_empty_point = True
                
        print(self.id)
        plt.imshow(out)
        plt.scatter(x,y)
        print(self.empty_point[0],self.empty_point[1])
        plt.show()

        # cv2.circle(out, (cX, cY), 7, (0, 255, 0), -1)

        # cv2.waitKey(0)

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
        f.writeFile()
    
    def snappyhexmesh(self):
        os.system('cd '+ os.path.abspath(self.cfd_folder)+' && blockMesh && snappyHexMesh')

        
if __name__=="__main__":
    #find out which number processor this particular instance is,
    #and how many there are in total
    rank = mpi4py.MPI.COMM_WORLD.Get_rank()
    size = mpi4py.MPI.COMM_WORLD.Get_size()

    # read in all environment pics
    environments = []
    for file in glob.glob(env_pics_folder+"/*"):
        environments.append(environment(os.path.abspath(file)))
    
    # check if inversed folder exists, if not create
    if not os.path.exists(os.path.abspath(env_pics_folder_inversed)):
        os.system('mkdir ' + env_pics_folder_inversed)

    for i,env in enumerate(environments):
        if i%size!=rank: continue
        env.invert_img()
        # env.create_cfd_folder()
        # env.extrude_imgs()
        # env.pre_snappyhex()
        env.find_largest_space()
    # for i,env in enumerate(environments):
    #     if i%size!=rank: continue
    #     env.snappyhexmesh()


        
