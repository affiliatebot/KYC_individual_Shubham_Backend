#!/bin/bash
apt-get update
apt-get install -y curl fontconfig libarchive-dev libcairo2 \
    libcurl3-gnutls libcurl3-nss libcurl4-nss-dev libdatrie1 \
    libfribidi0 libgif7 libglib2.0-0 libgraphite2-3 libharfbuzz0b \
    liblcms2-2 liblept5 libleptonica-dev libopenjp2-7 libpango-1.0-0 \
    libpangocairo-1.0-0 libpangoft2-1.0-0 libpixman-1-0 libpoppler126 \
    libtesseract-dev libtesseract5 libthai-data libthai0 libxcb-render0 \
    libxcb-shm0 nss-plugin-pem poppler-utils tesseract-ocr tesseract-ocr-eng \
    tesseract-ocr-osd

python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip

# PyTorch CPU-only (smaller wheel)
pip install torch==2.8.0+cpu torchvision==0.23.0+cpu torchaudio==2.8.0+cpu \
    -f https://download.pytorch.org/whl/torch_stable.html

# PyTorch Geometric CPU wheels
pip install torch-scatter==2.1.2+cpu \
            torch-sparse==0.6.18+cpu \
            torch-cluster==1.6.3+cpu \
            torch-spline-conv==1.2.2+cpu \
            torch-geometric==2.6.1 \
            -f https://data.pyg.org/whl/torch-2.8.0.html

# Install rest of requirements with timeout/retries
pip install --default-timeout=100 --retries=5 -r requirements.txt

echo "Build completed successfully!"
