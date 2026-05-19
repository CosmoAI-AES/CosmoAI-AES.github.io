---
title: Basic Notation
usemathjax: true
---

# Basic Notation

![Geometric model as described in the text](observer.png)

We assume a flat sky, so that the source is contained in a plane $S$
at distance $D_S$ from the observer, and the lens in a plane $L$ at
distance $D_L$ from the observer.
The optical axis is the line from the observer through the lens.
The planes $S$ and $L$ are orthogonal on the optical axis, and have
origin in the intersection therewith.

We consider a single source point at $\boldsymbol{\eta}$ in $S$.
The apparent position, as seen by the observer, is at $\nu$ and
$$\Delta\boldsymbol{\eta} = \boldsymbol{\nu} - \boldsymbol{\eta}$$
The apparent position in the lens plane $L$ is called
$$\boldsymbol{\xi} = \frac{D_L}{D_S} \boldsymbol{\nu}.$$

As a note to the side, the distancees $D_L$ and $D_S$ are cosmological,
meaning that they depend on time. This is due to the expansion of the fabric of the 
cosmos (space). This expansion is measured through something known as redshifting $z$ of 
light. Such considerations are spared for a later section, and we suffice it for now 
to mention that such distances are not additive in the ordinary sense. Let $D_{LS}(z)$ be 
the distance between the lens plane and the source plane. Then $D_S(z)\,\neq\,D_{L}(z)+D_{S}(z).$
We come back to this in due time.

The deflection is most easily described in terms of angles, so 
we define $\beta$ and $\theta$ as the angles between 
the optical axis and respectively 
$\boldsymbol{\eta}$ and $\boldsymbol{\nu}$.
The deflection angle $\hat\alpha$ is the angle between 
the actual and apparent source in the source plane as seen
from the apparent image in the lens plane.

With the flat sky approximation, the angles are related to
lengths  in the lens plane by a factor of $D_L$, so that
$$\boldsymbol{\xi} = D_L\theta$$
Similarly, in the source plane, the factor is $D_S$, so that we
get
$$\boldsymbol{\nu} = D_S\theta,$$
$$\boldsymbol{\eta} = D_S\beta,$$
and
$$\Delta\boldsymbol{\eta} & = D_S\alpha,$$
where $\alpha=\theta-\beta$ as the angle between
$\boldsymbol{\eta}_S$ and $\boldsymbol{\nu}_S$ as seen
from the observer.
The same reasoning gives us the following[^hatalpha],

$$\alpha = \frac{D_{LS}}{D_S} \hat\alpha$$

Now, we can write the actual image as
$$
\begin{align}
\label{raytracePhys}
\boldsymbol{\eta} = \frac{D_S}{D_L}\boldsymbol{\xi} - D_{LS}\boldsymbol{\hat\alpha}
\end{align}
$$

::: {note} Implementation
In the implementation, the basic unit is pixels in the source plane,
and $D_S$ is normalised to 1.
It is convenient to think of pixels in the source plane corresponding
to angular distances, so that effectively $\theta=\boldsymbol{\nu}$.

The only relevant distance situated in the lens plane is $\xi$, which
is also measured in source plane pixels.
The scaling factor is called $\chi=\frac{D_L}{D_S}=\frac{||\boldsymbol{\xi}||}{||\boldsymbol{\nu}||}$.
:::

It is noteworthy that if we consider spherical geometries (a source sphere and a lens sphere),
we may also write down the equation
$$
\begin{align}
\label{raytraceAng}
\boldsymbol{\beta}=\boldsymbol{\theta}-\boldsymbol{\alpha}.
\end{align}
$$
Considering small angles,
$$
\sin\theta\approx\theta
$$

it may readily be shown that Eq.~\eqref{raytracePhys} and Eq.~\eqref{raytraceAng} are the same.

[^hatalpha]: 
    This is seen because $D_S\alpha$ and $D_{LS}\hat\alpha$ are the lengths 
    of arcs between the actual and apparent source, and for small
    angles they are both approximately equal to the straight line
    $\Delta\boldsymbol{\eta}_S$.

## Normalisation

The above definitions assume physical units.  It is customary to normalise
using a constant factor $\xi_0$. This gives the following entities, following Kormann 1994

$$
\begin{align}
  \mathbf{x}= \frac{\boldsymbol{\xi}}{\xi_0}\quad,\quad\mathbf{y} = \frac{\boldsymbol{\eta}}{\eta_0}
     \quad\text{where } \nu_0 = \frac{D_S}{D_L}\xi_0\quad,\quad
  \boldsymbol{\alpha} = \frac{D_LD_{LS}}{D_S\xi_0}\hat{\boldsymbol{\alpha}}
