# Setup script for Pybag

These scripts follow the instructions outlined on the [RTD page](https://bag3-readthedocs.readthedocs.io/en/latest/dependencies/).

NOTE: this setup has only been tested on Ubuntu 20.04. Support for 22.04 has not been formally verified.

## Files
- `README.md`: this file
- `setup_script.sh`: run script. Installs the dependencies as decribed in the RTD.
- `project-config.template`: a Jinja render template for creating the `project-config.jam` file for the Boost library.
- `render_template.py`: script to render `project-config.template`

## Usage
1) Install the following dependencies using `apt`: 
`autoconf curl gcc-8 g++-8 git libtool libltdl-dev pkg-config make`
2) Install [Miniconda](https://docs.anaconda.com/miniconda/miniconda-install/) and create the environment using the [environment.yml](https://github.com/ucb-art/pybag/environment.yml) file.
3) Make an `install` directory to install the dependencies and copy all the files from here to `install`.
4) Run `./setup_script.sh`

Now you are ready to build `pybag`.
