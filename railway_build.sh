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
pip install torch==2.8.0+cpu torchvision torchaudio==2.8.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

# --------------------------
# Install PyTorch-Geometric CPU wheels
# --------------------------
pip install \
  torch-scatter==2.1.2+cpu \
  torch-sparse==0.6.18+cpu \
  torch-cluster==1.6.3+cpu \
  torch-spline-conv==1.2.2+cpu \
  torch-geometric==2.6.1 \
  -f https://data.pyg.org/whl/torch-2.8.0.html

# --------------------------
# Install remaining Python packages
# --------------------------
pip install --no-cache-dir -r requirements.txt
