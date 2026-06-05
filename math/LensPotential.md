---
title: Basic Notation
usemathjax: true
---

# Basic Notation

![Geometric model as described in the text](observer.png)

we assume a flat sky and a thin lens, which means the lens is 
concentrated in one plane, orthogonal on the line of sight, with
no extension in depth. We call this the lens plane $L$.
Similarly, the source that we observe through the lens, is concentrated 
in a parallel plane, called the source plane $S$.
The distances to the lens and source planes are denoted
$D_L$ and $D_S$ respectively.
The optical axis is the line from the observer through the lens.

::: {note} Justified assumptions
The flat sky assumption comes from a local approxation of a sphere
as a plane.  The visible sky is really a sphere, but considering a 
sufficiently small section, it can be treated as a plane.

The thin lens assumption comes from the sparsity of mass in the universe.
The extent of the lens in depth is assumed to be negligible compared to
the distance $D_L$.
:::

We consider a single source point at $\boldsymbol{\eta}$ in $S$.
The apparent position, as seen by the observer, is at $\nu$ and
$$\Delta\boldsymbol{\eta} = \boldsymbol{\nu} - \boldsymbol{\eta}$$
The apparent position in the lens plane $L$ is called
$$\boldsymbol{\xi} = \frac{D_L}{D_S} \boldsymbol{\nu}.$$

::: {note} Cosmological distances depend on time (/redshift)
As a note to the side, the distancees $D_L$ and $D_S$ are cosmological,
meaning that they depend on time. This is due to the expansion of the fabric of the 
cosmos (space).
This expansion is measured through something known as redshifting $z$ of 
light.
Such considerations are spared for a later section, and we suffice it for now 
to mention that such distances are not additive in the ordinary sense.
Let $D_{LS}(z)$ be 
the distance between the lens plane and the source plane.
Then $D_S(z)\,\neq\,D_{L}(z)+D_{S}(z).$
We come back to this in due time.
:::

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
Similarly, in the source plane[^hatalpha], we find 

$$\boldsymbol{\eta} = D_S\beta,$$
but also
$$ \boldsymbol{\Delta\eta}= D_{LS}\hat{\boldsymbol{\alpha}}.$$

Now, we can write the actual image as

$$
\boldsymbol{\eta} = \frac{D_S}{D_L}\boldsymbol{\xi} - D_{LS}\boldsymbol{\hat\alpha}
$$ (raytracePhys)

::: {note} Implementation
The implementation uses the angular distances $\alpha$ and $\beta$.
:::

It is noteworthy that if we consider spherical geometries (a source sphere and a lens sphere),
we may also write down the equation

$$
\boldsymbol{\beta}=\boldsymbol{\theta}-\boldsymbol{\alpha}
$$ (raytraceAng)

Considering small angles,
$$
\sin\theta\approx\theta
$$

it may readily be shown that Eq.~{eq}`raytracePhys` and Eq.~{eq}`raytraceAng` are the same.
It is this latter equation that we shall take to be our constitutive relation. But before
we get there, let us also introduce the standard way of normalizing. 

[^hatalpha]: 
    This is seen because $D_S\alpha$ and $D_{LS}\hat\alpha$ are the lengths 
    of arcs between the actual and apparent source, and for small
    angles they are both approximately equal to the straight line
    $\Delta\boldsymbol{\eta}_S$.

## Normalisation

It is customary to normalise using a constant factor $\xi_0$. This gives the following entities, following Kormann 1994

$$
\begin{align}
  \mathbf{x}= \frac{\boldsymbol{\xi}}{\xi_0}\quad,\quad\mathbf{y} = \frac{\boldsymbol{\eta}}{\eta_0}
     \quad\text{where } \eta_0 = \frac{D_S}{D_L}\xi_0\quad,\quad
  \mathbf{a} = \frac{D_L}{\xi_0}\alpha=\frac{D_LD_{LS}}{D_S\xi_0}\hat{\boldsymbol{\alpha}}
\end{align}
$$
In addition to the previously mentioned (cosmological) distances $D_L$, $D_S$ and $D_{LS}$ we must thus
find a proper length scale $\xi_0$ from which we normalize everything else. In SEF, Kormann1994 and other
standard sources one typically takes $\xi_0$ to be the so-called Einstein radius. This is the radius at which
a spherically symmetric lens will produce a ring (so-called Einstein ring) whenever the source is directly behind
the lens, along the optical axis.

In normalised coordinates the ray-trace equation reads 

$$
\mathbf{y}=\mathbf{x}-\mathbf{a},
$$ (raytraceNorm)
which also explains the particular definition of $\boldsymbol{\alpha}$: it makes the normalized 
version of the ray-trace equation look very nice and tidy. The normalisation presented above is however
somewhat different from the one we shall prefer in this work,
**where we shall prefer to work in angular coordinates,** 
such as the ones given in Eq.~{eq}`raytraceAng`.
In the sections to follow, such coordinates will therefore be our focus.

