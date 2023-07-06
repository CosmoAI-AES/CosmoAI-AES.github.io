---
title: Lens Models
theme: minima
usemathjax: true
---

The lens can be defined either as a function in two variables $(x,y)$
or as a sampled signal in two dimensions.
1. `PsiFunctionLens` uses a function.
1. `SampledPsiFunctionLens` wraps a `PsiFunctionLens` object, sampling its function.
1. `PixMapLens` is intended to use an arbitrary sampled signal, but this is not fully
   implemented yet, and has not been tested.

# Common API

The common API is specified by the `Lens` superclass.
