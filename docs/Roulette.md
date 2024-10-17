---
title: The Roulette Model
theme: minima
usemathjax: true
---

# Roulette Simulation

**under construction**

There is a range of older documents giving different persectives on
the roulette formalism.  They may not be up to date.

+ [Roulette Formalism](model/Roulette)
  discussing basic notation and correspondence with code components
+ The generic [Roulette Formalism](/math/Roulette)
+ See also the [Lens Models](/math/Lens)

## Calculation of Roulette Amplitudes

The simulator can calculate the roulette amplitudes $\alpha\_s^m$ and
$\beta\_s^m$ for some lens models.  It can also take the roulette amplitudes
as input, and simulate a distorted image in a neighbourhood.

At present SIS and SIE are supported.

## SIS

SIS has the most extensive support.  

+ The `amplitudes.py` script calculates algebraic formulæ for the roulette
  amplitudes and export these to a file (usually `sis50.txt`) included in the distribution.
+ The `SIS` class reads the file (`sis50.txt`) and evaluates the
  formulæ to calculate the amplitudes in a given point
  (usually corresponding to the centre of the source).
+ The `datagen.py` script can output a new dataset including roulette amplitudes
  when images are created.
+ The `roulettegen.py` can read the dataset with amplitudes and simulate distorted images
  using the `RouletteRegenerator` class.

All of these procedures are reasonably fast and can be tested with little trouble.

## SIE

The support for SIE follows the same pattern as SIS, but the
symbolic calculation is more time consuming and fewer terms can be
supported.  

The script `sieamplitudes.py` generates the algebraic formulæ for SIE.
Currently only five terms ($m\le5$) is distributed (`sie05.txt`).

## Point Mass Lens

Point Mass Lenses can be simulated in the roulette model using the 
`PointMassRoulette` class.
There is no decoupled lens class for pointmass, and therefore
the roulette amplitudes cannot be explicitly calculated and exported.



