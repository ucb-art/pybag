# PYBAG

Python wrapper for [CBAG](https://github.com/ucb-art/cbag) library for BAG3++.

## Setup

This library should be used with [BAG3++](https://github.com/ucb-art/bag). To setup BAG, follow the instructions outlined on the [RTD page](https://bag3-readthedocs.readthedocs.io/en/latest/dependencies/).

Alternative, if you are using Ubuntu, you can use the `setup_script.sh` under the `setup` directory. This runs the steps described in the RTD page above. See the `setup/README.md` for discussion.

To build the `pybag` library, run `./run_test.sh`. This will compile `cbag` as well as create the `pybag` Python wrappers for `BAG`.

Running `./run_test.sh`requires the `PYBAG_PYTHON` environment variable be set to the Python from your Miniconda install from the setup process.

## Licensing

This library is licensed under the Apache-2.0 license.  However, some source files are licensed
under both Apache-2.0 and BSD-3-Clause license, meaning that the user must comply with the
terms and conditions of both licenses.  See [here](LICENSE.BSD-3-Clause) for full text of the
BSD license, and [here](LICENSE.Apache-2.0) for full text of the Apache license.  See individual
files to check if they fall under Apache-2.0, or both Apache-2.0 and BSD-3-Clause.
