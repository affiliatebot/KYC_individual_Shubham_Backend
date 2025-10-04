#!/bin/bash
set -euo pipefail

# --------------------------
# Install system dependencies
# --------------------------
apt-get update -y
apt-get install -y --no-install-recommends \
    tesseract-ocr \
    libtesseract-dev \
    libleptonica-dev \
    poppler-utils

# --------------------------
# Upgrade pip
# --------------------------
python -m pip install --upgrade pip

# --------------------------
# Install CPU-only PyTorch + torchvision + torchaudio
# --------------------------
pip install torch==2.8.0+cpu torchvision==0.18.1+cpu torchaudio==2.8.0+cpu \
    -f https://download.pytorch.org/whl/torch_stable.html

# --------------------------
# Install PyTorch-Geometric CPU wheels
# --------------------------
pip install \
  torch-scatter==2.1.2+pt28cpu \
  torch-sparse==0.6.18+pt28cpu \
  torch-cluster==1.6.3+pt28cpu \
  torch-spline-conv==1.2.2+pt28cpu \
  torch-geometric==2.6.1 \
  -f https://data.pyg.org/whl/torch-2.8.0+cpu.html

# --------------------------
# Install remaining Python packages
# --------------------------
pip install --no-cache-dir -r requirements.txt
