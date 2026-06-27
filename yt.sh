#!/bin/bash
# Usage: ./yt.sh "URL_YOUTUBE"

URL="$1"

if [ -z "$URL" ]; then
  echo "Usage: ./yt.sh \"https://youtube.com/...\""
  exit 1
fi

/root/whisper-env/bin/python3 - "$URL" <<'EOF'
import sys
import re
from youtube_transcript_api import YouTubeTranscriptApi

url = sys.argv[1]
match = re.search(r"(?:v=|shorts/|youtu\.be/)([a-zA-Z0-9_-]{11})", url)
if not match:
    print("URL non reconnue")
    sys.exit(1)

video_id = match.group(1)

api = YouTubeTranscriptApi()
try:
    transcript = api.fetch(video_id, languages=["fr", "fr-FR", "en"])
except:
    transcript = api.fetch(video_id)

text = " ".join([t.text for t in transcript])

# Sauvegarder
import os
out = f"/root/coherencelab/transcripts/{video_id}.txt"
with open(out, "w") as f:
    f.write(text)

print(text)
print(f"\n--- Sauvegardé : {out}")
EOF