::: {note} Definition: Einstein Radius 
Consider a source directly behind a spherically symmetric lens. Id est, consider a source at $\beta=0$. In that case the
angular form of the ray-trace equation yields
$$\beta=0\quad\rightarrow\quad \alpha\equiv\theta_E$$
The particular value of $\alpha$ for which the source is directly behind the lens is known as the angular Einstein radius.
The physical radius in the lens plane corresponding to the angular Einstein radius is known as the Einstein radius. 
$$R_E\equiv D_L\theta_E$$
:::

::: {note} Einstein Radius for SIS and Point Mass
Note that for a so-called SIS-lens and similarely for the Point-mass lens (PML),
the deflection $\hat{\alpha}$ and hence also $\mathbf{a}$ may be calculated. In fact one finds $a=1$. By such it is readily shown that 

$$\boxed{R_E^{SIS}=R_E^{PML}=\xi_0.}$$
:::


## The lens-potential $\psi$  

Considering a thin lens, it is customary to define the lens potential as the projection of the 3D gravitaitonal lens
potential down on the lens plane. Such a simplification is typically warranted, due to $D_L \gt\gt \xi_0$.

To connect with SEF and other standard literature we will start by defining the lensing potential so that its gradient is the so-called reduced deflection angle $\mathbf{a}$ 
the gradient of $\psi$, i.e.
\begin{equation}
  \mathbf{a} 
  = \nabla_{\mathbf{x}}\psi.
\end{equation}
In angular coordintes, which we prefer here, the chain rule gives[^nabla],
\begin{align}
  \boldsymbol{\alpha} 
  = \xi_0\cdot\nabla_{\xi}\psi
  = \frac{\xi_0}{D_L}\cdot\nabla_{\theta}\psi
\end{align}

[^nabla]:
    We use here the chain rule with $\boldsymbol{\xi}= \xi_0\mathbf{x} $
    and $\theta = \boldsymbol{\xi}/D_L$.


The normalised raytrace equation~{eq}`raytraceNorm` is thus rewritten to
\begin{align}
  \mathbf{y}  = \mathbf{x}  - \nabla_{\mathbf{x}}\psi
\end{align}
Working on the sphere we also had 
gives
\begin{equation}
  \boldsymbol{\beta} 
  = \theta - \alpha
  = \theta - \frac{\xi_0}{D_L}\mathbf{a}
  = \theta - \frac{\xi_0^2}{D_L^2}\nabla_{\theta}\psi.
\end{equation}
This final equation shall be taken as motivation to redefine the standard lensing potential 
ever so slightly. Let $\psi$ be the usual lensing potential. Then we define

\begin{equation}
  \boxed{\psi^{\mathrm{R}} = \frac{\xi_0^2}{D_L^2}\psi}
\end{equation}


In this notation, we find the following pleasing expression for the 
angular version of the ray-trace equation:
$$
\boxed{\boldsymbol{\beta} = \theta - \nabla_{\theta}\psi^R(\theta).}
$$ (raytraceeq)
It follows that 
$$\boxed{\boldsymbol{\alpha}=\theta_E\mathbf{a}=\nabla_\theta\psi^R}$$

The raytrace equation {eq}`raytraceeq` is implemented as 
`RaytraceModel::calculateEta()` in CosmoSim.

::: {warning}
The model may give the impression that the distortion is independent
of the distances $D_S$ and $D_L$.  
In fact, the Einstein radius $\theta_E$ depends on the relative distance
$\frac{D_L}{D_S}$, as can be verified by studying the geometry
and the angles $\alpha$ and $\hat\alpha$.

This also means that if there are different sources at different depths,
they will require different lens models in the implementation.
:::

::: {note} Implementation
An overview of how the model parameters are represented in the code,
see [](/docs/Notation).
:::

## Surface Mass Density

A final, very central concept in lensing, is the convergence $\kappa$.
This is the dimensionless,
projected surface-mass density, which is related to $\psi$ through the Poisson equation. In our 
coordinates this gives
\begin{equation}
  \boxed{\kappa(\boldsymbol{\theta})= \frac12\nabla_\theta\psi^R}
\end{equation}

Writing it out more explicitely, we find 
\begin{equation}
\kappa(\boldsymbol{\theta})= \frac12\left(
     \frac{\partial^2\psi^{\mathrm{R}}}{\partial\theta_1^2} + 
     \frac{\partial^2\psi^{\mathrm{R}}}{\partial\theta_2^2}
     \right)
\end{equation}

## Notes
