"""
Generating .stl files for CFD computations
"""

import sys
sys.path.insert(1,'../settings')

from settings import *
from stl import mesh
import math
import numpy

class CAD:
    def __init__(self):
        self.size_x = size_x
        self.size_y = size_y
        self.size_z = size_z

    def draw_outline(self):
        data = numpy.zeros(6, dtype=mesh.Mesh.dtype)
        # Top of the cube
        data['vectors'][0] = numpy.array([[0, 1, 1],
                                        [1, 0, 1],
                                        [0, 0, 1]])
        data['vectors'][1] = numpy.array([[1, 0, 1],
                                        [0, 1, 1],
                                        [1, 1, 1]])
        # Front face
        data['vectors'][2] = numpy.array([[1, 0, 0],
                                        [1, 0, 1],
                                        [1, 1, 0]])
        data['vectors'][3] = numpy.array([[1, 1, 1],
                                        [1, 0, 1],
                                        [1, 1, 0]])
        # Left face
        data['vectors'][4] = numpy.array([[0, 0, 0],
                                        [1, 0, 0],
                                        [1, 0, 1]])
        data['vectors'][5] = numpy.array([[0, 0, 0],
                                        [0, 0, 1],
                                        [1, 0, 1]])