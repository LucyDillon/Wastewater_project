#!/bin/bash
#SBATCH --time=10-18:59:00
#SBATCH --partition=k2-lowpri
#SBATCH --mem=100G
#SBATCH --cpus-per-task=16
#SBATCH --mail-user=l.dillon@qub.ac.uk
#SBATCH --mail-type=END,BEGIN,FAIL
#SBATCH --error=metabat-%A-%a.err
#SBATCH --job-name=metabat

source activate /mnt/scratch2/igfs-anaconda/conda-envs/metabat2_2.15

for i in $(cat sample.txt); do
	metabat2 -m 1500 \
        	-t 16 \
        	--unbinned \
        	--seed 0 \
        	-i ${i}_L001_R1_001.1P._scaffolds_filtered.fasta \
        	-a binning-data/$i/depth.txt \
        	-o binning-data/$i/bins/PN0204_0001-bin;
done
