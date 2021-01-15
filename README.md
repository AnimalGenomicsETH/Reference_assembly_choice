# Investigating the impact of reference assembly choice on genomic analyses in a cattle breed

This repository contains the main workflows generated for assessing the impact of bovine reference assembly choice on genomic analysis. Structure of the repository:

1. Alignment pipeline and mapping statistics

Snakemake workflow developed for aligning the raw data to the reference genome and retrieving the main mapping statistics from the aligned files. The workflow can be seen [here](Alignment_Coverage)

2. Sequence variant genotyping and variant statistics

Snakemake and bash workflows developed for variant genotyping can be seen [here](Variant_calling). Separate pipelines are developed for the following sections:

* Haplotype caller
* Joing genotyping
* Filtration and imputation

---------------------------------------

Developed for analysis of bovine genomes, but should be applicable to the other species as well.

Please cite below when using the pipeline/scripts in your research:

```
Lloret-Villas, et. al. Investigating the impact of reference assembly choice on genomic analyses in a cattle breed. Biorxiv
```
