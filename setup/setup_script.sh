# Setup script

# CHANGE THIS
export CONDA_ENV_PATH=${CONDA}/envs/bag_py3d7_c

export CC=gcc-8
export CXX=g++-8

# cmake
wget https://github.com/Kitware/CMake/releases/download/v3.17.0/cmake-3.17.0.tar.gz
tar -xvf cmake-3.17.0.tar.gz
cd cmake-3.17.0
./bootstrap --prefix=$CONDA_ENV_PATH --parallel=4
make -j4
make install
cd ../

# magic enum
git clone https://github.com/Neargye/magic_enum.git
cd magic_enum
cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release -DMAGIC_ENUM_OPT_BUILD_EXAMPLES=FALSE -DMAGIC_ENUM_OPT_BUILD_TESTS=FALSE -DCMAKE_INSTALL_PREFIX=$CONDA_ENV_PATH
cmake --build build
cd build
make install
cd ../../

# yaml cpp
git clone https://github.com/jbeder/yaml-cpp.git
cd yaml-cpp
cmake -B_build -H. -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DCMAKE_INSTALL_PREFIX=$CONDA_ENV_PATH
cmake --build _build --target install -- -j 4
cd ../

# libfyaml
git clone https://github.com/pantoniou/libfyaml.git
cd libfyaml
./bootstrap.sh
./configure --prefix=$CONDA_ENV_PATH
make -j12
make install
cd ../

# HDF5 1.10
wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.6/src/hdf5-1.10.6.tar.gz
tar -xvf hdf5-1.10.6.tar.gz
cd hdf5-1.10.6
./configure --prefix=$CONDA_ENV_PATH
make -j24
make install
cd ../

# Boost
wget https://boostorg.jfrog.io/artifactory/main/release/1.72.0/source/boost_1_72_0.tar.gz
tar -xvf boost_1_72_0.tar.gz
cd boost_1_72_0
./bootstrap.sh --prefix=$CONDA_ENV_PATH --without-icu

# edit project-config.jam
# Create by rendering python
cd ../
python render_template.py

# TODO: run ./b2
cd boost_1_72_0
./b2 --build-dir=_build cxxflags=-fPIC -j8 -target=shared,static --with-filesystem --with-serialization --with-program_options --project-config=../project-config.jam install | tee install.log