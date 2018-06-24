#!/usr/bin/env python

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

# for your packages to be recognized by python
d = generate_distutils_setup(
 packages=['gpsr_rosplan_example', 'gpsr_rosplan_example_ros'],
 package_dir={'gpsr_rosplan_example': 'common/src/gpsr_rosplan_example', 'gpsr_rosplan_example_ros': 'ros/src/gpsr_rosplan_example_ros'}
)

setup(**d)
