#! /usr/bin/env bash

# get strain
#for IFO in H L V; do
#    curl -LO https://gwosc.org/archive/data/O4b_16KHZ_R1/1414529024/${IFO}-${IFO}1_GWOSC_O4b_16KHZ_R1-1415274496-4096.hdf5
#done

# get PE samples from 04_Discovery_Papers
curl -Lo GW241011_GW241110_data_release.tar.gz https://zenodo.org/api/records/17343574/files/GW241011_GW241110_data_release.tar.gz/content

# get PE samples from GWTC-5.0
curl -Lo GW241110_124123-combined_PEDataRelease https://zenodo.org/api/records/20348005/files/IGWN-GWTC5p0-29ebe06b7_25-GW241110_124123-combined_PEDataRelease.hdf5/content
