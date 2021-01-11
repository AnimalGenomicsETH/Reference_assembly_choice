# Alignment quality and depth of coverage

### Workflow

Workflows for aligning the raw data to the reference genome and calculating the coverage of the samples have been developed with Snakemake. Snakemake pipelines are formed of three files:

* Snakefile - Python based files with the core instructions structured in concatenated module/rules
* Config file - YAML file that contains the technical details of the workflow (*e.g.* input/output files, wildcards, software path and version)
* Cluster file - JSON file including the cluster details for each rule (*e.g.* memory and cores requested, log location)

Snakemake files for alignment and coverage are provided separately and duly named.

### Submission

Snakemake workflows are submitted by using the following bash script: 

```
#!/bin/bash

module load python_gpu/3.7.4

snakemake --jobs 500 -rp --latency-wait 40 --keep-going --rerun-incomplete --cluster-config cluster.json --cluster "bsub -J {cluster.jobname} -n {cluster.ncore} -W {cluster.jobtime} -oo {cluster.logi} -R \"rusage[mem={cluster.memo}]\""

```

### Notes

1. Input files need to be named following the wildcard patterns (UCD/Angus in our case)
2. Sample names are provided as Python list in the `config.yaml` file - example is provided
3. Log files can only be generated in the folders specified in the `cluster.json` if the relevant folders have been created within the `log_folder`
4. Snakemake workflow for coverage aggregates the following scripts: `average_coverage.py` & `get_coverage.sh`
4. PDF files with the Snakemake graph can be created as follows:

```
#!/bin/bash
module load python_gpu/3.6.4
module load gcc/4.8.5 graphviz/2.40.1
name="workflow_name"
snakemake --forceall --dag | dot -Tpdf > ${name}_dag.pdf
```
