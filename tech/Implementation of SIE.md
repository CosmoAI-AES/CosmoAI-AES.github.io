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
$\psi_{\xi_0,f,\theta,D_\mathrm{L}}^\textrm{SIE(R)}(R,\phi)$.
The deflection is given by [](#theorem-sie-deflection).

::: {note} Note
In polar co-ordinates, we replace $x/R$ and $y/R$ with $\cos\phi$
and $\sin\phi$
respectively, and find that $\nabla\psi$ is constant in $R$.
:::

## Roulette


**Under Construction**

+ Step 1.  [Differentiation of SIE](Differentiation%20of%20SIE.md)

\begin{align}
  \alpha^m_s & = 
     \Gamma^m_s \square^{a^-}
     \sum_{k=0}^{2k\le s} (-1)^k
     \binom{s}{2k}
     \frac{\partial^{s}}{(\partial x)^{s-2k}(\partial y)^{2k}}
\\
  \beta^m_s & = 
     \Gamma^m_s \square^{a^-}
     \sum_{k=0}^{2k+1\le s} (-1)^k
     \binom{s}{2k+1}
     \frac{\partial^{s}}{(\partial x)^{s-2k-1}(\partial y)^{2k+1}}
\end{align}
where
\begin{equation}
     \Gamma^m_s = 
     \begin{cases}
        -(2^{-\delta_{0s}})\frac{\chi^{m+1}}{2^m}\binom{m+1}{(m+1-s)/2}, \quad\text{$m+s$ odd} \\
        0 \quad\text{$m+s$ even}
     \end{cases}
\end{equation}
and
\begin{equation}
  \square = (\nabla\psi)^2
\end{equation}

**TODO** $a^-$

+ Deprecated notes
    + [](#sie-roulette)
