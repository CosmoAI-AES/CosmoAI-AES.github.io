---
title: Implementation of SIE
---

(tech-sie)=
# Implementation of SIE

It has taken several iterations to arrive at an implementations which
can compute high order roulette amplitudes in reasonable time.
The following implementation of roulette amplitudes was introduced in v3.4,
replacing [](#tech-sie-v3.3).

## Raytrace

This is implemented in the SIE class (`src/simlib/SIE.cpp`).

To evaluate the lens potential $\psi^{\mathrm{R}}(x,y)$,
we calculate the polar coordinates
$R$ and $\phi$, and use the formula (see [](#math-sie)) for
$\psi_\textrm{SIE}^R(\xi_0,f,\lambda_L;R,\phi)$.
The deflection is given by [](#theorem-sie-deflection).

::: {note} Note
In polar co-ordinates, we replace $x/R$ and $y/R$ with $\cos\phi$
and $\sin\phi$
respectively, and find that $\nabla\psi$ is constant in $R$.
:::

(sie-roulette)=
## Roulette Amplitudes for the SIE Lens

The roulette amplitudes for SIE are calculated by `CosmoSim.Roulettes.fastsie`,
in two steps

1.  `symdiff()` computes a dictionary of derivatives using [](#math-sie).
2.  `thirdworker()` computes a dictionary of amplitudes, using
    [](#def-roulette-original).
