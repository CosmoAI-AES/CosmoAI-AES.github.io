---
title: Source Models
theme: minima
usemathjax: true
---

The Source class is the superclass of all source modesls.
The API is simple, implementing only the `getImage()` method 
to return the image (as an OpenCV `Mat` object), in addition
to the constructor and destructor.
The constructor takes an integer argument, giving the size of 
the imagew which is assumed to be square.

The subclasses take additional parameters to the constructor,
in addition to the integer size.
+ `SphericalSource` takes $\sigma$ which is the standard deviation in
  the Gaussian distribution of the source mass.
+ `EllipsoidSource` takes $\sigma$ and $\sigma_2$, analogous to $\sigma$ above,
  giving the size along the major and minor axes, as well as a rotation $\theta$.
+ `TriangleSource` takes $\sigma$, now interpreted as the size, and
  the rotation $\theta$.
