module load jdk

GATK4=/path/to/software/gatk-4.1.4.1/gatk
REF=/path/to/reference/genome/UCD_ref.fa
gvcf_dir=/path/to/gvcf/files/
Chr=MYCHR

cd $TMPDIR
while read sample
do
    cp ${gvcf_dir}/${Chr}/${sample}_${Chr}.g.vcf{.gz,.gz.tbi} .
    echo $sample
done < /path/to/sample_list/samples.txt

export TILEDB_DISABLE_FILE_LOCKING=1

${GATK4} \
GenomicsDBImport \
    --sample-name-map path/to/maps/${Chr}.map \
    --genomicsdb-workspace-path db_${Chr} \
    -L ${Chr} \
    --reader-threads 25 \
    --batch-size 50 \
    -R ${REF}

${GATK4} \
GenotypeGVCFs  \
-R ${REF}  \
-L ${Chr} \
-O ${Chr}_gatk4.vcf.gz \
-V gendb://db_${Chr}

if [[ -f ${Chr}_gatk4.vcf.gz.tbi ]]
then
    mv ${Chr}_gatk4.vcf.gz ${Chr}_gatk4.vcf.gz.tbi ${LS_SUBCWD}
fi
