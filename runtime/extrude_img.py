# script to run the java (Extrude.jar) script that extrudes top views of environments

from settings import *
import os
import glob

def extrude_imgs():
    i = 0
    for file in glob.glob(input_folder+"*"):
        # compute absolute paths
        input_path = os.path.abspath(file)
        output_path = os.path.abspath(output_folder + input_path.split(".")[0].split('/')[-1]+".stl")
        
        # execute command
        command = "java -jar "+java_loc+" -input_file "+ input_path + " -output_file "+ output_path + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) 
        os.system(command)
        print(i)
        i+=1
    # os.system('rm -rf test')


if __name__=="__main__":
    extrude_imgs()