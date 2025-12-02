#!/bin/sh
#SBATCH --time=13-23:59:59
#SBATCH --partition=k2-lowpri
#SBATCH --mem=100GB
#SBATCH --ntasks=16
#SBATCH --job-name=checkm2
#SBATCH --mail-user=l.dillon@qub.ac.uk
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --error=checkm2-%A-%a.err

source activate /mnt/scratch2/igfs-anaconda/conda-envs/checkm2_1.1.0

for i in $(cat samples.txt); do
	checkm2 predict -t 16 -x fa --input ${i}_cleanbins/ --output-directory ${i}_checkm-results --database_path /mnt/scratch2/igfs-anaconda/conda-dbs/checkm2_1.1.0/CheckM2_database/uniref100.KO.1.dmnd;
done
