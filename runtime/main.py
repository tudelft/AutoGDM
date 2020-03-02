from settings import *
import glob
import os
import imageio
import mpi4py.MPI

class environment:
    def __init__(self,img_location):
        self.img_location = img_location
        self.id = img_location.split(".")[0].split('/')[-1]

    def invert_img(self):
        self.img = imageio.imread(self.img_location)
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
        self.env_cat_loc = self.cfd_folder + '/constant/polyMesh/'+self.id+'_env.stl'
        command = "java -jar "+java_loc+" -input_file "+ self.img_location + " -output_file "+ self.env_cat_loc + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) 
        os.system(command)

        # generate cad of inside environment for cfd
        self.env_flow_loc = self.cfd_folder + '/constant/polyMesh/'+self.id+'_flow_vol.stl'
        command = "java -jar "+java_loc+" -input_file "+ self.img_inverted_location + " -output_file "+ self.env_flow_loc + " -scale_x "+str(size_x)+ " -scale_y "+str(size_x)+ " -scale_z "+str(height) 
        os.system(command)


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
        env.create_cfd_folder()
        env.extrude_imgs()

        