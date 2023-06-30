---
title: CosmoSim Simulation Model
theme: minima
permalink: /docs/model/
usemathjax: true
---

+ [Sketches of the Mathematical Model](Model)
+ [Roulette](Roulette Model)

# Terminology

+ `eta` ($\eta$) is the actual position of the source in the source plane.
    + This is set by `LensModel::setXY` or `LensModel::setPolar`
    + RaytraceModel uses a local $\eta$ corresponding to the pixel currently
      being evaluated, but this is local to that single method.
+ `nu` ($\nu$) is the apparent position of the source in the source plane.
    + This can be set with `LensModel::setNu`.
+ `xi` ($\xi$) is the apparent position of the image in the lens plane.
    + This is updated by `LensModel::setNu`, as $\xi=\chi\nu$.
    + RouletteModel also has a `setXi()` method to set $\xi$ to an arbitrary
      position.
+ `etaOffset` ($\Delta\eta$) is so that $\xi$ is the image
  $\eta+\Delta\eta$.

# Software Model

![Class diagram](lensmodel.svg)

The software aims to separate the simulation model (LensModel)
and the actual lens (Lens), as is seen in the class diagram above.
This is only partly implemented so far.  The two simulation models
for point mass lenses as well as SphereModel integrate the lens 
in simulation model.  The SphereModel is a legacy class, kept
only for reference.  In practice it should be replaced with RouletteModel
using SIS.  The two point mass models, in contrast, will take some
work to decouple.

Only one actual lens model has been implemented, namely SIS.
However, it can be used either directly, or in a sampled version
by wrapping it inside SampledModel.  The sampled model is really
intended for lenses where an algebraic expression for the lens
potential $\psi$ is not known, but the only case implemented is
sampling an computable function.


# TODO

+ `getDistortedPos(r,theta)` calculates the source plane position $\eta'$
  in the local co-ordinate system centred at `eta`, given a polar
  co-ordinates $(r,\theta)$ centred on `\xi` in the lens plane.
    + this is called in `LensModel::distort()`
    + `etaOffset` is added to the output to compensate if $\xi$ is not
      the apparent position
+ RaytraceModel has its own `distort()` function not using
  `getDistortedPos(r,theta)` working on a different logic

##  LensModel flowchart
