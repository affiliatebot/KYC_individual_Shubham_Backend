#!/bin/bash
# Upgrade pip first
pip install --upgrade pip

# Install CPU PyTorch
pip install torch==2.1.0+cpu torchvision==0.16.1+cpu torchaudio==2.1.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

# Install PyTorch Geometric dependencies (CPU versions)
pip install torch-scatter==2.1.2+pt21cpu \
            torch-sparse==0.6.20+pt21cpu \
            torch-cluster==1.6.3+pt21cpu \
            torch-spline-conv==1.3.1+pt21cpu \
            torch-geometric==2.6.1 \
            -f https://data.pyg.org/whl/torch-2.1.0+cpu.html

# Install the rest of your Python dependencies
pip install -r requirements.txt
