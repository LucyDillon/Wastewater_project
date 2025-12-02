#!/bin/sh
#SBATCH --time=13-23:59:59
#SBATCH --partition=k2-lowpri
#SBATCH --mem=100GB
#SBATCH --ntasks=20
#SBATCH --job-name=gtdbtk
#SBATCH --mail-user=l.dillon@qub.ac.uk
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --error=gtdbtk-%A-%a.err

source activate /mnt/scratch2/igfs-anaconda/conda-envs/gtdbtk-2.1.1

for i in $(cat samples.txt); do gtdbtk classify_wf --genome_dir ${i}_cleanbins/ --out_dir ${i}_gtdbtk_results/ --extension fa --cpus 20  --skip_ani_screen; done
