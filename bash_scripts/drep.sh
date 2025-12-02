#!/bin/bash
#SBATCH --time=23:59:00
#SBATCH --partition=k2-medpri
#SBATCH --mem=50G
#SBATCH --cpus-per-task=16
#SBATCH --mail-user=l.dillon@qub.ac.uk
#SBATCH --mail-type=END,BEGIN,FAIL
#SBATCH --error=drep-%A-%a.err
#SBATCH --job-name=drep


source activate /mnt/scratch2/igfs-anaconda/conda-envs/drep3.5.0/

for i in $(cat samples.txt); do
	dRep dereplicate drep_${i}  --processors 16    --completeness 50    --contamination 50     --P_ani 0.9   --S_ani 0.95    -nc 0.1  --genomes ${i}_cleanbins/*.fa;
done
