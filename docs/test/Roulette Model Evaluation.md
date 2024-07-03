---
title: Roulette Modelling Tests
usemathjax: true
date: 2024-07-02
---


# Roulette Modelling Tests

+ **Directory** Test/roulette
+ **Purpose** evaluatte quality and parameter sensitivity of roulette models

```
cd Tests/roulette
sh test.sh
pdflatex report.tex
```

The test produces `report.pdf` which compares different roulette formalism
to a raytrace simulation.  Each page considers one lens and source configuration.
The top row shows the source and the raytrace simulation of the distorted
image.  The other rows show the roulette simulations for $m=3,5,15$ with 
corresponding difference image.

The heuristics in the right hand column are
+ `norm` for the Euclidean distance between raytrace and roulette simulation
  (eight-bit images)
+ `relnorm` is the `norm` normalised, as a per pixel value
+ `minimum` and `maximum` are the smallest and largest pixel error (signed).
