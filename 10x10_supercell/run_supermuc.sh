#!/bin/bash
# Job Name and Files (also --job-name)
#SBATCH -J H2O

#Output and error (also --output, --error):
#SBATCH -o ./%x.%j.out
#SBATCH -e ./%x.%j.err

#Initial working directory (also --chdir):
#SBATCH -D ./

# Change here the job size and time limit:
#SBATCH --time=01:30:00
#SBATCH --nodes=8
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=24
#SBATCH --partition=micro
#SBATCH --no-requeue

#Setup of execution environment
#SBATCH --export=NONE
#SBATCH --get-user-env
#SBATCH --account=pn36zo

module load slurm_setup
export OMP_NUM_THREADS=1
exec="/hppfs/work/pn36zo/di76zil/23_compilation/64*/cp2k/exe/supermuc_jw_intel19_2022_04_11/cp2k.psmp"

mpiexec -n $SLURM_NTASKS $exec *inp &> cp2k.out
