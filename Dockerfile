################################################################################
### 
### [CONTAINER CORE FUNCTIONS]: 
###     install "Batch Correction" Galaxy tool (and required third part softwares, libraries, ...).
### [NOTE]
###     please refer to README.md and about_docker.md files for further informations
### 
################################################################################

################################################################################
### fix parent containter
FROM container-registry.phenomenal-h2020.eu/phnmnl/rbase

################################################################################
### set author
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

################################################################################
### set metadata
ENV TOOL_NAME=batch_correction
ENV TOOL_VERSION=2.2.3
ENV CONTAINER_VERSION=1.1
ENV CONTAINER_GITHUB=https://github.com/phnmnl/container-batch_correction

LABEL version="${CONTAINER_VERSION}"
LABEL software.version="${TOOL_VERSION}"
LABEL software="${TOOL_NAME}"
LABEL base.image="ubuntu:16.04"
LABEL description="A filter for samples and/or variables."
LABEL website="${CONTAINER_GITHUB}"
LABEL documentation="${CONTAINER_GITHUB}"
LABEL license="${CONTAINER_GITHUB}"
LABEL tags="Metabolomics"

################################################################################
# Install
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y libcurl4-openssl-dev libxml2-dev libssl-dev liblapack-dev libblas-dev gfortran wish git make gcc g++ && \
    git clone --recurse-submodules --single-branch -b v${TOOL_VERSION} https://github.com/workflow4metabolomics/batch_correction.git /files/batch_correction  && \
    echo 'options("repos"="http://cran.rstudio.com")' >> /etc/R/Rprofile.site && \
    R -e "install.packages(c('batch', 'ade4', 'RUnit'), dep=TRUE)" && \
    R -e "source('http://www.bioconductor.org/biocLite.R'); biocLite(c('pcaMethods', 'ropls'))" && \
    chmod a+x /files/batch_correction/batch_correction_docker_wrapper.R && \
    apt-get purge -y git make gcc g++ gfortran wish && \
    apt-get clean  && \
    apt-get autoremove -y  && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Make tool accessible through PATH
ENV PATH=$PATH:/files/batch_correction

# Make test script accessible
ENV PATH=$PATH:/files/batch_correction/test

################################################################################
### Define script ENTRYPOINT or container CMD
ENTRYPOINT ["/files/batch_correction/batch_correction_docker_wrapper.R"]

### [END]
################################################################################
