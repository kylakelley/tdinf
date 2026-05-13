import h5py
import numpy as np
import matplotlib.pyplot as plt

f = h5py.File("H-H1_GWOSC_16KHZ_R2-1242442952-32.hdf5", "r")

strain = f["strain"]["Strain"][:]
# Time spacing of LIGO data is 61 µs
dt = 0.000061
times = dt * np.arange(len(strain))

plt.plot(times, strain)
plt.xlabel('Time [s]')
plt.ylabel('Strain')
plt.show()
