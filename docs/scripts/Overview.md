---
title: CosmoSim Scripts
theme: minima
permalink: /docs/scripts/
usemathjax: true
---

# Python Scripts

The python scripts are located in the CosmoSimPy directory in the
CosmoSim repository.

## GUI

`CosmoGUI.py` is the main GUI tool, to simulate distortion
and vary parameters interactively.

```
python3 CosmoSimPy/CosmoGUI.py
```

**TODO** further documentation

### Problems

+ Configuration widgets are never disabled even if most of them may be irrelevant
  to a given model.
+ SIE is slow and irresponsive.  It is doubtful if this can be corrected.

## Command line operation

+ [`datagen.py`](datagen script) is the main CLI tool 
    + bulk generation of images
+ datasetgen.py 
    + random generation of parameters for data sets
    + the output is a CSV file to be read by `datagen.py`
    + **TODO** further documentation
+ roulettegen.py  [Roulette Resimulation](Roulette Resimulation)
    + generate images from a set of roulette amplitudes
+ compare.py
    + Quantitatively compare two batches of images, intended for regression testing.
+ amplitudes.py
    + Generate a file with roulette amplitudes for the SIS lens.
    + For **development use** only
    + The generated files are included in the release packages and found by the
      library.
+ [Machine Learning Examples](MachineLearningExamples)

