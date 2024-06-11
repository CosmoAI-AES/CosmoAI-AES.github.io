---
title: Sampling Tests
permalink: /docs/test/Model Comparison
usemathjax: true
date: 2024-06-08
---


# Model Comparison Tests

+ **Directory** Tests/SIE, Tests/SIS
+ **Purpose** validate consistency between models.

```
cd Tests/SIS
sh sis.sh
sh compare.sh
```

The first command `sis.sh` generates images using four different configurations,
both Raytrace and Roulette in both analytic and sampled versions.  
(See SIE below.)

The second command compare each simulation model against its sampled counterpart and
analytic raytrace against analytic roulette.  The result is visualised in the montage
directories `montaige-raytrace`, `montage-roulette`, and `montage-compare` for visual
validation.

The comparisons are not expected to be exact.  The sampled lenses will produce numerical
inaccuracies, and the roulette formalism only works within the convergence ring.
The tester will have to rely on informed judgement.

Similar tests exist for SIE.  The lens models are kept separate because sampled and
analytic approaches are treated as different lenses and there is no easy way to combine
SIE and SIS while keeping sampled lenses separate.

```
cd Tests/SIE
sh sie.sh
sh compare.sh
```

## Sampling Results

The sampling tests (`montage-raytrace` and `montage-roulette`) are designed
to validate analytic models by using a sampled version as reference. 

## Roulette Results

The `montage-compare` results are created to validate the roulette model,
and thus the calculation of roulette amplitudes.
