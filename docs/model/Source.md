---
title: Source Models
theme: minima
usemathjax: true
---

# Source Models

The source model is entirely separate from the lens and simulation
models.  It implements a single function `getImage()` which returns
the source image as an OpenCV `Mat` object.

The Source class is the superclass of all source modesls.
The constructor takes an integer argument $\sigma$, giving the size which
is interpreted somewhat differently for the different subclasses.
The subclasses may take additional parameters to the constructor,
in addition to the integer size.
+ `SphericalSource` takes $\sigma$ which is the standard deviation in
  the Gaussian distribution of the source mass.
+ `EllipsoidSource` takes $\sigma$ and $\sigma_2$, analogous to $\sigma$ above,
  giving the size along the major and minor axes, as well as a rotation $\theta$.
+ `TriangleSource` takes $\sigma$, now interpreted as the size, and
  the rotation $\theta$.
+ `ImageSource` takes an image file which is used as the source image, in addition
  to the size parameter $\sigma$.
+ Source [Constellation](Constellation)
