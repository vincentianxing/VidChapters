#!/bin/bash

python demo_vid2seq.py --load=./checkpoints/vid2seq_htmchaptersyoucook.pth --video_example=./videos/apple_jam.webm --asr_example ./output_asr/apple_jam_asr.pkl --combine_datasets chapters