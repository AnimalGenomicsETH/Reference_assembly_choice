# Investigating the impact of reference assembly choice on genomic analyses in a cattle breed

This repository contains the main workflows generated for assessing the impact of the reference assembly choice on bovine genomic analyses. The repository is split into two main sections:

1. [Alignment pipeline and mapping statistics](/Alignment)

* [`Snakemake` workflow](/Alignment/Pipeline) developed for aligning raw data (`FASTQ` files) to a reference genome.
*  Main [mapping statistics](/Alignment/Mapping_stats) extracted out of the aligned files (`BAM`).

2. [Sequence variant genotyping, variant calling and imputation](/Variant_calling)

* [`Snakemake` and `bash` workflows](/Variant_calling/Pipelines) developed for variant genotyping. Separate pipelines are developed for the following processes:

    * [Haplotype caller](/Variant_calling/Pipelines/Haplotype_caller)
    * [Joing genotyping](/Variant_calling/Pipelines/Joint_genotyping)
    * [Variant filtration and imputation](/Variant_calling/Pipelines/Filter_impute)

---------------------------------------

Developed for analysis of bovine genomes, should be applicable to the other species as well.

Did you use the pipeline/scripts for your research? Please, cite as indicated below:

```
Lloret-Villas, et. al. Investigating the impact of reference assembly choice on genomic analyses in a cattle breed. Biorxiv
```
