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
+ The actual position $\nu$ or $\theta$ is denoted `nu` with no disctinction
  between the angular position $\theta$ and the position $\nu$ in the source
  plane.
+ `referenceXi` is the point in which the roulette amplitudes are computed.

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


