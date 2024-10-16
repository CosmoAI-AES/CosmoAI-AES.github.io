---
title: CosmoSim Regression Tests
permalink: /docs/test/Regression
usemathjax: true
---

# Regression Tests

+ **Purpose** check that code changes do not change the output
+ **Directory** `RegressionTest`

This is a test suite which can be run out of the box,
using recursive makefiles.
It can also be run automatically using github actions.
To run locally (Unix), run

```
cd RegressionTest
make clean
make all
```

The scripts generate images for the most important models and 
compare them to previously generated images.
It will output a list of bad results to the terminal.

Each subdirectory considers one simulation model and contains a
dataset `debug.csv` from which images are generated.
In the `montage` subdirectory, there are composite images combining
the generated image, the baseline, abd the difference image.


**Caveat**  The `exactpm` tests give negligible regression errors
on Windows.  This is probably numerical approximations, but it has
not yet been investigated.


+ Testing various lens models
    + Tests of the PointMass simulators
        + exactpm 
        + roulettepm 
    + Old tests of the generic Raytrace and Roulette Models
        + raytrace 
        + roulette 
    + The following tests are newer and use the same set of lens configurations
        + new-roulette 
        + new-raytrace 
        + sampled-roulette 
        + sampled-raytrace 
+ Testing the calculation of roulette amplitudes by `amplitudes.py`
    + amplitudes 
    + Note that SIE has not yet been incorporated
+ Legacy 
    + roulettelens
        + This is broken, but not sure why.
        + Equally reliable tests can be obtained using `Test/roulettegen`

