#!/bin/bash
# This is an example batch script for slurm on Hydra
#
# The commands for slurm start with #SBATCH
# All slurm commands need to come before the program # you want to run. In this example, 'echo "Hello World!"
# is the command we are running.
#
# This is a bash script, so any line that starts with # is # a comment. If you need to comment out an #SBATCH line, use # infront of the #SBATCH
#
# To submit this script to slurm do:
# sbatch batch.script
#
# Once the job starts you will see a file MySerialJob-****.out
# The **** will be the slurm JobID
# --- Start of slurm commands -----------

# set the partition to run on the gpus partition. The Hydra cluster has the following partitions: compute, gpus, debug, tstaff
#SBATCH --partition=gpus

# request 1 gpu resource
#SBATCH --gres=gpu:1
 
# Request an hour of runtime. Default runtime on the compute parition is 1hr.
#SBATCH --time=1:00:00
# Request a certain amount of memory (4GB):
#SBATCH --mem=4G
# Specify a job name:
#SBATCH -J MySerialJob
# Specify an output file
# %j is a special variable that is replaced by the JobID when the job starts
#SBATCH -o MySerialJob-%j.out #SBATCH -e MySerialJob-%j.out
#----- End of slurm commands ----
# Run a command
# echo "Hello World!"

# sbatch --partition=gpus --gres=gpu:4 --mem=16G run_asr.sh

python demo_asr.py --video_example=./videos/ube_mochi.mp4 --asr_example ./output_asr/ube_mochi_asr.pkl --combine_datasets chapters