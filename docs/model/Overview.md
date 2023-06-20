---
title: CosmoSim Simulation Model
theme: minima
permalink: /docs/model/
---

+ [Sketches of the Mathematical Model](Model)

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

# Roulette Computation

![Class diagram](lensmodel.svg)

The reference points are calculated in the following order

1. $\eta$ is the actual source position as given by the problem.
1. $\xi$ is the apparent position in the lens plane.
   This is calculated by inverting the ratrace equation.
2. $\nu=\xi/\chi$ is the apparent position in the source plane.
4. $\nu'$ is the centre of light in the distorted image.
   This is calculated from the output image, and it serves as
   an objective reference point which can be recalculated from the
   image regardless of shifts and cropping.
5. $\xi'=\chi\nu$ scales the centre point back to the lens plane.
5. $\eta'$ is the source point corresponding to $\xi'$ according
   to the raytrace equation.
   In principle, any simulator model can compute this, but raytrace
   is most efficient and there is no reason not to use this.

# TODO

+ When are the roulette amplitudes calculated?
+ `getDistortedPos(r,theta)` calculates the source plane position $\eta'$
  in the local co-ordinate system centred at `eta`, given a polar
  co-ordinates $(r,\theta)$ centred on `\xi` in the lens plane.
    + this is called in `LensModel::distort()`
    + `etaOffset` is added to the output to compensate if $\xi$ is not
      the apparent position
+ RaytraceModel has its own `distort()` function not using
  `getDistortedPos(r,theta)` working on a different logic

##  LensModel flowchart
