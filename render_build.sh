#!/bin/bash
# Upgrade pip
pip install --upgrade pip

# Downgrade NumPy to compatible version
pip install numpy==1.25.0

#  Install PyTorch CPU
pip install torch==2.1.1+cpu torchvision==0.16.1+cpu torchaudio==2.1.1+cpu -f https://download.pytorch.org/whl/torch_stable.html

#  Install PyG dependencies (CPU)
pip install torch-scatter==2.1.2+pt21cpu \
            torch-sparse==0.6.18+pt21cpu \
            torch-cluster==1.6.3+pt21cpu \
            torch-spline-conv==1.2.2+pt21cpu \
            torch-geometric==2.6.1 \
            -f https://data.pyg.org/whl/torch-2.1.1+cpu.html

#  Install remaining dependencies
pip install -r requirements.txt
