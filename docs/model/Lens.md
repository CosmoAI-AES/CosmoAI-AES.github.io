---
title: Lens Models
theme: minima
usemathjax: true
---

# Lens Models

The lens can be defined either as a function in two variables $(x,y)$
or as a sampled signal in two dimensions.
1. `PsiFunctionLens` uses a function.
1. `SampledPsiFunctionLens` wraps a `PsiFunctionLens` object, sampling its function.
1. `PixMapLens` is intended to use an arbitrary sampled signal, but this is not fully
   implemented yet, and has not been tested.

## Common API

The common API is specified by the `Lens` superclass.

+ `getXi($\chi\eta$)` calculates the apparent position $\xi$
  for a given source position $\chi\eta$.
  Co-ordinates are in the lens plane to be totally independent of the source.

## Algebraic Lens Functions

The `PsiFunctionLens` defines the functions `psiValue()`,
`psiXvalue()`, and `psiYvalue()` to compute $\psi$, $\partial \psi/\partial x$,
and $\partial \psi/\partial y$ respectively.
These functions are hardcoded, and subclasses have to be defined for each 
parametric lens model.
Currently SIS and SIE is provided.  There is also a `PointMassLens` class,
but this has not been tested.

## Sampled Lenses

The `SampledLens` class defines the lens potential $\psi$
as a 2D sampled array.
The only operational subclass is `SampledPsiFunctionLens` which
takes a constituent `PsiFunctionLens` object `lens` and samples $\psi$
by calling `lens->psiValue()`.

The `SampledLens` class calculates the deflection, i.e. the derivatives
of $\psi$, using a differentiation filter.  This makes it an alternative
approach for lenses where analytic differentiation is difficult, and an
independent test where analytic derivatives have been implemented.

Note that `SampledPsiFunctionLens` relies on the constituent lens to
calculate `caustic()` and `criticalXi()`.  This should probably be changed
to use generic sampled calculatation of the caustics and critical curves.
(**TODO**)
