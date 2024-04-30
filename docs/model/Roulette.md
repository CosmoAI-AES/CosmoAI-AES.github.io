---
title: The Roulette Model
theme: minima
usemathjax: true
---

# The Roulette Formalism

## Computation of the Roulette Amplitudes

![Geometry of source and image points](points.svg)

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



# RouletteRegenerator: Simulation from Roulette Amplitudes 

![Geometry of source and image points](relativeeta.svg)

To make the reconstruction work, we need the following geometrical 
points.

1.  $\xi$ is the apparent position and the reference point for the
    roulette model in the original formulation.  Unfortunately
    it cannot easily be recovered from a distorted image.
2.  $\nu'=\xi'/\chi$ is the centre of luminence in the distorted image, and
    can be recovered from the image.
    Thus this will be used as the reference point and the centre of the
    image in the regeneration.
    This is stored in the CSV file as (`centreX`,`centreY`).
3.  $\eta$ and $\eta'$ are the source position corresponding respectively
    to $\xi$ and $\xi'$.
    - $\eta$ is input to the original simulation, but it cannot be recovered
      without knowledge of $\xi$
    - $\eta'$ is computed from $\xi'$ using raytracing.
4.  $\Delta\eta=\eta'-\eta$ is the difference between the centre of the source
    ($\eta$) and the reference point $\eta'$ corresponding to the centre of the
    roulette convergence ring.
    It is calculated by `LensModel::getOffset`$(\nu')$ 
    and stored in the CSV output from `datagen.py` as (`offsetX`,`offsetY`).
4.  $\eta''=\eta-\nu'$ is the source position ($\eta$) in the co-ordinate system
    centred at $\nu'$.  This is calculated by `LensModel::getRelativeEta`$(\nu')$,
    and stored in the CSV output from `datagen.py` as
    (`reletaX`,`reletaY`).

Note that $\eta$ and $\eta'$ are defined in the source plane and $\xi$ and $\xi'$
in the lens plane.  Working in the source image, which is also in scale with the
images, we have $\nu=\xi/\chi$ and $\nu'=\xi'/\chi$.

## Generate the Roulette Data Set

The `datagen.py` script generates the data set.

1.  Normal image generation
2.  Centre the image and record the image centre $\nu'=\xi'/\chi$.
3.  Find $\xi'=\chi\nu'$
4.  Find the roulette amplitudes in $\xi'$ using `getAlpha` and `getBeta`
4.  Get $\eta''$ from `getRelativeEta()`
5.  Get $\Delta\eta$ from `getOffset()`
5.  Write CSV
    - original data
    - $\eta''$
    - $\Delta\eta$
    - amplitudes

## Reconstruction from the Roulette Data Set

Reconstruction is different from the regular roulette simulation.
Both $\xi$ and $\eta$ are set explicitly and the lens location is unknown.
In theory the lens location could be inferred, but as a free variable it leaves
$\xi$ and $\eta$ to be set independently.
This is implemented in `RouletteRegenerator` which does not use a separate lens
model.

1. The `setCentre()` method will
    1. $\nu := 0$ (centre of distorted image); consequently $\xi=0$
    2. Set $\eta := \eta''$ as read from the CSV file.
    2. set the `etaOffset` to $\Delta\eta$ as read from the CSV file
2. The roulette amplitudes are set using `setAlphaXi` and `setBetaXi`.
3. Now the simulation can be run using standard methods inherited from
   `LensModel` and `RouletteModel`.

## Functions

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

# TODO

+ When are the roulette amplitudes calculated?
