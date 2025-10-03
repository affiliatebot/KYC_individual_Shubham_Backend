#!/bin/bash
pip install torch==2.1.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
pip install torch-scatter==2.1.2+cpu torch-sparse==0.6.20+cpu torch-cluster==1.6.3+cpu torch-spline-conv==1.3.1+cpu torch-geometric==2.6.1 -f https://data.pyg.org/whl/torch-2.1.0+cpu.html
pip install -r requirements.txt
