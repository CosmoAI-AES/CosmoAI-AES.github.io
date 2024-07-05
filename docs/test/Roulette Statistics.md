---
title: CosmoSim Roulette Statistics
permalink: /docs/test/Roulette Statistics
usemathjax: true
---

# CosmoSim Roulette Statistics

+ **Purpose** explore the effect of changes in roulette amplitudes
+ Two different tests
    - descriptive statistics
    - tweaking amplitudes

## Descriptive statistics

+ **Directory** `Test/roulettestatistics`

```sh
./datasetgen.sh
./test.sh
pdflaex report.tex
```

The resulting PDF file shows the mean and standard deviation of
the roulette amplitudes over 4000 images


### Tweaking amplitudes (legacy)

```
./raytrace.sh
./tweak.sh
./txt.py
pdflatex tweak.tex
```
The resulting PDF report shows several simulations of the same lens and source, tweaking
different fifth order amplitudes. The ten first images in the dataset are used.

## Tweaking amplitudes

+ **Directory** `Test/tweak2`

```sh
./tweak.sh
```
The resulting PDF report shows several simulations of the same lens and source, tweaking
different fifth order amplitudes. The ten first images in the dataset are used.

This test uses a special selection of lens/source configuration, instead of the random
selection in the other tests.



