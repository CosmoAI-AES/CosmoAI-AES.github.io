---
title: CosmoSim Test Scripts
permalink: /docs/test/
usemathjax: true
---

# CosmoSim Test Scripts

This is a partial description of the most important test
suites implemented.
For details, it is still necessary to read the code, unfortunately.

+ [Sampling Tests](Sampling)
+ [Regression](Regression) Tests
+ [Roulette](Roulette) Tests

## $\xi$-move Test

+ `Scripts/ximovetest.sh`

This tests the roulette simulator, splicing images with 
different image points.
The output images are in `Test/ximove`*date*.  The spliced
images are prefixed `join-` and should look like plausible
distortions, with symmetry and continuous shapes.

## Roulette Reconstruction Test

+ `Test/roulettelens/test.sh`

Given a dataset as CSV, this test
1. generates images 
2. generates a new CSV file including roulette amplitudes, 
3. generate motages of the original and reconstructed images
   as well as the difference image in the `montage/` directory.
1. compares the images calculating the Euclidean image for
   different concentric neighbourhoods around the origin.

The output is a mess.  One should look for the string 
`maskedCompare` which appears once for each data point,
like this.
```
maskedCompare (600, 600, 3)
diff/image-s003.png(10): 0.049611466296889374 (47.18050444834179); size=951.0
diff/image-s003.png(20): 0.02648499649355367 (99.87492177719089); size=3771.0
```
Each row is the comparison of one neigbourhood in the form
```
imagefile(radius): relative distance (distance): size
```
Here the size is the size of the neighbourhood, the distance
is the Euclidean distance between the original and the reconstructed
neighbourhood, and relative distance is disance divided by size.

