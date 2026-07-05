---
title: Raytrace Simulation
usemathjax: true
---

# Raytrace Simulation

The critical API for raytrace simulation are the `psiXvalue(x,y)` and `psiYvalue(x,y)`,
which gives the two elements of $\nabla\psi(x,y)$.
These are defined by the `Lens` class.

Subclasses of `PsiFunctionLens` class implement `psiXvalue(x,y)` and `psiYvalue(x,y)`
by calculating algebraic expressions for the partial derivatives
of $\psi$.
To enable raytrace simulation with new lens models, all that is needed is
a subclass implementing these two functions.

Sampled lenses implement `psiXvalue(x,y)` and `psiYvalue(x,y)` using
differentiation filters.
To make a new subclass of `PsiFunctionLens` work with sampled simulation
(using the `SampledPsiFunctionLens`), all that is need is the
`psiValue(x,y)` function which evaluates $\psi$.
