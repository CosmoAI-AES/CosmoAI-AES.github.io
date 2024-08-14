---
title: Roulette Amplitudes for the SIE Lens
usemathjax: true
---

**IMPORTANT** 
This is incorrect.  The ideas were used in early implementation
but proves wrong.  The notes are incomplete and will not be revised.

# Roulette Amplitudes for the SIE Lens

In the implementation, we calculate the first order derivatives of $\psi$ as
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
where $\theta$ is the orientation of the lens, and
\begin{aligned}
  f' & =\sqrt{1-f^2}, 
\\\\\\\\
  C_0 & = \frac{\xi_0}{D_L^2}
\end{aligned}
For $\theta=0$, this simplifies to
\begin{aligned}
  \frac{d}{dx}\psi^{\mathrm{R}}(x,y) &=
  C_0\frac{\sqrt{f}}{f'}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
\\\\\\\\
  \frac{d}{dy}\psi^{\mathrm{R}}(x,y) &= 
  C_0\frac{\sqrt{f}}{f'}
    \sin^{-1}\left(f'\cdot\frac{y}{R}\right) 
\end{aligned}

We take the same approach as we did with the raytrace equation, 
finding the roulette amplitudes first for $\theta=0$, and then 
rotating the entire system to find the amplitudes for arbitrary 
$\theta$.

