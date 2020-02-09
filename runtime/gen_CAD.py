"""
Generating .stl files for CFD computations
"""
import sys
sys.path.insert(1,'../settings')

import argparse
from settings import *
import numpy as np
import cadquery as cq
from cadquery import exporters
from io import StringIO
import shutil
from PIL import Image
import matplotlib.pyplot as plt

class CAD:
    def __init__(self):
        self.size_x = size_x*mm_to_m
        self.size_y = size_y*mm_to_m
        self.size_z = size_z*mm_to_m

    def parse_settings(self):
        parser = argparse.ArgumentParser()

        # add long and short argument
        parser.add_argument("--input_file", help="input image")
        parser.add_argument("--output_file", help="output file (.stl)")

        # read arguments from the command line
        self.args = parser.parse_args()

    def read_image(self):
        # load image
        s = '../env_pics/'+str(self.args.input_file)
        self.image = Image.open(s)
        self.image = self.image.resize((img_size_x,img_size_y))

        # load image to numpy array
        raw_data = np.array(self.image.getdata())
        self.im_arr = raw_data.reshape(self.image.size[0],self.image.size[1])
        
        # compute pixel size, now that we know arena and image size
        self.pix_size_x = float(self.size_x/self.image.size[0])
        self.pix_size_y = float(self.size_y/self.image.size[1])
        self.corr_x = float(self.image.size[0]/2)
        self.corr_y = float(self.image.size[1]/2)

        # print(self.corr_x)
        # self.corr_x = 0
        # self.corr_y = 0

        # print(self.pix_size_x)
    def find_walls(self):
        
        self.walls_locs = np.argwhere(self.im_arr==empty_color)

        self.walls_locs_transformed = [(((wall[0]-self.corr_x+0.5)*self.pix_size_x),((wall[1]-self.corr_y+0.5)*self.pix_size_y)) for wall in self.walls_locs]
        self.walls_locs_transformed = self.walls_locs_transformed[0:10]
        # # self.walls_locs_transformed = self.walls_locs_transformed[0:100]
        # print(self.walls_locs)
        # print(self.walls_locs_transformed[0])
        # print(self.walls_locs_transformed[1])
        # self.walls_locs_transformed = []
        # for wall in self.walls_locs[0:10]:
        #     x_new = (wall[0]-self.corr_x+0.5)*self.pix_size_x
        #     y_new = (wall[1]-self.corr_y+0.5)*self.pix_size_y
        #     self.walls_locs_transformed.append((x_new,y_new))
        print(self.walls_locs)
        print(self.walls_locs_transformed)
        # print(self.walls_locs_transformed[0:10])
            
    def draw_outline(self):
        self.r = cq.Workplane("front").rect(self.size_x,self.size_y)

    def cave_out_inside(self):
        print("Caving out inside...")
        self.r = self.r.pushPoints(self.walls_locs_transformed)

        # 4. This circle() call will operate on all four points, putting a circle at
        #    each one.
        # self.r = self.r.rect((self.pix_size_x),(self.pix_size_y))
        # self.r = self.r.pushPoints([(-4750.0,-4750.0),(0,300)])
        self.r = self.r.rect((self.pix_size_x),(self.pix_size_y))
        self.r = self.r.extrude(self.size_z)

    def save_CAD(self):
        print("Saving CAD")
        s = StringIO()
        exporters.exportShape(self.r,exporters.ExportTypes.STL,s,0.1)
        output_loc = '../CAD_files/' + str(self.args.output_file)
        with open (output_loc, 'w') as fd:
            s.seek (0)
            shutil.copyfileobj (s, fd)
    
if __name__ == "__main__":
    CAD = CAD()
    CAD.parse_settings()
    CAD.read_image()
    CAD.find_walls()
    CAD.draw_outline()
    CAD.cave_out_inside()
    CAD.save_CAD()
