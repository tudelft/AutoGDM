import os
import numpy as np 


occ_grid = '/home/bart/CFD_pipeline/simulation_ws/src/gaden/envs/ts_2/OccupancyGrid3D.csv'
f = open(occ_grid)
lines = f.readlines()

cells = (lines[2].split(' ')[1::])
cells_x, cells_y, cells_z = int(cells[0]), int(cells[1]), int(cells[2])
cell_size = float(lines[3].split(' ')[-1])
start_line = 4

x_min = 9.785714
x_max = 9.785714
y_min = 0.2142857
y_max = 4.928571

x_diff = 0.0
y_diff = 4.7142853

size_x = 10
size_y = 10
height = 2

## boundary in y-direction
if x_diff < y_diff:
    x_line = int(x_min/size_x*cells_x)
    y_line_min = int(y_min/size_y*cells_y)
    y_line_max = int(y_max/size_y*cells_y)

    x_lines = start_line+x_line+np.arange(cells_z)*(cells_x+1)
    
    for j in x_lines:
        line = lines[j]
        for i in np.arange(y_line_min,y_line_max+1):
            line = line[:i*2] + '2' + line[i*2+1:] 
        
        lines[j] = line

## boundary in x-direction
else:
    y_line = int(y_min/size_y*cells_y)
    x_line_min = int(x_min/size_x*cells_x)
    x_line_max = int(x_max/size_x*cells_x)
    
    first_line = x_line_min+start_line
    first_last_line = x_line_max+start_line

    x_lines = np.array([[np.arange(first_line+i*(cells_x+1),first_last_line+i*(cells_x+1))] for i in range(cells_z)]).flatten()    
    
    for j in x_lines:
        lines[j] = lines[j][:y_line*2] + '2' + lines[j][y_line*2+1:]

f = open(occ_grid,"w")
f.writelines(lines)
f.close()

# print(x_line_min,x_line_max)
# print(start_line)
# print(x_lines)
# for line in f.readlines():
#     print(line)