FROM rocker/rstudio:4.4.2

# Switch to root for installation
USER root

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev

# Copy renv files
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.dcf renv/settings.dcf

# Switch back to rstudio user
USER rstudio

# Initialize and restore renv
RUN R -e 'install.packages("renv")'
RUN R -e 'renv::restore()'

# Copy your R script
COPY test-cowsay.R test-cowsay.R