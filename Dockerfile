# Python ka base image use kar rahe hain
FROM python:3.10-slim-buster

# Working directory set kar rahe hain
WORKDIR /app

# System dependencies install kar rahe hain
# (ffmpeg downloader bots ke liye bahut zaroori hai)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

# Requirements file copy kar rahe hain
COPY requirements.txt .

# Python libraries install kar rahe hain
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

# Pura code container me copy kar rahe hain
COPY . .

# Bot start karne ka command
# Agar aapki main file ka naam 'bot.py' hai to niche 'main.py' ko change karein
CMD ["python3", "main.py"]
