#!/bin/bash
set -euo pipefail

# 0) make sure apt cache is fresh
apt-get update -y

# 1) Install system packages needed for pytesseract + pdf2image (poppler)
#    You may add language packs if required (e.g., tesseract-ocr-eng)
apt-get install -y --no-install-recommends \
    tesseract-ocr \
    libtesseract-dev \
    libleptonica-dev \
    poppler-utils

# 2) Upgrade pip early (helps wheel resolution)
python -m pip install --upgrade pip

# 3) Install PyTorch (CPU) and matching torchvision/torchaudio wheels
#    (Pinned to a known compatible set)
pip install torch==2.1.1+cpu torchvision==0.16.1+cpu torchaudio==2.1.1+cpu \
    -f https://download.pytorch.org/whl/torch_stable.html

# 4) Install PyTorch-Geometric CPU wheels (matching the above torch)
pip install \
  torch-scatter==2.1.2+pt21cpu \
  torch-sparse==0.6.18+pt21cpu \
  torch-cluster==1.6.3+pt21cpu \
  torch-spline-conv==1.2.2+pt21cpu \
  torch-geometric==2.6.1 \
  -f https://data.pyg.org/whl/torch-2.1.1+cpu.html

# 5) Finally install the rest of Python requirements (requirements.txt should NOT list torch/pyg/numpy)
pip install -r requirements.txt
