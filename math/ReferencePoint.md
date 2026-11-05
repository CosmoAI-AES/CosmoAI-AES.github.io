---
title: Reference Point for Roulettes
usemathjax: true
---

(roulette-reference-point)=
# Reference Point for Roulettes

In the basic setup, the roulette amplitudes are calculated only
in one reference point, equal to the apparent position of the
primary source image.  This point is the solution 
$\boldsymbol{\xi}$ to the equation
$$
\begin{equation}
  \text{General:}\qquad\qquad\boldsymbol{\theta} = \boldsymbol{\beta} + \nabla\psi(\boldsymbol{\theta}) 
\end{equation}
$$
where $\boldsymbol{\beta}$ is the actual source position. This  is seen because $\nabla\psi$ gives the dislocation in the given
point, and the apparent source poistion $\boldsymbol{\theta}$ is the 
dislocatation of the actual source position $\boldsymbol{\theta}$.

In general, we can solve this equation by fix-point iteration.

For SIS and SIE lenses, the deflection $\nabla\psi$ is constant along any ray from the lens centre (origin). Thus the equation may be used to calculate the apparent position directly:
$$
\begin{equation}
  \text{SIS/SIE:}\qquad\qquad\boldsymbol{\theta} = \boldsymbol{\beta} + \nabla\psi
\end{equation}
$$


## Secondary reference point (SIS) lens

For the SIS lens, there may be a secondary image on the opposite
side of the lens.
The primary reference point is positive proportional to $\eta$,
while the secondary reference point is negative proportional.
Both are solutions to the same equation.

## Four images

The SIE lens may produce Einstein crosses, comprising four images.

**TODO**

## Einstein rings

**TODO** How do we deal with Einstein rings?


(getXi)=
## Apparent position

Roulette amplitudes are normally calculated in the apparent
position $\theta$ of the source.
In simulation, the actual position $\beta$ is known, while $\theta$
has to be computed.

We know that 
```{math}
:label: eq:fixpt
\theta = \beta + \nabla\psi(\theta),
```
and this equation needs to be solved for $\theta$.

The universal solution is to solve [](#eq:fixpt) numerically
by fix-point iteration.
For some lens models, we have analytic solutions.

::: {prf:proposition} Apparent position for SIS
For SIS, the apparent position is given as.
$\theta = \beta + \nabla\psi(\beta)$.
:::

::: {prf:proof} 
The SIS lens has constant deflection, and hence 
$\nabla\psi(\theta)=\nabla\psi(\beta)$.
:::

::: {prf:proposition} Apparent position for Point Mass
For a point mass lens, the apparent position is given as
$$\theta = \beta/2 + \sqrt{\frac{||\beta||^2}4+\theta_E^2}\cdot\frac{\beta}{||\beta||}$$
:::

::: {prf:proof} 
The result is easiest to see by writing $\beta$ and $\theta$ in
polar co-ordinates.
Because of the symmetry of the lens, $\psi$ is invariant in the 
angle and depends only on the distance $R=||\theta||$.
Furthermore $\beta$ and $\theta$ have the same polar angle.

For the point mass we have $\psi(R)=\theta_E^2\ln R$
([](#def-pm)), and
$$R = ||\beta|| + \frac{\theta_E^2}{R}$$.
This gives a quadratic equation with solutions
$$R = \frac{||\beta||}{2} \pm\sqrt{\frac{||\beta||^2}{4}+ \theta_E^2}.$$
We get $\theta$ by multiplying by a unit vector of the right polar angle.
:::

::: {note} Implementation
The fix point iteration is implemented in `Lens::getXi`.
Lens models where an analytic solution is known, may override
this in subclasses.
:::


::: {note} Implementation
The implementation use `nu` or `xi` for $\theta$ and `eta` for $\beta$.
In our early analysis $\nu$ and $\eta$ referred respectively
to the apparent and actual positions in the source plane, before
we switched to using angular co-ordinates throughout.
Similarly, $\xi$ was the apparent position in the lens plane.
:::

