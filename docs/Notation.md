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


