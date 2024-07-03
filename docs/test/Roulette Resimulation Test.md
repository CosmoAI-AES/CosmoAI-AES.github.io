---
title: CosmoSim Roulette Resimulation Test
permalink: /docs/test/Roulette Resimulation Test
usemathjax: true
---

# CosmoSim Roulette Resimulation Test


These tests were made for the development of the Roulette
Resimulator.  Documentation is incomplete.

## Roulette Reconstruction Test

+ **Directory** `Test/roulettegen`

Given a dataset as CSV, this test
1. generates images 
2. generates a new CSV file including roulette amplitudes, 
3. generate motages of the original and reconstructed images
   as well as the difference image in the `montage/` directory.
1. compares the images calculating the Euclidean image for
   different concentric neighbourhoods around the origin.

### Test Script

````
cd Test/roulettegen
make clean
sh test.sh
```

The test script compares the original roulette simulation
with the resimulation.  
Output image collages is found in the `montage` directory.

### Makefile

````
cd Test/roulettegen
make montage.log
```

The makefile compares the roulette resimulation
with raytrace simulation.
Output image collages is found in the `montage` directory.

### Old notes

The output is a mess, but it is standardised for many different tests.
If one uses the text log, one should look for the string 
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

## $\xi$-reference Test

+ `Test/xireference/test.sh`

This test has not been reviewed lately.  It provides an alternative `Makefile` using the
`--xireference` option.  Duplicate files have been removed, and must be taken from
the `roulettegen` test.
