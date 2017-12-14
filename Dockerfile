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
FROM ubuntu:16.04

################################################################################
### set author
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

################################################################################
### set metadata
ENV TOOL_NAME=batch_correction
ENV TOOL_VERSION="phenomenal_2017.12.14"
ENV CONTAINER_VERSION=0.2
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
RUN echo "deb http://cran.univ-paris1.fr/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9  && \
    apt-get update  && \
    apt-get -y upgrade  && \
    apt-get install --no-install-recommends -y r-base && \
    apt-get install --no-install-recommends -y libcurl4-openssl-dev && \
    apt-get install --no-install-recommends -y libxml2-dev && \
    apt-get install --no-install-recommends -y git && \
    apt-get install --no-install-recommends -y make && \
    apt-get install --no-install-recommends -y gcc && \
    git clone --recurse-submodules --single-branch -b ${TOOL_VERSION} https://github.com/workflow4metabolomics/batch_correction.git /files/batch_correction  && \
    echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile  && \
    Rscript -e "install.packages('batch', dep=TRUE)" && \
    Rscript -e "install.packages('ade4', dep=TRUE)" && \
    Rscript -e "source('http://www.bioconductor.org/biocLite.R'); biocLite('pcaMethods')" && \
    Rscript -e "source('http://www.bioconductor.org/biocLite.R'); biocLite('ropls')" && \
    chmod a+x /files/batch_correction/batch_correction_docker_wrapper.R && \
    apt-get purge -y git make gcc && \
    apt-get clean  && \
    apt-get autoremove -y  && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Make tool accessible through PATH
WORKDIR /files/batch_correction
ENV PATH = $PATH:/files/batch_correction

################################################################################
### Define script ENTRYPOINT or container CMD
ENTRYPOINT ["/files/batch_correction/batch_correction_docker_wrapper.R"]

### [END]
################################################################################