# Tests if we can import pybag correctly.

# TODO: in pytest 7, this can be moved to pytest.ini
import sys
sys.path.append('_build/lib')

from pybag.enum import *
from pybag.core import *

def test_import():
    assert True
