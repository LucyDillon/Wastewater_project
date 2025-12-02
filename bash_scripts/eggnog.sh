#!/bin/bash
#SBATCH --time=4-23:59:00
#SBATCH --partition=k2-lowpri
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8
#SBATCH --mail-user=l.dillon@qub.ac.uk
#SBATCH --mail-type=END,BEGIN,FAIL
#SBATCH --error=eggnog-%A-%a.err
#SBATCH --job-name=eggnog

source activate /mnt/scratch2/igfs-anaconda/conda-envs/eggnog/
module add diamond/0.9

for file_list in *.faa;
do emapper.py --data_dir /mnt/scratch2/igfs-anaconda/conda-envs/eggnog/lib/python3.9/site-packages/data -i $file_list --output ${file_list::-4}_eggnog -m diamond --cpu 32 --dbmem --dmnd_iterate no;
done
