---
title: Roulette Resimulation Scripts
theme: minima
permalink: /docs/scripts/Roulette Resimulation
usemathjax: true
---

# Roulette Resimulation Scripts

The idea behind roulette resimulation is to recover the roulette amplitudes
and simulate the lens distortion using only the amplitudes and no other 
information about the lens.  

The end goal is to use roulette amplitudes recovered from observed images
by machine learning, but immediate tests can be made using exact roulette
amplitudes calculated from the lens. This can be done by specifying an
output file for roulette amplitudes using `datagen.py --outfile`:
```
python3 CosmoSimPy/datagen.py  --csvfile Dataset/debug.csv \
    --outfile roulette.csv
```
The resulting CSV file (roulette.csv) can be fed to the resimulator.

Below, we will try to explain briefly how the roulette output file
work.  See the [Roulette Formalism](/docs/model/Roulette) for a more
detailed mathematical model.

(This is **under construction**)

## The Roulette Output file

The output file has most of the familiar columns from the input,
giving the lens parameters.  Additional it has
+ `alpha[`$i$`][`$j$`]`, `beta[`$i$`][`$j$`]` for the roulette amplitudes
+ `centreX`, `centreY` : Centre point
    + If `--centre` is not used, this is $(0,0)$.
    + If `--centre` is used the image has been translated by 
      $-($`centreX`,`centryY`$)$; i.e. (`centreX`,`centreY`) is
      the coordinates of the centre of light prior to centring the
      image.
+ `reletaX`, `reletaY`
+ `offsetX`, `offsetY`
+ `xiX`, `xiY`

## Roulette Amplitude Recovery (`roulettegen.py`)

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
