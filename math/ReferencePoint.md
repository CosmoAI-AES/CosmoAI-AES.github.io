---
title: Reference Point for Roulettes
usemathjax: true
---

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


