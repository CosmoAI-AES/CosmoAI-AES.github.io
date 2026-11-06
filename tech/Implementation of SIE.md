---
title: Implementation of SIE
---

(tech-sie)=
# Implementation of SIE

## Raytrace

This is implemented in the SIE class (`src/simlib/SIE.cpp`).

To evaluate the lens potential $\psi^{\mathrm{R}}(x,y)$,
we calculate the polar coordinates
$R$ and $\phi$, and use the formula (see [](#math-sie)) for 
$\psi_\textrm{SIE}^R(\xi_0,f,\lambda_L;R,\phi)$.
The deflection is given by [](#theorem-sie-deflection).

::: {note} Note
In polar co-ordinates, we replace $x/R$ and $y/R$ with $\cos\phi$
and $\sin\phi$
respectively, and find that $\nabla\psi$ is constant in $R$.
:::

(sie-roulette)=
## Roulette Amplitudes for the SIE Lens

We define a local co-ordinate system aligned with the lens, so that
the lens orientation is $\lambda_L=0$.  
Let $(x',y')$ be a point in the local frame, corresponding to $(x,y)$ in 
the global frame.

The calculation of roulette amplitudes takes three steps.
1.  Calculate the partial derivatives of $\psi$ with respect to
    $x'$ and $y'$ up to required order.
    This is done recursively using a CAS engine.
2.  Calculate the partial derivatives of $\psi$ with respect to
    $x$ and $y$ up to required order, using the chain rule.
3.  Calculate the roulette amplitudes $\alpha_s^m$ and $\beta_s^m$.

::: {note} Implementation
These three steps correspond to `firstworker`, `secondworker`, and
`thirdworker` in `CosmoSim.Roulettes.sie`.
:::

### Step 1: Derivatives of the lens potential

The first order derivatives of $\psi$ are given in [](#theorem-sie-deflection).
By rotating the co-ordinate frame $(x,y)\mapsto(x',y')$ by an angle $\lambda_L$,
we use an initial solution where $\lambda_L=0$, where the first derivatives
simplify to
$$
\begin{aligned}
  \frac{d}{dx'}\psi^{\mathrm{R}}(x',y') &=
  C_0\frac{\sqrt{f}}{f'}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x'}{R}\right)
\\
  \frac{d}{dy'}\psi^{\mathrm{R}}(x',y') &= 
  C_0\frac{\sqrt{f}}{f'}
    \sin^{-1}\left(f'\cdot\frac{y'}{R}\right) 
\end{aligned}
$$

The `firstworker()` function relies on `sympy` to do brute force
derivation of $\psi$ at $\lambda_L=0$.
This is computationally expensive, and prohibitive beyond order $m=5$.

#### Inner differentation of the co-ordinate transformation

The local co-ordinates are given as the rotation
```{math}
\begin{aligned}
   \begin{bmatrix} x' \\ y' \end{bmatrix}
   &=
   \begin{bmatrix}
     \cos\lambda_L & \sin\lambda_L \\
     -\sin\lambda_L & \cos\lambda_L 
   \end{bmatrix}
   \cdot
   \begin{bmatrix} x \\ y \end{bmatrix}
\end{aligned}
```
We can differentiate the coordinates, so get
```{math}
\begin{aligned}
   \frac{dx'}{dx} & = \cos\lambda_L
   &\quad
   \frac{dx'}{dy} & = \sin\lambda_L
   \\
   \frac{dy'}{dx} & = -\sin\lambda_L
   &\quad
   \frac{dy'}{dy} & = \cos\lambda_L
\end{aligned}
```
We use this with the chain rule below.

### Step 2.  Chain rule derivation.

In the second step, we apply the chain rule to find the derivatives
with respect to $(x,y)$ given those for $(x',y')$, as follows
```{math}
\begin{aligned}
   \frac{\partial^{m+n}\psi}{(\partial x)^m(\partial y)^n} =
     \sum_{i=0}^m\sum_{j=0}^n
     \binom{m}{i}\binom{n}{j}
     \cos^{m-i+j}\theta\cdot
     \sin^{n-j+i}\theta\cdot
     (-1)^i\cdot
     \frac{\partial^{m+n}\psi}{(\partial x')^{m+n-i-j}(\partial y')^{i+j}} 
\end{aligned}
```
This is implemented by `secondworker()`.

### Step 3.  Roulette Amplitudes

In Step 3, `thirdworker()` computes the roulette amplitudes according
to [](#def-roulette-original).
