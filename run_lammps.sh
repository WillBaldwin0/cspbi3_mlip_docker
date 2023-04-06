export OMP_NUM_THREADS=1

# in the docker image, the serial lammps executable is lammps/build/lmp
export LAMMPS_COMMAND="/lammps/build/lmp"

# if running lammps in parallel, use mpirun -n $LAMMPS_COMMAND
$LAMMPS_COMMAND -in lammps_input.in

