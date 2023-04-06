FROM python:3.7

## Generally useful python programs
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

RUN git clone https://github.com/lammps/lammps.git \
 && cd lammps/ \
 && git checkout ceb9466172398e9a20cb510528b4b17f719c7cf2 \
 && mkdir build \
 && cd build \
 && make -DCMAKE_BUILD_TYPE=Release -DPKG_ML-PACE=ON PKG_ML-PACE=yes BUILD_MPI=yes ../cmake \
 && make -j 4 serial mode=shlib \
 && cd .. \
 && LAMMPSPATH="/lammps/" \
 && cd ..

ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/lammps/src"