---
title: Raytrace Simulation
usemathjax: true
---

# Raytrace Simulation

The critical API for raytrace simulation are the `psiXvalue(x,y)` and `psiYvalue(x,y)`,
which gives the two elements of $\nabla\psi(x,y)$.
These are defined by the `Lens` class.

The `PsiFunctionLens` class implement `psiXvalue(x,y)` and `psiYvalue(x,y)`
using the `psiXfunction(x,y)` and `psiYfunction(x,y)` which are implemented
in subclasses to evaluate the algebraic expression for the partial derivatives
of $\psi$.
To enable raytrace simulation with new lens models, all that is needed is
a subclass implementing these two functions.

Sampled lenses implement `psiXvalue(x,y)` and `psiYvalue(x,y)` using
differentiation filters.
