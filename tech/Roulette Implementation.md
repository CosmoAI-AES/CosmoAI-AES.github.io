---
title: Roulette Implementation
---

# Roulette Implementation

Calculation of roulette amplitudes is one of the most tricky parts
of CosmoSim due to computational and numberical complexity.

For `SampledLens` the implementation is straight forward, using numeric
differantiation in the C++ code.
For the original point mass model, `PointMassRoulette`, the amplitudes
are never explicitly calculated. Instead, closed formulæ are used.

For `PsiFunctionLens`, the amplitudes are calculated analytically by
the `CosmoSim.Roulettes` module and stored in text files which are
included in the library.  These files are loaded by the C++ code where
the formulæ are evaluated in specific points to give numeric amplitudes.

Two different procedures for calculation are offered by
`CosmoSim.Roulettes` and `CosmoSim.Roulettes.sie` respectively.

+ [](/math/Roulette%20Amplitudes%20in%20SIE.md) describes 
  `CosmoSim.Roulettes.sie`
+ `CosmoSim.Roulettes` uses simpler recursive formulæ

Until v3.0.4 the former is used only for SIE, while SIS and pointmass
uses the latter.  However, the latter method proves highly inaccurate on 
pointmass lenses, compared to the closed form implementation.

The former method in contrast, is computationally more expensive.

::: {note} Work in progress
We need further research to see if either method is viable for each lens 
in question.

:::


