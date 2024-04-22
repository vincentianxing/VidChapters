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

# echo "1"
# python demo_asr.py --video_example=./videos/1.mp4 --asr_example ./output_asr/1.pkl --combine_datasets chapters
# echo "2"
# python demo_asr.py --video_example=./videos/2.mp4 --asr_example ./output_asr/2.pkl --combine_datasets chapters
# echo "3"
# python demo_asr.py --video_example=./videos/3.mp4 --asr_example ./output_asr/3.pkl --combine_datasets chapters
# echo "4"
# python demo_asr.py --video_example=./videos/4.mp4 --asr_example ./output_asr/4.pkl --combine_datasets chapters
# echo "5"
# python demo_asr.py --video_example=./videos/5.mp4 --asr_example ./output_asr/5.pkl --combine_datasets chapters
# echo "done"

python demo_asr.py --video_example=./videos/6.mp4 --asr_example ./output_asr/6.pkl --combine_datasets chapters