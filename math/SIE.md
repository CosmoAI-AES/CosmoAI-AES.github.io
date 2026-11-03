---
title: The SIE Lens
usemathjax: true
---

(math-sie)=
# SIE (Singular isothermal ellipsoid)

For SIS it is possible to find high order derivatives by brute force
computer algebra.  For SIE, this approach is prohibitively expensive,
and a tailor-made algorithm is required.
We will show the first and second order derivatives explicitly.
At the second order, the inverse trigonometric functions disappear,
and the problem becomes simpler, at least in some sense.

The lens potential of SIE is given as (see [](#sie)):
$$
\begin{aligned}
\begin{split}
  \psi^R_\textrm{SIE}(\theta_E,f,\lambda_L;\theta,\phi) & =
  \theta_E\sqrt{\frac{f}{1-f^2}}\theta
  \\
  & \cdot \Bigg([\sin(\phi-\lambda_L)]\cdot\sin^{-1}\left(\sqrt{1-f^2}\cdot \sin{(\phi-\lambda_L)}\right)
  \\&
  +[\cos(\phi-\lambda_L)]\cdot\sinh^{-1}\left(\frac{\sqrt{1-f^2}}{f}\cos(\phi-\lambda_L)\right)\Bigg).
\end{split}
\end{aligned}
$$
where $(\theta,\phi)$ are the polar coordinates in the lens plane,
whereas $\lambda_L$ is the orientation of the ellipse.
That is, the major axis of the ellipse is $\theta$ from the $x$-axis,
counter-clockwise.
Thus $\lambda_L$ is constant across the image.
In the following, we write
$f' =\sqrt{1-f^2}$ as a shorthand.

(theorem-sie-deflection)=
::: {prf:theorem} Derivative of SIE
For the SIE lens at orientation $\lambda_L$, we have
```{math}
\begin{aligned}
  \frac{d}{dx}\psi^{\mathrm{R}}(x,y) = 
  \theta_E\frac{\sqrt{f}}{f'}\cdot
  & \bigg(
    \cos\lambda_L\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\lambda_L+y\sin\lambda_L}{R}\right)
    \\& -\sin\lambda_L\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\lambda_L+y\cos\lambda_L}{R}\right)
  \bigg)
\end{aligned}
```
and
```{math}
\begin{aligned}
  \frac{d}{dy}\psi^{\mathrm{R}}(x,y) = 
  \theta_E\frac{\sqrt{f}}{f'}\cdot
  &\bigg(
    \sin\lambda_L\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\lambda_L+y\sin\lambda_L}{R}\right)
  \\&
    +\cos\lambda_L\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\lambda_L+y\cos\lambda_L}{R}\right) 
  \bigg)
\end{aligned}
```
:::

::: {prf:proof}
See [](#sie-approach-1).
:::

## Differentiation for the roulette formalism

In Roulette simulation, we require higher order derivatives.
The recursive formulæ for roulette amplitudes proved intractible,
but the non-recursive formulæ are straight forward if higher-order
partial derivatives of $\psi$ can be calculated.

The rotation trick which worked for first-order derivativs does not
easily generalise to higher orders.
We ended up using a co-ordinate substitution and chain rule
differentiation.  This is elaborated as 
[Approach 2](#sie-approach-2).

A possible Approach 3 would differentiate the general formula for
$\psi^{\mathrm{R}}$, but believing this to be computationally intractible,
we have not developed this any further.

::: {note} Implementation of SIE
The documentation of the SIE lens is still under construction.
Two points will need to be written:
+ [Implementation of SIE](Implementation%20of%20SIE.md)
+ [](/math/Roulette%20Amplitudes%20in%20SIE)
:::
