#!/bin/bash
#SBATCH --time=3-23:59:59
#SBATCH --partition=k2-lowpri
#SBATCH --mem=20G
#SBATCH --mail-user=l.dillon@qub.ac.uk
#SBATCH --mail-type=END,BEGIN,FAIL
#SBATCH --error=mag_utils-%A-%a.err
#SBATCH --job-name=mag_utils

for i in $(cat samples.txt); do  echo "Adding Sample: ${i} ";     echo "mags-utils add -n 'Louise_ballymena' -s '${i}' \
        -1 '../../Uncontaminated_reads/${i}_L001.1P.fastq.gz' \
        -2 '../../Uncontaminated_reads/${i}_L001.2P.fastq.gz' \
        -m '${i}_gtdbtk_results/${i}_all_bins.csv' \
        -f 'treatment=control' \
        -d '${i}_cleanbins/' data";      mags-utils add -n 'Louise_ballymena' -s ${i}         -1 ../../Uncontaminated_reads/${i}_L001.1P.fastq.gz         -2 ../../Uncontaminated_reads/${i}_L001.2P.fastq.gz         -m ${i}_gtdbtk_results/${i}_all_bins.csv         -f 'treatment=control'         -d ${i}_cleanbins/ data; done
