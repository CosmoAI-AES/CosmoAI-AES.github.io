---
title: CosmoSim Scripts
theme: minima
permalink: /docs/scripts/
---

# Python Scripts

The python scripts are located in the Python directory in the
CosmoSim repository.

+ `datagen.py` is the main CLI tool 
    + bulk generation of images
    + **TODO** further documentation
+ `CosmoGUI.py` is the main GUI tool 
    + simulate distortion interactively
    + **TODO** further documentation
+ datasetgen.py 
    + random generation of parameters for data sets
    + the output is a CSV file to be read by `datagen.py`
    + **TODO** further documentation
+ roulettegen.py
    + New script to generate images from a set of roulette amplitudes
    + **Under Construction**
+ compare.py
    + Quantitatively compare two batches of images, intended for regression testing.
+ amplitudes.py
    + Generate a file with roulette amplitudes for the SIS lens.
    + For **development use** only

