---
title: Roulette Calculations
usemathjax: true
---

# Roulette Calculations

The simulator can calculate the roulette amplitudes $\alpha\_s^m$ and
$\beta\_s^m$ for some lens models.  It can also take the roulette amplitudes
as input, and simulate a distorted image in a neighbourhood.
The support is only partially implemented for most lens models.


## SIS

SIS has the most extensive support.  

+ The `amplitudes.py` script calculates algebraic formulæ for the roulette
  amplitudes and export these to a file (usually `50.txt`) included in the distribution.
+ The `SIS` class reads the file (`50.txt`) and evaluates the formulæ to calculate the
  amplitudes in a given point (usually corresponding to the centre of the source).
+ The `datagen.py` script can output a new dataset including roulette amplitudes
  when images are created.
+ The `roulettegen.py` can read the dataset with amplitudes and simulate distorted images
  using the `RouletteRegenerator` class.

All of these procedures are reasonably fast and can be tested with little trouble.

## SIE

The support for SIE follows the same pattern as SIS, but the symbolic calculation is
extremely time consuming.  It seems to be possible to calculate 5-10 orders, but test
runs often crash.  This is work in progress.

We have implemented several versions of the amplitudes scripts,
+ no simplification (`amplitudes2.py`) is fast bat generates enormous files.
    + there seems to be a bug which can kill the script before the file is completely written
    + one run on IDUN completes in a minute ($m=5$) but the output file is not complete
    + it uses a lot of memory and seems to crash on nyquist ($m=5$ and 32Gb).
+ factoring between (`amplitudes.py`) as used for SIS is slow
+ full simplification (`amplitudessim.py`) is extremely slow but produces shorter files

## Point Mass Lens

Point Mass Lenses can be simulated in the roulette model using the 
`PointMassRoulette` class.
There is no decoupled lens class for pointmass, and therefore
the roulette amplitudes cannot be explicitly calculated and exported.



