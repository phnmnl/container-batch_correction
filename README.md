<!-- Guidance: see https://github.com/phnmnl/phenomenal-h2020/wiki/The-Guideline-for-Container-GitHub-Respository-README.md-Creation -->

![Logo](w4m.png)

# W4M - Batch Correction
Version: 2.2.3

## Short description

<!-- 
This should only be 20 to 40 words, hopefully a single sentence.
-->

Corrects intensities for signal drift and batch-effects

## Description

A Galaxy module from the [Workflow4metabolomics](http://workflow4metabolomics.org) infrastructure. 

Instrumental drift and offset differences between batches have been described in LC-MS experiments when the number of samples is large and/or multiple batches of acquisition are needed.

Recently a normalization strategy relying on the measurements of a pooled (or QC) sample injected periodically has been described: for each variable, a regression model is fitted to the values of the pool and subsequently used to adjust the intensities of the samples of interest (van der Kloet et al, 2009; Dunn et al, 2011).

The current tool implements two strategies which differ in the way the regression model is applied to the variables (either depending on variable quality metrics, or 'loess' model for all variables) and also in the generated figure.

For further information please refer to the project's [GitHub page](https://github.com/workflow4metabolomics/batch_correction). 

## Key features

- Batch Correction

## Functionality

- Pre-processing 

## Approaches

- Metabolomics / Untargeted
  
## Instrument Data Types

- LC/MS

## Tool Authors

- Jean-Francois Martin (MetaboHUB, INRA, PFEM, PF MetaToul-AXIOM)
- Melanie Petera (MetaboHUB, INRA, PFEM)
- Marion Landi (MetaboHUB, FLAME, INRA, PFEM)
- Franck Giacomoni (MetaboHUB, INRA, PFEM)
- Etienne Thevenot (MetaboHUB, CEA, LIST/LADIS)

## Container Contributors

- Nils Paulhe (MetaboHUB, INRA, PFEM)

## Website

- http://workflow4metabolomics.org

## Git Repository

- https://github.com/workflow4metabolomics/batch_correction.git

## Installation 

For local individual installation:

```bash
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/container-batch_correction
```

## Usage Instructions

For direct docker usage:

```bash
docker run docker-registry.phenomenal-h2020.eu/phnmnl/container-batch_correction ...
```

## Publications

<!-- Guidance:
Use AMA style publications as a list (you can export AMA from PubMed, on the Formats: Citation link when looking at the entry).
IMPORTANT: Publications section must be placed at the end and cannot be emptied!
-->

- Van der kloet FM, Bobeldijk I, Verheij ER, Jellema RH. Analytical error reduction using single point calibration for accurate and precise metabolomic phenotyping. J Proteome Res. 2009;8(11):5132-41. doi:10.1021/pr900499r 

- Dunn WB, Broadhurst D, Begley P, et al. Procedures for large-scale metabolic profiling of serum and plasma using gas chromatography and liquid chromatography coupled to mass spectrometry. Nat Protoc. 2011;6(7):1060-83. doi:10.1038/nprot.2011.335 

- Cleveland et al. Local Regression Models. Statistical Models in S, Chambers JM. and Hastie TJ. Ed., Chapman et Hall: London. 1991;:309-376.

- Thévenot EA, Roux A, Xu Y, Ezan E, Junot C. Analysis of the Human Adult Urinary Metabolome Variations with Age, Body Mass Index, and Gender by Implementing a Comprehensive Workflow for Univariate and OPLS Statistical Analyses. J Proteome Res. 2015;14(8):3322-35. doi:10.1021/acs.jproteome.5b00354

<!-- 
Template used: https://github.com/phnmnl/container-rnmr/blob/master/README.md
Tool used for AMA citation formatting: https://mickschroeder.com/citation/?
--->
