---
title: Software Model
theme: minima
permalink: /docs/Software
usemathjax: true
---

# Software Model

CosmoSim consists of a backend written in C++ and multiple
frontends written in Python.  
These components are documented separately.

1.  The [simulator library](/tech/simlib/Overview.md), *simlib*,
    implements the [mathematical models](/math/math.md) and
    makes up the backend.
1.  [](GUI.md)
1.  The API.
1.  The command line interface
1.  `CosmoSim.Roulettes` makes symbolic calculation of roulette amplitudes.

The mathematical model is implemented in *simlib*, which
is consequently the most important part to document properly.

## Calculation of roulette amplitudes

For the SIS and SIE lenses, we have analytic formulas for the roulette
amplitudes.  The python scripts under the `python` directory compute
these formulas by symbolic algebra, and produce the files sie05.txt and
sis50.txt which are included in the distribution.

These formulas are imported by the C++ library (simlib) to compute
amplitudes during simulation.

## More information

+ [](/tech/Notation.md) and relationship between the software and the mathemaical model.
+ [](/docs/test/Test)
