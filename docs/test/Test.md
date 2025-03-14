---
title: CosmoSim Test Scripts
permalink: /docs/test/
usemathjax: true
---

# CosmoSim Test Scripts

This is a partial description of the most important test
suites implemented.
For details, it is still necessary to read the code, unfortunately.

+ [Regression](Regression Tests) 
  are the most important tests to avoid bugs being 
  introduced during development
+ [Model Comparison](Model Comparison)
  to compare roulette and raytrace simulation
+ [PointMass](PointMass) tests 
+ [Roulette Resimulation Test](Roulette Resimulation Test)
+ [Roulette Model Evaluation](Roulette Model Evaluation)
  is primarily evaluation of the roulette formalism rather than 
  the implementation
+ [Roulette Statistics](Roulette Statistics) to explore the impact of higher order terms
+ Testing new features Autumn 2024 
    + [Source Constellation](Source Constellation Test)
    + [Cluster Lens](Cluster Lens) tests 

## $\xi$-move Test

+ `Scripts/ximovetest.sh`

This tests the roulette simulator, splicing images with 
different image points.
The output images are in `Test/ximove`*date*.  The spliced
images are prefixed `join-` and should look like plausible
distortions, with symmetry and continuous shapes.

## Timing

**Purpose** compare run times for different models

```
cd Test/timing
sh time.sh
```

Generated data are discarded.  The only interesting output is the 
reports from time.

## Old tests (not maintained)

+ `Test/TeX` typeset ampltiudes in TeX
    + created for debugging purposes
    + retained as an example of the feature
