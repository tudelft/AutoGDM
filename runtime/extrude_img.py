# script to run the java (Extrude.jar) script that extrudes top views of environments

from settings import *
import os
import glob
import imageio
import numpy as np
import matplotlib.pyplot as plt

WALLS = 0
INSIDE = 1

def extrude_imgs(extrude_inside):
    i = 0

    if extrude_inside:
        input_folder = walls_input_folder
        output_folder = walls_output_folder
    else:
        input_folder = inside_input_folder
        output_folder = inside_output_folder

    for file in glob.glob(input_folder+"*"):
        if i ==0:
            # compute absolute paths
            input_path = os.path.abspath(file)
            output_path = os.path.abspath(output_folder + input_path.split(".")[0].split('/')[-1]+".stl")
            
            # execute command
            command = "java -jar "+java_loc+" -input_file "+ input_path + " -output_file "+ output_path + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) 
            os.system(command)
            print(i)
            i+=1
    # os.system('rm -rf test')

def invert_imgs():
    for file in glob.glob(walls_input_folder+"*"):
        im = imageio.imread(file)
        im = -(im-255)
        path = inside_input_folder + file.split('/')[-1]
        imageio.imwrite(path,im)

if __name__=="__main__":
    invert_imgs()
    extrude_imgs(0)
    extrude_imgs(1)