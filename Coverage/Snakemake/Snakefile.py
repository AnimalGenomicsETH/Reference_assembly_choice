configfile: "config.yaml"
sample = config["samples"]
reference = config["references"]

# Reduced paths
dedup_bam = config["resources"]["dedup_bam"]
info_file = config["resources"]["info_file"]
coverage_path = config["fold_out"]["coverage"]

# Tools
get_coverage = config["tools"]["get_coverage"]
average_coverage = config["tools"]["average_coverage"]

rule all:
    input: expand(coverage_path + "{reference}/summary_coverage.txt",reference=reference)

rule mosdepth:
    input:
        dedup_bam + "{reference}/{sample}/{sample}.bam"
    output:
        coverage_path + "{reference}/{sample}.coverage"
    params:
        output = coverage_path + "{reference}/{sample}.output",
        bed = coverage_path + "{reference}/{sample}.output.per-base.bed.gz"
    shell:
        get_coverage + "{input} {output} {params.output} {params.bed}"

rule summary_cov:
	input:
		file_list = expand(coverage_path + "{{reference}}/{sample}.coverage",sample=sample),
		info = info_file
	output:
		coverage = coverage_path + "{reference}/summary_coverage.txt"
	script:
		"/cluster/work/pausch/temp_scratch/audald/variant_analyses/coverage/average_coverage.py"