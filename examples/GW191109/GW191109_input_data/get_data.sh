#! /usr/bin/env bash

# get strain
#for IFO in H L V; do
#curl -LO https://gwosc.org/eventapi/html/GWTC-3-confident/GW191109_010717/v1/${IFO}-${IFO}1_GWOSC_16KHZ_R1-1257294808-4096.hdf5

# get PE samples 
curl -LO https://zenodo.org/api/records/8177023/files/IGWN-GWTC3p0-v2-GW191109_010717_PEDataRelease_mixed_cosmo.h5/content
