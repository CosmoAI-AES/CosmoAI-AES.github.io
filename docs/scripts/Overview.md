---
title: CosmoSim Scripts
theme: minima
permalink: /docs/scripts/
usemathjax: true
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

## Roulette Amplitude Recovery (`roulettegen.py`)

The `roulettegen.py` script ois still experimental and the model may change.
The purpose is to make a new CSV file, alongside the distorted images, including
roulette amplitudes.  This entails the following steps.

1. Regular simulation, generating distorted images, and other images if desired.
2. Centre the image, recording the centre point $\vec{c}$ in the distorted image,
   and an image file with a shifted version.
3. Set $\vec{\xi}:=\chi\vec{c}$ in the simulator.
    + **TODO** verify $\Delta\xi = \chi(\eta-\vec{c})$
4. Get the roulette amplitudes from the simulator
    + These are not the roulette amplitudes that would have been used to produce
      the distorted image in a Roulette model.  
    + It is critical that the reference point can be recovered from the image even
      if it has been cropped and shifted.
5. Write the CSV file, including all the original parameters and also the roulette
   amplitudes.
    + **Note** we need the source position relative to the new centre point.

Training a machine learning model on the output CSV and the centred distorted images,
it should be possible to recover roulette amplitudes from unknown images.

## Simulation from roulette amplitudes.

We need to be able to generate distorted images from tentative roulette amplitudes,
knowing nothing else about the lens.  We obviously need a source model though, 
including its position relative to the roulette reference point.
