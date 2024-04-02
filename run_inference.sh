#!/bin/bash

python demo_vid2seq.py --load=./checkpoints/vid2seq_htmchaptersyoucook.pth --video_example=./videos/pancake.webm --asr_example ./output_asr/pancake_asr.pkl --combine_datasets chapters