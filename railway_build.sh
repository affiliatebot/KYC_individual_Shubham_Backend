#!/bin/bash
set -euo pipefail

# Update apt cache and install system deps for Tesseract + PDF
apt-get update -y
apt-get install -y --no-install-recommends \
    tesseract-ocr \
    libtesseract-dev \
    libleptonica-dev \
    poppler-utils

# Upgrade pip
python -m pip install --upgrade pip

# Install CPU-only PyTorch + torchvision + torchaudio
pip install torch==2.1.1+cpu torchvision==0.16.1+cpu torchaudio==2.1.1+cpu \
    -f https://download.pytorch.org/whl/torch_stable.html

# Install PyTorch-Geometric CPU wheels
pip install \
  torch-scatter==2.1.2+pt21cpu \
  torch-sparse==0.6.18+pt21cpu \
  torch-cluster==1.6.3+pt21cpu \
  torch-spline-conv==1.2.2+pt21cpu \
  torch-geometric==2.6.1 \
  -f https://data.pyg.org/whl/torch-2.1.1+cpu.html

# Install the rest of your Python packages
pip install -r requirements.txt
