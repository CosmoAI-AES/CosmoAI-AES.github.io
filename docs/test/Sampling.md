---
title: Sampling Tests
permalink: /docs/test/Sampling
usemathjax: true
date: 2024-04-16
---


# Sampling Tests

The sampling tests are designed to compare two different simulation models for the
same lens model.
The test in `Test/SIE` is new April 2024 and can serve as a template.
The original intention was to validate SIE by comparing raytrace and sampled simulation.
Comparison of SIS was added to validate the sampled simulator.

The test is run as
```
sh sie.sh
sh sis.sh
```
and generates several directories with images.  Most importantly, the `montage` and
`montageSIS` directories, which contains montages of the source, two distorted images
for the two simulation models, and the diff.

**Other tests**
+ `test/sampling` is an old test comparing Roulette SIS with sampled simulation
