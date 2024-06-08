---
title: Sampling Tests
permalink: /docs/test/Sampling
usemathjax: true
date: 2024-06-08
---


# Model Comparison Tests

+ **Directory** Tests/Tutti
+ **Purpose** validate consistency between models.

```
sh sis.sh
sh compare.sh
```

The first command `sie.sh` generates images using four different configurations,
both Raytrace and Roulette in both analytic and sampled versions.  The dataset
includes only SIS lenses but could be extended.

The second command compare each simulation model against its sampled counterpart and
analytic raytrace against analytic roulette.  The result is visualised in the montage
directories `montaige-raytrace`, `montage-roulette`, and `montage-compare` for visual
validation.

The comparisons are not expected to be exact.  The sampled lenses will produce numerical
inaccuracies, and the roulette formalism only works within the convergence ring.
The tester will have to rely on informed judgement.
