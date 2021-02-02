# Project and Motivation

This program looks for, and visualises, phosphate sites within a set of caspase substrate cleavage sites. This is intended to build on my previous work of assembling a database of inflammatory caspase cleavage sites. This is primarily caspase-1, as many more substrates are known than for 4/5 and 11.

# Tech and Frameworks

This is machine learning intensive, so dependencies can be acquired most easily by configuring a conda environment (see below). Anaconda is built with mathematical-oriented tools not included in standard python installs, such as numpy and pandas.

DeepPhos, from its GitHub repository (https://github.com/USTC-HIlab/DeepPhos), does not run, but I have repaired it in line with its license for use in this program.

# Dependencies

The output of ```SessionInfo()``` can be found in xyz

### Core

R 4.0
Python 3.7 - Anaconda 

### Python Libraries 

h5py == 2.10.0 (While this is an anaconda library it will need version changing MANUALLY.)

keras = 2.3.1

scikit-learn = 0.24.1

### R Packages

tidyverse

citr?

reticulate

ggseqlogo (https://omarwagih.github.io/ggseqlogo/)


# Credits
# License

# Troubleshooting


## Configuring Rstudio to run in an anaconda environment:

1) Install anaconda (https://www.anaconda.com/)

2) RStudio -> Preferences -> Python -> Select Python Interpreter

If you don't have an anaconda build in the list (with its green circular logo), you can build one at the same time as installing one of your dependencies.
```
conda_install('my_environment_name', packages = 'keras')
```

## The python code does not work:
The majority of dependencies will be installed when you create an anaconda environment, but those that are likely missing can be installed with the below code. Running one of these statements in your R terminal will create an anaconda environment. Here I have called mine "re-reticulate" but it doesn't really matter. 

Manually change your h5py version to 2.10.0 - This is essential!

```
conda_install('re-reticulate', packages = 'matplotlib')
conda_install('re-reticulate', packages = 'scikit-learn')
conda_install('re-reticulate', packages = 'keras')
```
