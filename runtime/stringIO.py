import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d, Axes3D #<-- Note the capitalization! 

f = open('iteration_51.txt')
lines = f.readlines()


coords_x = []
coords_y = []
coords_z = []
gas_conc = []
for i, line in enumerate(lines):
    if i >= 7:
        reads = line.replace('\n','').split(' ')
        if float(reads[2])== 0 :
            coords_x.append(float(reads[0]))
            coords_y.append(float(reads[1]))
            coords_z.append(float(reads[2]))
            gas_conc.append(float(reads[3]))



fig = plt.figure()
ax = Axes3D(fig)
slice = False

if slice:
    ax.scatter(coords_x[0:-1:10],coords_y[0:-1:10],coords_z[0:-1:10],c=gas_conc[0:-1:10])

else:
    ax.scatter(coords_x,coords_y,coords_z,c=gas_conc)

plt.show()