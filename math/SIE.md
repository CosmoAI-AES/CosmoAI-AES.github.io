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

(theorem-sie-second)=
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

## Higher-order derivatives

To find higher order derivatives we use the 2ne order derivatives
as a starting point.
We see that all these derivatives have the form
```{math}
 \theta_E\sqrt{f}\cdot\frac{g(x,y)}{R^2R'}
```
where $g(x,y)$ is a monomial in $x$ and $y$.
We will prove the following generalisation of this observation.

::: {prf:theorem}
For all $i,j\ge0$ and $i+j>1$, we have
```{math}
  \frac{\partial^{i+j}}{\partial x^i\partial y^j}\psi^{\mathrm{R}}(x,y) 
  = \theta_E\sqrt{f}\cdot\frac{g(x,y)}{R^2R'}
```
for some function $g(x,y)$ of the form
```{math}
:label: SIE_form
    g(x,y)
    = \sum Cx^iy^jx'^ky'^lf^mf'^nR^pR'^q
```
:::

**TODO** New page for the proof.

**TODO** Check claims.  The exponents may possibly be negative.

We will need the following lemmataa.

::: {prf:lemma}
If $g(x,y)$ has the form in [](#SIE_form), then so have
$\partial g(x,y)/\partial x$ and
$\partial g(x,y)/\partial y$.
:::

::: {prf:proof}
**TODO**
:::

::: {prf:lemma}
If $g(x,y)$ and $h(x,y)$ have the form in [](#SIE_form), 
then so has $f(x,y)=g(x,y)\cdot h(x,y)$.
:::

::: {prf:proof}
Since $g$ and $h$ are polynomials, so is their product.
:::

::: {prf:lemma}
We have
```{math}
\begin{aligned}
    \frac{\partial}{\partial x} R^2R'
    &= 2R'x
    + R^2\frac{x'}{R'}\cos\lambda_L
    - R^2\frac{y'}{R'}\sin\lambda_L
\end{aligned}
```
and
```{math}
\begin{aligned}
    \frac{\partial}{\partial y} R^2R'
    & = 2R'y
    + R^2\frac{x'}{R'}\sin\lambda_L
    + R^2\frac{y'}{R'}\cos\lambda_L
\end{aligned}
```
In particular, the derivatives of $R^2R'$ have the
$g$ form from [](#SIE_form).
:::

::: {prf:proof}
First we note that
```{math}
\begin{aligned}
    \frac{\partial}{\partial x} R^2R'
    & = 2RR'\frac{x}{R} 
    + R^2\frac{x'}{R'}\frac{\partial x'}{\partial x}
    + R^2\frac{y'}{R'}\frac{\partial y'}{\partial x}
    \\&= 2R'x
    + R^2\frac{x'}{R'}\cos\lambda_L
    - R^2\frac{y'}{R'}\sin\lambda_L
\end{aligned}
```
and
```{math}
\begin{aligned}
    \frac{\partial}{\partial y} R^2R'
    & = 2RR'\frac{y}{R} 
    + R^2\frac{x'}{R'}\frac{\partial x'}{\partial y}
    + R^2\frac{y'}{R'}\frac{\partial y'}{\partial y}
    \\& = 2R'y
    + R^2\frac{x'}{R'}\sin\lambda_L
    + R^2\frac{y'}{R'}\cos\lambda_L
\end{aligned}
```
which gives the lemma.
:::

::: {prf:proof}
The proof is by mathematical induction on $i$ and $j$.
The base case follows from [](#theorem-sie-second) as discussed
above.

If $i>0$, we assume that it holds for $i-1$ and differentiate with
respect to $x$.
If $i=0$, we assume that it holds for $j-1$ and differentiate with
respect to $y$.


**TODO**
:::

And that the derivatives of this with respect to $x$ and $y$ are
```{math}
:label: third_order_examples
\begin{aligned}
    \frac{\partial}{\partial x}
    \frac{g(x,y)}{R^2R'}
    & = \frac{\frac{\partial}{\partial x}g(x,y)R^4R^{\prime2}-(3xR^2R^{\prime2}+yx^\prime y^\prime f^{\prime2}R^2)g(x,y)}{(R^2R')^3}
    \\ & = \frac{g'_1(x,y)}{(R^2R')^3}
\end{aligned}
```

```{math}
\begin{aligned}
    \frac{\partial}{\partial y}
    \frac{g(x,y)}{R^2R'}
    & = \frac{\frac{\partial}{\partial y}g(x,y)R^4R^{\prime2}-(3yR^2R^{\prime2}-xx' y' f'^2R^2)g(x,y)}{(R^4R^{\prime2})^{\frac{3}{2}}}
    \\ & = \frac{g'_2(x,y)}{(R^4R^{\prime2})^{\frac{3}{2}}}
\end{aligned}
```

## Historical notes

Several attempts were made to device a computationally viable
differentiation strategy.
CosmoSim v3.2 used `sympy` for differentiation at canonical orientation
combined with the chain rule to map the result into the global co-ordinate
frame.  This worked up to order 5, and is documnted under [](#tech-sie).

The approach outlined above is computationally more efficient.

::: {note} Implementation of SIE
The documentation of the SIE lens is still under construction.
See 
+ [](#tech-sie)
+ [](#sie-roulette)
:::
