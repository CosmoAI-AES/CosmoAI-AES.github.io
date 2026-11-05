---
title: Reference Point for Roulettes
usemathjax: true
---

(roulette-reference-point)=
# Reference Point for Roulettes

In the basic setup, the roulette amplitudes are calculated only
in one reference point, equal to the apparent position of the
primary source image.  This point is the solution 
$\boldsymbol{\xi}$ to the equation in $\theta$
```{math}
:label: eq:fixpt
  \boldsymbol{\theta} = \boldsymbol{\beta} + \nabla\psi(\boldsymbol{\theta}) 
```
where $\boldsymbol{\beta}$ is the actual source position.
This  is seen because $\nabla\psi$ gives the dislocation in the given
point, and the apparent source postion $\boldsymbol{\theta}$ is the 
dislocatation of the actual source position $\boldsymbol{\theta}$.

In general, strong lensing gives several solutions of Equation [](#eq:fixpt).
For spherically symmetric lenses (SIS and point mass), there may be a secondary
image on the opposite side of the lens.
We define the primary reference point to be the solution positively proportional
to $\beta$.
while the secondary reference point is negative proportional.

For elongated lenses, such as SIE, the solution is not necessarily located
in exactly the same direction as $\beta$.  We will return to this problem under
[](#sec-multiple-images).

(getXi)=
## Apparent position

In simulation, the actual position $\beta$ is known, while $\theta$
has to be computed by solving [](#eq:fixpt).
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





(sec-multiple-images)=
## Einstein rings and crosses

**TODO** The SIE lens may produce Einstein crosses, comprising four images.

**TODO** How do we deal with Einstein rings?