\end{align}
$$
In addition to the previously mentioned (cosmological) distances $D_L$, $D_S$ and $D_{LS}$ we must also
find a proper length scale $\xi_0$ from which we normalise everything else. In SEF, Kormann1994 and other
standard sources one typically takes $\xi_0$ to be the so-called Einstein radius. This is the radius at which
a spherically symmetric lens will produce a ring (so-called Einstein ring) whenever the source is directly behind
the lens, along the optical axis.

In normalised coordinates the ray-trace equation reads 

$$
\begin{align}
\label{raytraceNorm}
\mathbf{y}=\mathbf{x}-\boldsymbol{\alpha}.
\end{align}
$$
This is an alternative normalisation from the angular version, given in Eq.~\eqref{raytraceAng}.
**Note that in this work, we will use angular coordinates.** In the following we will therefore proceed with this.


## The thin-lens potential and the lens-potential $\psi$  
Considering a thin lens, it is customary to define the lens potential as the projection of the 3D gravitaitonal lens
potential down on the lens plane. Such a simplification is warranted due to $D_L \gt \xi_0$.


The normalised deflection $\mathbf{x}$ is given as
the gradient of $\psi$, i.e.
\begin{equation}
  \mathbf{a} 
  = \nabla_{\mathbf{x}}\psi
\end{equation}
Different forms of $\psi$ give[^nabla],
\begin{align}
  \mathbf{a} 
  = \xi_0\cdot\nabla_{\xi}\psi
  = \frac{\xi_0}{D_L}\cdot\nabla_{\theta}\psi
\end{align}

[^nabla]:
    We use here the chain rule with $\boldsymbol{\xi}= \xi_0\mathbf{x} $
    and $\theta = \boldsymbol{\xi}/D_L$.

## The Raytrace Equationn

The normalised raytrace equation is given as
\begin{align}
  \mathbf{y}  = \mathbf{x}  - \mathbf{a}
\end{align}
Inserting the gradient for $\mathbf{a}$, we have
\begin{align}
  \mathbf{y}  = \mathbf{x}  - \nabla_{\mathbf{x}}\psi
\end{align}
We can rewrite the raytrace equation using any of the forms of $\nabla\psi$.
In terms of $\xi$, we have
\begin{equation}
  \boldsymbol{\eta} 
  = \frac{D_S}{D_L}\boldsymbol{\xi} - D_{LS}\boldsymbol{\hat\alpha}
  = \frac{D_S}{D_L}(\boldsymbol{\xi} - \xi_0\mathbf{a})
  = \frac{D_S}{D_L}(\boldsymbol{\xi} - \xi_0^2\nabla_{\xi}\psi)
\end{equation}
In terms of angles, we have
\begin{equation}
  \boldsymbol{\beta} 
  = \theta - \alpha
  = \theta - \frac{\xi_0}{D_L}\mathbf{a}
  = \theta - \frac{\xi_0}{D_L}\mathbf{a}
  = \theta - \frac{\xi_0^2}{D_L^2}\nabla_{\theta}\psi
\end{equation}


## Lens Potential in CosmoSim

In the implementation of CosmoSim, we have used a different
definition of $\psi$,
\begin{equation}
  \psi^{\mathrm{R}} = \frac{\xi_0^2}{D_L^2}\psi
\end{equation}
**TODO** double-check this

In this notation, we can write the raytrace equation as
\begin{equation}
  \boldsymbol{\eta} 
  = \frac{D_S}{D_L}(\boldsymbol{\xi} - \nabla_{\xi}\psi^{\mathrm{R}})
  = \boldsymbol{\nu} - \frac{D_S}{D_L} \nabla_{\xi}\psi^{\mathrm{R}}
\end{equation}
This is relation is implemented in the `RaytraceModel::calculateEta()` 
function in CosmoSim.

## Surface Mass Density

The convergence, or dimensionless projected surface-mass density, is given
as a function $\kappa$, which is related to $\psi$ as follows:
\begin{equation}
  \kappa(\boldsymbol{\xi})= \frac12\xi_0^2\left(
     \frac{\partial^2\psi}{\partial\xi_1^2} + 
     \frac{\partial^2\psi}{\partial\xi_2^2}
     \right)
\end{equation}
or
\begin{equation}
  \kappa(\boldsymbol{\xi})= \frac12D_L^2\left(
     \frac{\partial^2\psi^{\mathrm{R}}}{\partial\xi_1^2} + 
     \frac{\partial^2\psi^{\mathrm{R}}}{\partial\xi_2^2}
     \right)
\end{equation}

## Notes
