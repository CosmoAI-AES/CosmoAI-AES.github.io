---
title: CosmoSim Simulation Model
theme: minima
permalink: /docs/model/
usemathjax: true
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

## The Roulette Model

1. Masking methods
2. `setLens()`
3. `getDistortedPos(r,theta)`
4. The `distort()` function is inherited from LensModel.
    + It uses `etaOffset` + `getDistortedPos(r,theta)` to find the source pixel
5. `updateApparentAbs()`
    + uses $\eta$ as stored in the model object itself, and requests a $\xi$ to be
      calculated by the Lens object.
    + then it calls `setNu()` which is inherited from LensModel
    + this also sets `etaOffset = 0`
6. `setXi(xi1)`
    + set $\xi$ to the given value
    + calculate $\eta'$ corresponding to $\xi$ using raytrace
    + set $\Delta\eta=\eta'-\eta$

Special for resimulation from roulette amplitudes:

+ `setXiEta()` **to be implemented**

# Roulette Computation

![Class diagram](points.svg)

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


## Generate the Roulette Data Set

1.  Normal image generation
2.  Centre the image and record the image centre $\nu'$
3.  Find $\xi'=\chi\nu'$
4.  The the roulette amplitudes in $\xi'$ using `getAlpha` and `getBeta`
4.  get $\eta'$ and/or $\Delta\eta$
    - **TODO** how do we do this?
    + Set $\nu:=\nu'$ in the simulator?
5.  Write CSV
    - original data
    - $\Delta\eta$
    - amplitudes

## RouletteRegenerator: Simulation from Roulette Amplitudes 

![Class diagram](relativeeta.svg)

To make the reconstruction work, we need the following geometrical 
points.

1.  $\xi$ is the apparent position and the reference point for the
    roulette model in the original formulation.  Unfortunately
    it cannot easily be recovered from a distorted image.
2.  $\xi'$ is the centre of luminence in the distorted image, and
    can be recovered from the image.
    Thus this will be used as the reference point and the centre of the
    image in the regeneration.
3.  $\eta$ and $\eta'$ are the source position corresponding respectively
    to $\xi$ and $\xi'$.
    - $\eta$ is input to the original simulation, but it cannot be recovered
      without knowledge of $\xi$
    - $\eta'$ is computed from $\xi'$ using raytracing.
4.  $\Delta\eta=\eta'-\eta$
4.  $\eta''=\eta-\xi'$ is the source position ($\eta$) in the co-ordinate system
    centred at $\xi'$.  This is calculated by `LensModel::getRelativeEta(xi1)`
    where `xi1` is $\xi'$.


1. $\xi := 0$ (centre of distorted image)
2. Consequently $\nu=0$
2. **TODO** Calculate $\eta'$ using the `setCentre()` method
2. $\eta := -\Delta\eta$ (source location, now relative to the distorted image)
4. Lens position is irrelevant and unknown, and can thus not be used as origin

This is somewhat different from the regular roulette simulation.
Both $\xi$ and $\eta$ are set explicitly and the lens location is unknown.
In theory the lens location could be inferred, but as a free variable it leaves
$\xi$ and $\eta$ to be set independently.

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

# Technical Design

## Components

### C++ components

+ Lens Models
    + `LensModel.cpp` is the abstract base class.
    + `PointMassLens.cpp` simulates the point mass model
      using the exact formulation
    + `RoulettePMLens.cpp` simulates the point mass model using
      the Roulette formalism
    + `SphereLens.cpp` simulates the SIS model
+ Source Models
    + `Source.cpp` is the abstract base class.
    + `SphericalSource.cpp` is standard Guassian model
    + `EllipsoidSource.cpp` is an ellipsoid Guassian model
    + `TriangleSource.cpp` is a three colour triangle source,
       intended for debugging
+ `simaux.cpp` is auxiliary functions
+ `CosmoSim.cpp` defines the `CosmoSimPy` class with python bindigs.
  This class operates as a facade to the library, and does not 
  expose the individual classes.

### Python Components

+ `CosmoSim` is a wrapper around `CosmoSimPy` from `CosmoSim.cpp`,
  defining the `CosmoSim` class.
+ `CosmoGUI` is a tkinter desktop application, providing a GUI to the
  simulator
+ `CosmoSim.View` is a tkinter widget displaying the source and 
  distorted image for `CosmoGUI`.
+ `CosmoSim.Controller` is a tkinter widget to interactively set
  the simulator parameters for `CosmoGUI`.
+ `CosmoSim.Image` provides post-processing functions for the images.
+ `datagen.py` is a batch script to generate distorted images.


## Lens Model Class

### Virtual Functions

The following virtual functions have to be overridden by most subclasses.
They are called from the main update function and overriding them, the entire
lens model changes.

+ `calculateAlphaBeta()`
  pre-calculates $\alpha$ and $\beta$ in the distortion equation.
+ `getDistortedPos()`
  calculates the distortion equation for a give pixel.

The constructor typically has to be overridden as well, to load the formulæ for
$\alpha$ and $\beta$.

### Setters 

Setters are provided for all of the control parameters.

+ `updateXY` to update the $(x,y)$ co-ordinates of the actual image, the
  relative distance $\chi$ to the lens compared to the source, and the
  Einstein radius $R_E$.
  This has to update the apparent position which depends on all of these
  variables.
+ `updateSize` to update the size or standard deviation of the source.
+ `updateNterms` to update the number of terms in the sum after truncation
+ `updateAll` to update all of the above

### Getters

Getters are provided for the three images.

+ `getActual()`
+ `getApparent()`
+ `getDistorted()`

### Update

The main routine of the `Simulator` is `update()` which recalculates the 
three images: actual, apparent, and distorted.  This is called by the setters.

In addition to the virtual functions mentioned above, it depends on

+ `parallelDistort()` and `distort()` which runs the main steps in parallel.
+ `drawParallel()` and `drawSource()` which draws the source image.

## Auxiliaries 

The `simaux.cpp` file provides the following:

+ `factorial_()`
+ `refLines()` to draw the axis cross

