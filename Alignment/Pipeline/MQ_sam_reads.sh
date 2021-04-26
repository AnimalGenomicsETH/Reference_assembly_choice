all_reads=`samtools view -c $1 $6:1`
MQ_sam_flag=`samtools view -c -q 10 -F 1796 $1 $6:1`
echo -e $5'\t'$4'\t'$6'\t'${all_reads}'\t'${MQ_sam_flag} >> $3
touch $2