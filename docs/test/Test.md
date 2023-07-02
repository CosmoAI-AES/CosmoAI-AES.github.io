---
title: CosmoSim Test Scripts
theme: minima
permalink: /docs/test/
---

This is a partial description of the most important test
suites implemented.
For details, it is still necessary to read the code, unfortunately.

# Regression Test

+ `Scripts/regressiontest.sh`

This test can be run out of the box.
It generates images for the most important models and 
compare them to previously generated images.
It will output a list of bad results.

**Caveat**  There are always bad results.  It seems that
the simulation is not entirely deterministic.  The errors are
not visible in the difference image, and the Euclidean distance
is typically up to a few hundreds for a $400\times400$ images.

## TODO

1. Clean up the data set and use more descriptive names.
2. Remove duplicates.
2. Extend the test set to use all models and a representative range
   of data points.
4. Review the non-deterministic results.

# $\xi$-move Test

+ `Scripts/ximovetest.sh`

This tests the roulette simulator, splicing images with 
different image points.
The output images are in `Test/ximove`*date*.  The spliced
images are prefixed `join-` and should look like plausible
distortions, with symmetry and continuous shapes.

# Roulette Reconstruction Test

+ `Test/roulettelens/test.sh`
