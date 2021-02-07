# Project and Motivation

This program looks for, and visualises, phosphate sites within a set of caspase substrate cleavage sites. This is intended to build on my previous work of assembling a database of inflammatory caspase cleavage sites. This is primarily caspase-1, as many more substrates are known than for 4/5 and 11. The tools demonstrated in this script can be adapted to any protease site.

# Tech and Frameworks

Built in R and Python in the form of an integrated Rmarkdown script, ```main.rmd```.

This is machine learning intensive, so dependencies can be acquired most easily by configuring a conda environment (see below). Anaconda is built with mathematical-oriented tools not included in standard python installs, such as numpy and pandas. DeepPhos, from its [GitHub repository](https://github.com/USTC-HIlab/DeepPhos), does not run, but it has been modified and repaired to work here.

Pre-rendered example output graphs can be found in ```example-plots``` within the main project folder.

# Dependencies

The output of ```SessionInfo()``` can be found in xyz

* R 4.0
  * bookdown
  * fastDummies
  * [ggseqlogo](https://omarwagih.github.io/ggseqlogo/)
  * patchwork
  * plyr (in addition to tidyverse's dplyr)
  * janitor
  * knitr
  * reticulate
  * Rtsne
  * tidyverse

* Python 3.7
  * anaconda
  * h5py == 2.10.0 (While this is an anaconda library it will need version changing MANUALLY.)
  * keras = 2.3.1
  * scikit-learn = 0.24.1

# Credits

Particular thanks to Fenglin Luo et. al. and the USTCHI lab for their work on [DeepPhos](https://academic.oup.com/bioinformatics/article/35/16/2766/5270665), and Omar Wagih for developing [ggseqlogo](https://academic.oup.com/bioinformatics/article/33/22/3645/3980251).

# License

Published under GNU AGPL 3.0. Licensing terms are enclosed.

# Issues and Troubleshooting

## Install and configure ggseqlogo

Install ggseqlogo directly from github:

```
devtools::install_github("omarwagih/ggseqlogo")
```

If you get a corrupted download (lazy-load database corrupt error), download the library again setting ```FORCE = TRUE```, ie.

```
devtools::install_github("omarwagih/ggseqlogo", force = TRUE)
```

## Configuring Rstudio to run in an anaconda environment:

1) Install anaconda (https://www.anaconda.com/)

2) RStudio -> Preferences -> Python -> Select Python Interpreter

If you don't have an anaconda build in the list (with its green circular logo), you can build one at the same time as installing one of your dependencies.
```
conda_install('"my_environment_name", packages = "keras")
```

## Python diagnostics
There is an included python script, ```python-diagnostic.py``` to test any errors that come with custom datasets in a minimal environment- the error reporting comes out a bit better here.

## The python code does not work:
The majority of dependencies will be installed when you create an anaconda environment, but those that are likely missing can be installed with the below code. Running one of these statements in your R terminal will create an anaconda environment. Here I have called mine "re-reticulate" but it doesn't really matter. 

Manually change your h5py version to 2.10.0 - This is essential!

```
conda_install("re-reticulate", packages = "matplotlib")
conda_install("re-reticulate", packages = "scikit-learn")
conda_install("re-reticulate", packages = "keras")
```

## Custom dataset errors

If Python throws one of these:

```
results_ST = np.column_stack((ids, position,predictions_t[:, 1]))
TypeError: list indices must be integers or slices, not tuple 
```

This actually means that there are no examples of the criteria in your submitted dataset.


