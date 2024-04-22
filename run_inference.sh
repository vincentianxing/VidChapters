#!/bin/bash

python demo_vid2seq.py --load=./checkpoints/vid2seq_htmchaptersyoucook.pth --video_example=./videos/ube_mochi.mp4 --asr_example ./output_asr/ube_mochi_asr.pkl --combine_datasets chapters