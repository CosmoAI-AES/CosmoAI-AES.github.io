---
title: Simulator Model
theme: minima
permalink: /docs/model/Simulator
usemathjax: true
---

# The Simulation Model


## Usage

+ Setters to be used to configure the lens and the simulator
    + `setLens()` - lens parameters are set in the lens object
    + `setCentred()`
    + `setMaskMode()`
    + `setBGColour()`
    + `setXY()`
    + `setPolar()`
    + `setCHI()`
    + `setNterms()`
    + `setSource()`
+ `update()` has to be called to recalculate the image
+ `getDistorted()` returns the distorted image
+ Other image getters
    + `getSource()`
    + `getActual()`
    + `getApparent()`
+ Other parameter getters (used in CosmoSimPy)
    + `getXi()`
    + `getTrueXi()`
    + `getNu()`

## Attributes

+ Private variables in `SimulatorModel`
    + `eta` ($\eta$) is the actual position of the source in the source plane.
        + **setters** `SimulatorModel::setXY` or `SimulatorModel::setPolar`
            + these should be called by the user interface
        + RaytraceModel uses a local $\eta$ corresponding to the pixel currently
          being evaluated, but this is local to that single method.
    + `nu` ($\nu$) is the apparent position of the source in the source plane.
        + **setter** `SimulatorModel::setNu(`$\nu$`)`
            + this also sets `referenceXi` and `etaOffset`
        + `updateApparentAbs()` calculates $\nu$ and calls `setNu(`$\nu$`)`.
        + To calculate $\nu$ for a given $\eta$, `Lens::getXi(`$\chi\eta$`)` is
          used.
    + `xi` ($\xi$) refers to a reference point in the lens plane. 
      It appears in many local scopes, typically referring to the point
      being calculated.
      In the Roulette Model, we use `referenceXi` to refer to the reference
      point around which the roulettes are expanded.
        + This is updated by `SimulatorModel::setNu`, as $\xi=\chi\nu$.
        + **setter**  `setXi()` 
            + this also sets `etaOffset`
+ `etaOffset` ($\Delta\eta$) is so that $\xi$ is the image of
  $\eta+\Delta\eta$; i.e. $\Delta\eta=\xi/\chi-\eta$
    + This is protected and accessed in `RouletteRegenerator`


## Consistency

It is important to note that the setters do not ensure a consistent 
state.  Hence, after setting parameters, the model must be updated
to ensure consistency.

+ `updateApparentAbs` (protected) calculates inferred variables to ensure a
  consistent state.  
    + First it calls `lens->updatePsi(im.size())` to make sure the lens
      is consistent
    + Then it sets the apparent position $\nu$ using $\xi$ as calculated
      by `lens->getXi(` $\chi\eta$ `)`
    + Overriding subclasses:
        + `RotatedModel` where the image is rotated for calculation
        + `RouletteRegenerator` where it does nothing
    + `updateApparentAbs` is only called by `update()` below.
+ `update` recalculates the distorted image
+ `calculateAlphaBeta` calculates the roulete amplitudes if required.
    + In most classes, this is empty and does nothing.
    + In `RouletteModel` (but not `RouletteRegenerator`) it calls
      `lens->calculateAlphaBeta` to compute the amplitudes.
    + It is called only from the `distort()` method which is never overridden.


## TODO

+ `getDistortedPos(r,theta)` calculates the source plane position $\eta'$
  in the local co-ordinate system centred at `eta`, given a polar
  co-ordinates $(r,\theta)$ centred on `\xi` in the lens plane.
    + this is called in `SimulatorModel::distort()`
    + `etaOffset` is added to the output to compensate if $\xi$ is not
      the apparent position
+ RaytraceModel has its own `distort()` function not using
  `getDistortedPos(r,theta)` working on a different logic

###  SimulatorModel flowchart

## Technical Design

### Components

#### C++ components

+ Simulation Models
    + `SimulatorModel.cpp` is the abstract base class.
    + Modular Lens Models
        + `RouletteModel.cpp`
        + `Raytrace.cpp`
    + Semi-Modular Models using `RotatedModel.cpp` as a superclass.
      It overrides functions to rotate the image and make all calculations
      assuming the source placed on the $x$-axis.
      The subclasses override `getDistortedPos()` to hardcode the actual
      distortion, and thus assume a specific lens model, but they still
      delegate `getXi()` to a Lens Object.
        + `PointMassExact.cpp` simulates the point mass model
          using the exact formulation
        + `PointMassRoulette.cpp` simulates the point mass model using
          the Roulette formalism
    + Monolithic Lens/Simulation Models
	+ `RouletteRegenerator.cpp` is for simulation from roulette amplitudes
	   without any concrete lens model.
+ Lens Models
    + `SIS.cpp` 
    + `SIE.cpp`  
    + `PointMass.cpp` is incomplete and so far used only with the `RotateModel` models. 
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

#### Python Components

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


### Simulator Model Class

#### Virtual Functions

The following virtual functions have to be overridden by most subclasses.
They are called from the main update function and overriding them, the entire
lens model changes.

+ `calculateAlphaBeta()`
  pre-calculates $\alpha$ and $\beta$ in the distortion equation.
+ `getDistortedPos()`
  calculates the distortion equation for a give pixel.

The constructor typically has to be overridden as well, to load the formulæ for
$\alpha$ and $\beta$.

#### Getters

Getters are provided for the three images.

+ `getActual()`
+ `getApparent()`
+ `getDistorted()`

#### Update

The main routine of the `Simulator` is `update()` which recalculates the 
three images: actual, apparent, and distorted.  This is called by the setters.

In addition to the virtual functions mentioned above, it depends on

+ `parallelDistort()` and `distort()` which runs the main steps in parallel.
+ `drawParallel()` and `drawSource()` which draws the source image.

