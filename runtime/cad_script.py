from stl import mesh
import numpy as np
import os
# Create 3 faces of a cube
data = np.zeros(2, dtype=mesh.Mesh.dtype)
x_min = 9.8
x_max = 9.8
x_diff = np.abs(x_max-x_min)

y_min = 0.2
y_max = 9.8
y_diff = np.abs(y_max-y_min)

z_min = 0
z_max = 2

if y_diff > x_diff:
    # Top of the cube
    data['vectors'][0] = np.array([[x_min, y_min, z_min],
                                    [x_min, y_max, z_min],
                                    [x_min,y_min,z_max]])
    data['vectors'][1] = np.array([[x_min,y_max,z_min],
                                    [x_min,y_max,z_max],
                                    [x_min,y_min,z_max]])
else:
    data['vectors'][0] = np.array([[x_min,y_min,z_min],
                                    [x_max,y_min,z_min],
                                    [x_min,y_min,z_max]])
    data['vectors'][1] = np.array([[x_max,y_min,z_min],
                                    [x_max,y_min,z_max],
                                    [x_min,y_min,z_max]])    
# Since the cube faces are from 0 to 1 we can move it to the middle by
# substracting .5


mesh = mesh.Mesh(data.copy())
mesh.save(os.path.abspath('../plate.stl'))

