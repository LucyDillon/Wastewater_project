#!/bin/sh
#SBATCH --time=23:59:59
#SBATCH --partition=k2-medpri
#SBATCH --mem=100G
#SBATCH --cpus-per-task=8
#SBATCH --mail-user=l.dillon@qub.ac.uk
#SBATCH --mail-type=END,BEGIN,FAIL
#SBATCH --error=mag-utils%A-%a.err
#SBATCH --job-name=mag-utils

mags-utils get-results data job_analysis
