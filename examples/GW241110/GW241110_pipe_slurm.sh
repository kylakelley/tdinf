#! /usr/bin/env bash

# Example for running TDinf code using the slurm pipeline. 

tdinf_slurm_pipe \
    --modes full pre \
    --times_list -0.1 -0.05 -0.025 0 \
    --output_directory output_GW241110_260708_IMR_20k_-0p1_-0p05_-0p025_0 \
    --config_file GW241110_IMRPhenomXPNR.ini \
    --overwrite \
    --time 3-0 \
    --ntasks 7 \
    --split-jobs \
    --partition hpc \
    --no-disbatch \
    --mem 65G
     

# -------------------------------
# Explanation of arguments 
# --------------------------------
# --modes full pre post      | This runs on full signal, and pre/post t = {-0.05, 0, 0.05} seconds from merger. 
# --times_list -0.05 0 0.05  | NOTE: Could alternatively pass --cycles_list to cut in # of cycles rather than seconds.
# --output_directory output  | The output is put in a folder called `output` inside the current directory. 
# --config_file GW241110.ini | Path to the config file.
# --overwrite   | If `output` directory already exists, overwrite it.
# --time 3-0    | Request three days for running.
# --ntasks 7    | Full + pre three times + post three times = 7 tasks for slurm to run.
# --submit      | Submit job to slurm automatically. If excluded, then must manually run: ./output/submit.sh
