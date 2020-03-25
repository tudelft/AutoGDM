import numpy as np
import mpi4py.MPI

rank = mpi4py.MPI.COMM_WORLD.Get_rank()
size = mpi4py.MPI.COMM_WORLD.Get_size()

for i in range(10):
        if i%size!=rank: continue
        print(i)