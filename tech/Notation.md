---
usemathjax: true
---

# Implementation

One of the critical challenges in CosmoSim is to represent the
lens potential and to compute the distortion in both the 
raytrace model and the roulette model.

+ [](#raytrace-implementation)
+ [](#roulette-implementation)

(notation)=
## Notation in the Implementation

While the implementation aims to stay true to the 
[mathematical models](/math/math.md), the notation sometimes differs.
Some discrepancies are part of the technical debt, where the code has
not been updated to match evolving notation.
Other discrepancies are due to ambiguities, reused symbols, and
subscripts which are hard to represent in ASCII.
We will try to define the mapping between the two systems of notation.

+ `alpha` and `beta` refer to the roulette amplitudes.
+ The actual source position $\beta$ is denoted `eta` in the C++ code.
    + the value is retrieved as `SimulatorModel::getEta()`.
+ `einsteinration` refers to the Einstein radius $\theta_E$.
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
system as arbitrary.  If the lens is fixed, say, at origin, information
is leaked.  For this reason, the images are translated to have the origin
at the centre of visible light.

As a consequence, `CosmoSim` has to consider at least two co-ordinate 
systems: one for calculation and one for presentation.

The critical points in the simulation are
+ Lens position $O_{\textrm{lens}}$ 
+ Centre of light $O_{\textrm{light}}$
+ Reference point $\xi_{\textrm{ref}}$ for the roulette expansion
+ Apparent source position $\nu$

::: {note} Internal representation
Internally in the simulator, `referenceXi` is the reference point, and
`nu` is the apparent position $\nu$.
These can be retrieved from any simulator object as `getXi()` and `getNu()`
respectively.
The lens position $O_{\textrm{lens}}$  is the origin
The centre of light is computed only when reporting, and never used.
:::

The output CSV file reports the following points:
+ (`lensX`,`lensY`) is $O_{\textrm{lens}}$ 
+ (`reletaX`,`reletaY`) is $\eta$
+ (`xiX`,`xiY`) is $\nu$
These are reported relative to the centre of the image as simulated.
Hence, they depend on the `simulator.centred` setting.
If the image has not been centred, (`lensX`,`lensY`) is zero.

In the default mode (when `referencexi` is true), we have
$\xi_{\textrm{ref}}=\nu$.

The (`centreX`,`centreY`) columns are deprecated.  They represent
the centre of light in the original coordinate system, i.e.
$-O_{\textrm{lens}}$ in the new system.

### Custom reference point

The simulator can be set to make the roulettes expansion in an
arbitrary point.  The output CSV file does not give the actual
$\xi_{\mathrm{ref}}$.  Instead it gives the source offset
(`offsetX`, `offsetY`) which suffices to do resimulation in the
roulette formalism.

The source offset is defined as 
$\xi_{\mathrm{ref}} - \nabla\psi(\xi_{\mathrm{ref}}) - \eta$.
In other words, it is the difference between the actual source position $\eta$ 
and the source position deflected at the reference point $\xi_{\mathrm{ref}}$
(`relativeXi`).
This is used in the `distort()` function in the simulator to get light
from the right pixel in the source image.

Here $\xi'$ is the origin of the new co-ordinate system, so that
`xi?` and `releta?` are $\nu$ and $\eta$ in the the new frame.

The (`offsetX`,`offsetY`) pair places `referenceXi`.

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


