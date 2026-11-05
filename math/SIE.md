---
title: The SIE Lens
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
```{math}
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
```
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

See [](#sie-approach-1).

## The second order derivative

When we proved [](#theorem-sie-deflection), we rotated the co-ordinate by
an angle $\lambda_L$, and this rotated frame remains important.
Given a point $(x,y)$, we write $(x',y')$ for the co-ordinates in the rotated
frame, i.e.
```{math}
\begin{aligned}
    x' & = \cos{\lambda_L}\cdot x+\sin{\lambda_L}\cdot y \\
    y' & = -\sin{\lambda_L}\cdot x +\cos{\lambda_L}\cdot y 
\end{aligned}
```
We also define the following shorthands:
```{math}
\begin{aligned}
    R & =\sqrt{x^2+y^2} \\
    R'&  = \sqrt{x'^2+f^2y'^2}
\end{aligned}
```
We will need the following lemma.

(lem-rprime)=
::: {prf:lemma}
```{math}
    R' = \sqrt{x'^2+f^2y'^2}
    =\sqrt{f^2R^2+f'^2x'^2}=\sqrt{R^2-f'^2y'^2}
```
:::

::: {prf:proof}
Since $(x',y')$ is a rotation of $(x,y)$, the vector norms
are equal, and thus
$$R^2 = x^2 + y^2 = x'^2 y'^2.$$

It follows that
$$ f^2R^2 + f'^2x'2 = f^2x'^2 + f^2y'^2 + x'^2 - f^2x'^2 
                 = x'^2 + f^2y'^2,$$
which proves the middle equality.
Similarly,
$$ R^2 - f'^2y'2 = x'^2 + y'^2 - y'^2 + f^2y'^2 
                 = x'^2 + f^2y'^2,$$
which proves the last equality.


:::


Now we can formulate the second derivatives, as follows.

::: {prf:theorem}
The second derivatives of SIE are given as
```{math}
\begin{aligned}
    \partial_1^2\psi(x,y)
    & = \theta_E\sqrt{f}\cdot\frac{y^2}{R^2R'}
    \\
    \partial_1\partial_2\psi(x,y)
    & = \theta_E\sqrt{f}\cdot\frac{-xy}{R^2R'}
    \\
    \partial^2_2\psi(x,y)
    &= \theta_E\sqrt{f}\cdot\frac{x^2}{R^2R'}
\end{aligned}
```
:::

::: {prf:proof}
We start by finding $\partial_1^2\psi(x,y)$.
Rewriting the first derivative using $(x',y')$, we have
```{math}
\begin{aligned}
  \frac{\partial}{\partial x}\psi^{\mathrm{R}}(x,y) = 
  \theta_E\frac{\sqrt{f}}{f'}\cdot
  & \bigg(
    \cos\lambda_L\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x'}{R}\right)
    \\& -\sin\lambda_L\cdot\sin^{-1}\left(f'\cdot\frac{y'}{R}\right)
  \bigg)
\end{aligned}
```
Differentiating, we have
```{math}
:label: sie-diff-x2
\begin{aligned}
  \frac{\partial^2}{\partial x^2}\psi^{\mathrm{R}}(x,y) = 
  \theta_E\frac{\sqrt{f}}{f'}\cdot
  & \bigg(
    \cos\lambda_L\cdot\frac{\partial^2}{\partial x^2}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x'}{R}\right)
    \\& -\sin\lambda_L\cdot\frac{\partial^2}{\partial x^2}\sin^{-1}\left(f'\cdot\frac{y'}{R}\right)
  \bigg)
\end{aligned}
```
Let's differentiate one term at a time.
For the $\sinh^{-1}$ term (using [](#der-sinh), we have
```{math}
    \frac{\partial}{\partial x}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x'}{R}\right) =
    \frac1{\sqrt{1 - \left(\frac{f'}{f}\cdot\frac{x'}{R}\right)^2}}\cdot
    \frac{f'}{f}\cdot\frac{\partial}{\partial x}\frac{x'}{R}
```
Expanding and rearranging, we have
```{math}
\begin{aligned}
    \frac{\partial}{\partial x}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x'}{R}\right)
    &=
    f'\cdot
    \frac1{\sqrt{f^2 - f'^2\frac{x'^2}{R^2}}}\cdot
    \frac{\frac{\partial x'}{\partial x}R - x' \frac{\partial R}{\partial x}}{R^2}
    \\&=
    f'\cdot
    \frac1{\sqrt{f^2 - f'^2\frac{x'^2}{R^2}}}\cdot
    \frac{\cos\lambda_L\cdot R - x' \frac{x}{R}}{R^2}
\end{aligned}
```
Similarly, the $\sin^{-1}$ term (using [](#der-sin) gives,
```{math}
\begin{aligned}
    \frac{\partial}{\partial x}
    \sin^{-1}\left(f'\cdot\frac{y'}{R}\right)
    &=
    \frac1{\sqrt{1 + \left(f'\cdot\frac{y'}{R}\right)^2}}\cdot
    f'\cdot\frac{\partial}{\partial x}\frac{y'}{R}
    \\ &=
    f'\cdot
    \frac1{\sqrt{1 + f'^2\cdot\frac{y'^2}{R^2}}}\cdot
    \frac{-\sin\lambda_L\cdot R - y' \frac{x}{R}}{R^2}
\end{aligned}
```
Combining the two terms into [](#sie-diff-x2), we have 
```{math}
\begin{aligned}
  \frac{\partial^2}{\partial x^2}\psi^{\mathrm{R}}(x,y) = 
  \theta_E\sqrt{f}\cdot
  & \bigg(
    \cos\lambda_L\cdot
    \frac1{\sqrt{f^2 - f'^2\frac{x'^2}{R^2}}}\cdot
    \frac{\cos\lambda_L\cdot R - x' \frac{x}{R}}{R^2}
    \\&+
    \sin\lambda_L\cdot
    \frac1{\sqrt{1 + f'^2\cdot\frac{y'^2}{R^2}}}\cdot
    \frac{\sin\lambda_L\cdot R + y' \frac{x}{R}}{R^2}
  \bigg)
\end{aligned}
```
Rearranging, we get
```{math}
\begin{aligned}
  \frac{\partial^2}{\partial x^2}\psi^{\mathrm{R}}(x,y) = 
  \theta_E\sqrt{f}\cdot
  & \bigg(
    \frac{\cos^2\lambda_L}{\sqrt{f^2R^2 - f'^2x'^2}}
    -
    \frac{\cos\lambda_L}{\sqrt{f^2R^2 - f'^2x'^2}}\cdot
    x' \frac{x}{R^2}
    \\&+
    
    \frac{\sin^2\lambda_L}{\sqrt{R^2 + f'^2 y'^2}}
    +
    \frac{\sin\lambda_L}{\sqrt{R^2 + f'^2 y'^2}}\cdot
    y' \frac{x}{R^2}
  \bigg)
\end{aligned}
```
According to [](#lem-rprime), the square roots in the denominators
are all equal to $R'$.  Furthermore, $\cos^2\lambda+\sin^2\lambda=1$, hence
```{math}
\begin{aligned}
  \frac{\partial^2}{\partial x^2}\psi^{\mathrm{R}}(x,y) = 
  \theta_E\sqrt{f}\cdot
  & \bigg(
    \frac{1}{R'}
    +
    \frac{\sin\lambda_L\cdot y'-\cos\lambda_L\cdot x'}{R'}
    \cdot
    \frac{x}{R^2}
  \bigg)
\end{aligned}
```
Now 
$$\sin\lambda_L\cdot y'-\cos\lambda_L\cdot x' = x$$ 
because it is the inverse rotation by $\lambda_L$, 
Thus we get
```{math}
\begin{aligned}
  \frac{\partial^2}{\partial x^2}\psi^{\mathrm{R}}(x,y) 
  = \theta_E\sqrt{f}\cdot \frac{R^2 - x^2}{R'R^2}
  = \theta_E\sqrt{f}\cdot \frac{y^2}{R'R^2}
\end{aligned}
```
q.e.d.
The other two cases can be proved analogously.

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
See 
+ [](#tech-sie)
+ [](#sie-roulette)
:::
