---
usemathjax: true
---

# Notattion in the Implementation

THe notation in the implementation differs from the one used in the mathemaical
descriptions.

+ `alpha` and `beta` refer to the roulette amplitudes.
+ The actual source position $\beta$ is denoted `eta` in the C++ code.
    + the value is retrieved as `SimulatorModel::getEta()`.
+ `einsteinR` refers to the Einstein radius $\theta_E$.
    + `theta` refers to the rotation of an elliptic source.
+ The actual position $\theta$ is denoted `nu` 
    + using angular co-ordinates, we identify $\nu$ and $\xi$ with $\theta$,
      and variables and functions are not consistently named.
    + `nu` is computed by `Lens::getXi()` (which may be overridden)
      as a function of `eta` ($\beta$).
+ `referenceXi` is the point in which the roulette amplitudes are computed.
    + In the standard mode of operation, this is equal to `nu` ($\theta$),
      but it is possible to set it arbitrarily.
+ `xi` is often used as a local variable, referring to an observed point
  where the light intensity is being computed.  It is not fixed point in
  the model.


## Coordinate system

Applying machine learning, it is important to view the coordinate 
system as arbitrary.  If, say, the lens is fixed at origin, information
is leaked.  For this reason, the images are translated to have the origin
at the centre of visible light.

As a consequence, `CosmoSim` has to consider at least two co-ordinate 
systems: one for calculation and one for presentation.

+ The critical points in the simulator are
    + $\xi=\nu$, $\eta$
    + `referenceXi` which is the reference point for the roulett formalism.
      This is normally equal to $\xi=\nu$, but may be set arbitrarily.
    + The lens position which defaults to the origin
+ The CSV outfile gives
    + `centreX`, `centreY`   ($\xi'$)
    + `reletaX`, `reletaY`   ($\xi' \mapsto \eta - \xi'$)
    + `xiX`, `xiY`  (`xioffset` internally: $\xi'\mapsto\nu-\xi'$
    + `offsetX`, `offsetY`   ($\xi' \mapsto \xi' - \nabla\psi(\xi') - \eta$)

Here $\xi'$ is the origin of the new co-ordinate system, so that
`xi?` and `releta?` are $\nu$ and $\eta$ in the the new frame.

The (`offsetX`,`offsetY`) pair places `referenceXi`.
It is the difference between the actual source position $\eta$ and the
source position corresponding to observed position $\xi'$ (`relativeXi`).
This is used in the `distort()` function in the simulator to get light
from the right pixel in the source image.

## Image coordinates

It is important to note that images are indexed as matrices, and not with
standard Cartesian co-ordinates.  The distortion models are implemented
in Cartesian co-ordinates, following the mathematical model, and needs
to be converted to image co-ordinates whenever images are references.

This looks like this:
```cpp
xi = pointCoordinate( cv::Point2d( row, col ), dst ) ;
ij = imageCoordinate( xi, src ) ;
```
Here `xi` is the geometric point corresponding to index (`row`,`col`)
in the image array, and `ij` is the index (`row`,`col`).  
Both image and Cartesian co-ordinates are represented as `cv::Point2d`
objects.

The second arguments `src` and `dst` are the images to which the co-ordinates
refer.  In reality, only the size of these images is relevant, but it is
important because the origin of the Cartesian system is the centre of the image
and not the corner.


