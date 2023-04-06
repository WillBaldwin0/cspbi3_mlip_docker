# CsPbI3 ACE potentials

This repository contains the, datasets MLIP parameter files and some example scripts for using the linear ACE potential developed in "Dynamic Local Structure in Caesium Lead Iodide: Spatial Correlation and Transient Domains".

## Datasets

The `datasets` folder contains the training and test sets, consisting of up to 160 atoms sampled from NPT and NVT simulations of the four phases of CsPbI3 which occur between 300K and 600K. The level of DFT theory is given in the methods section. Configurations are labelled via the "config_type" key in the `.info` dictionary. 

## using the ACE MLIP

We provide two parameter files. `a6train_N3D14_poly_pd8_rin2.32_iden_orthobrr.yace` is the many body ace potential, and `a6train_N3D14_poly_pd8_rin2.32_iden_orthobrr_pairpot.table` is an additional two body potential. To use these potentials in LAMMPS, please see the instructions [here](https://github.com/ICAMS/lammps-user-pace) to build LAMMPS with the ML-PACE package. Then, the potential can be loaded as in `lammps_input.in`.

Alternatively, a docker image with a working lammps installation and the required files is available at https://hub.docker.com/repository/docker/willbaldwin0/cspbi3_mlip_lammps/general.

The `Dockerfile` can also be used as instructions for building LAMMPS with the ML-PACE package. 