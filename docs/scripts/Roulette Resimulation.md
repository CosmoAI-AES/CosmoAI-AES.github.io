---
title: Roulette Resimulation
theme: minima
permalink: /docs/scripts/Roulette Resimulation
usemathjax: true
---

## Roulette Amplitude Recovery (`roulettegen.py`)

The `roulettegen.py` script is still experimental and the model may change.
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
