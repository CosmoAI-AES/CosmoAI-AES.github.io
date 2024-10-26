---
title: Source Constellation
theme: minima
usemathjax: true
---

(New in v2.5.1)


The basic simulator design assumes a single source at a given position
$(x,y)$.  This is important for the roulette simulator which expands
$\psi$ around the apparent position corresponding to $(x,y)$.

The `SourceConstellation` makes it possible to add multiple sources
to one constellation.  This should work fine with raytrace, but there
is not yet support to manage this with a roulette simulation.

To use a `SourceConstellation` each constituent source is created as
usual and added to the constellation at a given $(x,y)$ coordinate,
using the `addLens()` method.

