---
title: CosmoSim Roulette Statistics
permalink: /docs/test/Roulette Statistics
usemathjax: true
---

# CosmoSim Roulette Statistics

+ **Directory** `Test/roulettestatistics`
+ **Purpose** explore the effect of changes in roulette amplitudes
+ Two different tests
    - descriptive statistics
    - tweaking amplitudes

## Descriptive statistics


```sh
./datasetgen.sh
./test.sh
pdflaex report.tex
```

The resulting PDF file shows the mean and standard deviation of
the roulette amplitudes over 4000 images

## Raytrace simulation

If required, a raytrace simulation is run with the command
```sh
./raytrace.sh
```
This is required for the next test.

## Tweaking amplitudes

```
./tweak.sh
./txt.py
pdflatex tweak.tex
```
The resulting PDF report shows several simulations of the same lens and source, tweaking
different fifth order amplitudes.
