#!/bin/bash
# Usage: ./transcribe.sh mon_audio.mp3

AUDIO="$1"
OUTPUT_DIR="/root/coherencelab/transcripts"

if [ -z "$AUDIO" ]; then
  echo "Usage: ./transcribe.sh chemin/vers/audio.mp3"
  exit 1
fi

echo "Transcription en cours : $AUDIO"

/root/whisper-env/bin/whisper "$AUDIO" \
  --language fr \
  --model small \
  --output_format txt \
  --output_dir "$OUTPUT_DIR"

echo "Transcription terminée → dossier transcripts/"
