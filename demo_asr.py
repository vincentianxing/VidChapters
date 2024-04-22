import argparse
import torch
import os
import json
import pickle
from args import get_args_parser, MODEL_DIR
import whisper
import whisperx

# Args
parser = argparse.ArgumentParser(parents=[get_args_parser()])
args = parser.parse_args()
args.model_name = os.path.join(os.environ["TRANSFORMERS_CACHE"], args.model_name)
device = torch.device(args.device)

print("load Whisper model")
torch.cuda.empty_cache()
asr_model = whisper.load_model('large-v2', args.device, download_root=MODEL_DIR)

print("extract ASR")
asr = asr_model.transcribe(args.video_example)

print("load align model")
align_model, metadata = whisperx.load_align_model(language_code=asr['language'], device=args.device, model_dir=MODEL_DIR)

print("extract audio")
audio = whisperx.load_audio(args.video_example)

print("align ASR")
aligned_asr = whisperx.align(asr["segments"], align_model, metadata, audio, args.device, return_char_alignments=False)

print("extract transcription")
transcription_path = '/demo_output/transcription/' + args.video_example + '.txt'
print(transcription_path)
for s in asr['segments']:
    print("start: ", s["start"])
    print("end: ", s["end"])
    print("text: ", s["text"])
    print()

print("saving")
pickle.dump(aligned_asr, open(args.asr_example, 'wb'))

# Write result into txt file for RAG
print(args.video_example)
video_name = os.path.splitext(os.path.basename(args.video_example))[0]
transcription_path = './demo_output/transcription/' + video_name + '.txt'
print(transcription_path)

with open(transcription_path, 'w') as file:
    for entry in asr['segments']:
        line = f"start: {entry['start']}\nend: {entry['end']}\ntext: {entry['text']}\n\n"
        file.write(line)


print("done extracting ASR")