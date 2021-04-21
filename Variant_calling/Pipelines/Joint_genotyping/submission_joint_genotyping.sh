time=120:00
mem=4000
scratch_mem=15000
jobfile=joint_genotyping.sh
nt=20
for chr in {1..29}
do
    if [ $chr -lt 10 ]
    then
    time=120:00
    mem=4000
    scratch_mem=15000
    jobfile=joint_genotyping.sh
    nt=20
    else
    time=72:00
    mem=4000
    scratch_mem=15000
    jobfile=joint_genotyping.sh
    nt=20
    fi
    awk '{gsub ("MYCHR", "'$chr'")  ; print }' $jobfile > jobs/JG_UCD_${chr}.job
    bsub -n $nt -W $time -J JG_UCD_${chr}  -R "rusage[mem=$mem]" -R "rusage[scratch=$scratch_mem]" -o log_folder/joint_genotyping/JG_UCD_${chr}.out  < jobs/JG_UCD_${chr}.job
    echo $chr
done
