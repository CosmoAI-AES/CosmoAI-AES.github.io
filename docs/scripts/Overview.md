---
title: CosmoSim Scripts
theme: minima
permalink: /docs/scripts/
usemathjax: true
---

# Python Scripts

The CosmoSim library provides a range of scripts.

## GUI

The GUI tool allows interactive simulation of distortion.
The user can vary parameters and see the resulting image immediately..

```sh
python -m CosmoSim.GUI
```

### Known Problems

+ Configuration widgets are never disabled even if most of them may be irrelevant
  to a given model.

## Command line operation

+ [`CosmoSim.datagen`](datagen script) is the main CLI tool 
    + bulk generation of images
+ `CosmoSim.dataset`
    + random generation of parameters for data sets
    + the output is a CSV file to be read by `datagen.py`
    + **TODO** further documentation
+ `CosmoSim.roulettegen`  [Roulette Resimulation](Roulette Resimulation)
    + generate images from a set of roulette amplitudes

## Other scripts

+ compare.py
    + Quantitatively compare two batches of images, intended for regression testing.
+ amplitudes.py
    + Generate a file with roulette amplitudes for the SIS lens.
    + For **development use** only
    + The generated files are included in the release packages and found by the
      library.
+ [Machine Learning Examples](MachineLearningExamples)

