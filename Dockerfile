FROM rocker/rstudio:4.4.2

# Install remotes package first
RUN R -e 'install.packages("remotes")'

# Install a specific version of a package (for example, tidyverse)
RUN R -e 'remotes::install_version("tidyverse", version = "2.0.0")'