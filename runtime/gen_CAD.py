"""
Generating .stl files for CFD computations
"""
import sys
sys.path.insert(1,'../settings')

import argparse
from settings import *
import numpy
import cadquery as cq
from cadquery import exporters
from io import StringIO
import shutil
from PIL import Image

class CAD:
    def __init__(self):
        self.size_x = size_x
        self.size_y = size_y
        self.size_z = size_z

    def parse_settings(self):
        parser = argparse.ArgumentParser()

        # add long and short argument
        parser.add_argument("--input_file", help="input image")
        parser.add_argument("--output_file", help="output file (.stl)")

        # read arguments from the command line
        self.args = parser.parse_args()

    def draw_outline(self):
        self.r = cq.Workplane("front").rect(self.size_x,self.size_y)

    def read_image(self):
        s = '../env_pics/'+str(self.args.input_file)
        self.image = Image.open(s)
        self.image.show()

if __name__ == "__main__":
    CAD = CAD()
    CAD.parse_settings()
    CAD.read_image()
