from setuptools import setup, find_packages

setup(
    name='crime_test', # Package name
    version='1.0', # Package version
    packages=find_packages(), # Automatically find modules
    install_requires=[], # Dependencies, if any
    description='A package used on the lecture\'s Crime dataset', # Short description
    author='Steve Nguyen',
    author_email='steve.nguyen@sjsu.edu',
)
