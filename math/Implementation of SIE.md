---
title: Implementation of SIE
usemathjax: true
---

# Implementation of SIE

## Raytrace

This is implemented in the SIE class (`src/simlib/SIE.cpp`).

### Evaluation of the lens potential.

To evaluate the lens potential $\psi^{\mathrm{R}}(x,y)$, we calculate the polar coordinates
$R$ and $\phi$, and use the formula (see [SIE](SIE)) for 
$\psi_{\xi_0,f,\theta,D_\mathrm{L}}^\textrm{SIE(R)}(R,\phi)$.

### Evaluation of the Deflection.

This uses
\begin{aligned}
  \frac{\partial\psi^{\mathrm{R}}}{\partial x} &=
  C_0\frac{\sqrt{f}}{f'}\cdot
    \left(
    \cos\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\theta+y\sin\theta}{R}\right)
    -\sin\theta\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\theta+y\cos\theta}{R}\right) 
    \right)
    \\\\\\\\
  \frac{\partial\psi^{\mathrm{R}}}{\partial y} &=
  C_0\frac{\sqrt{f}}{f'}\cdot
    \left(
    \sin\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\theta+y\sin\theta}{R}\right)
    +\cos\theta\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\theta+y\cos\theta}{R}\right) 
    \right)
\end{aligned}
as taken from the expression for $\vec\alpha(x,y)$ above.

**Note** in polar co-ordinates, we replace $x/R$ and $y/R$ with $\cos\phi$ and $\sin\phi$
respectively, and find that $\nabla\psi$ is constant in $R$.

## Roulette

+ Deprecated
    + [Roulette Amplitudes in SIE](Roulette Amplitudes in SIE)

**Under Construction**

+ Step 1.  [Differentiation of SIE](Differentiation of SIE)

\begin{align}
  \alpha^m_s & = 
     \Gamma^m_s \square^{a^-}
\\\\\\\\
  \beta^m_s & = 
     \Gamma^m_s \square^{a^-}
\end{align}
