FROM python:3.7


# Generally useful python programs
RUN pip install --upgrade pip \
 && pip install --no-cache-dir \
        numpy \
        scipy \
        scikit-learn\
        scikit-build\
        matplotlib \
        pandas \
        seaborn \ 
        tqdm

RUN apt-get -y update \
 && apt-get upgrade -y \ 
 && apt-get install -y \
 cmake 


RUN git clone https://github.com/lammps/lammps.git \
 && cd lammps/ \
 && git checkout ceb9466172398e9a20cb510528b4b17f719c7cf2 \
 && mkdir build \
 && cd build \
 && cmake -DCMAKE_BUILD_TYPE=Release -DPKG_ML-PACE=ON PKG_ML-PACE=yes BUILD_MPI=yes ../cmake \
 && make -j 4 \
 && cd .. \
 && LAMMPSPATH="/lammps/" \
 && cd ..


RUN cd home \
 && mkdir cspbi3_mlip_demonstration \
 && mkdir cspbi3_mlip_demonstration/datasets \
 && mkdir cspbi3_mlip_demonstration/mlip_potential_files


# copying from my local machine
COPY lammps_input.in run_lammps.sh start.data /home/cspbi3_mlip_demonstration
COPY datasets /home/cspbi3_mlip_demonstration/datasets
COPY mlip_potential_files /home/cspbi3_mlip_demonstration/mlip_potential_files


ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/lammps/src"