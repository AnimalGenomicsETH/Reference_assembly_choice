# Sequence variant genotyping, variant statistics and imputation


### Workflows

Workflows for a) [haplotype calling](/Variant_calling/Pipelines/Haplotype_caller), b) [joint genotyping](/Variant_calling/Pipelines/Joint_genotyping) and c) [variant filtering and imputation](/Variant_calling/Pipelines/Filter_impute) have been developed with `Snakemake` and `bash`. The workflow for each step is duly named. 

`Snakemake` pipelines are formed of three files:

* `Snakefile` - Python based files with the core instructions structured in concatenated module/rules
* Config file - `YAML` file that contains the technical details of the workflow (*e.g.* input/output files, wildcards, software path and version)
* Cluster file - `JSON` file including the cluster details for each rule (*e.g.* memory and cores requested, log location)

`Bash` pipelines are formed of two files:

* Core `bash` script
* `Bash` submission script - complimentary details for the core `bash` script (similarly to `Snakemake` config and cluster files)

### Submission

`Snakemake` workflows are submitted by using the following `bash` script: 

```
#!/bin/bash

module load python_gpu/3.7.4

snakemake --jobs 500 -rp --latency-wait 40 --keep-going --rerun-incomplete --cluster-config cluster.json --cluster "bsub -J {cluster.jobname} -n {cluster.ncore} -W {cluster.jobtime} -oo {cluster.logi} -R \"rusage[mem={cluster.memo}]\""

```

`Bash` workflow is submitted via the `bash` submission script.

### Notes

1. Input files need to be named following the wildcard patterns (`UCD`/`Angus` and chromosome numbers in our case)
2. Sample names are provided as Python list in the `haplotype_caller_config.yaml` file - example is provided
3. Log files can only be generated in the folders specified in the `*cluster.json` if the relevant folders have been created within the `log_folder`
4. PDF files with the Snakemake graph (`DAG`) can be created as follows:

```
#!/bin/bash
module load python_gpu/3.6.4
module load gcc/4.8.5 graphviz/2.40.1
name="workflow_name"
snakemake --forceall --dag | dot -Tpdf > ${name}_dag.pdf
```
