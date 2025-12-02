#!/bin/bash
#SBATCH --time=23:59:00
#SBATCH --partition=k2-medpri
#SBATCH --mem=50G
#SBATCH --mail-user=l.dillon@qub.ac.uk
#SBATCH --mail-type=END,BEGIN,FAIL
#SBATCH --error=magscot-%A-%a.err
#SBATCH --job-name=magscot


source activate /mnt/scratch2/igfs-anaconda/conda-envs/MAGScoT_env_v1.1

for i in $(cat samples.txt);
    do Rscript $MAGScoT_folder/MAGScoT.R \
        -i "../${i}_all_bins.contigs_to_bin.tsv" \
        --hmm ${i}.hmm \
        --out ${i}_magscot;
done
