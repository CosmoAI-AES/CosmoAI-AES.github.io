---
title: Legacy Notes for the SIE Lens
usemathjax: true
---

## In Polar Co-ordinates

\begin{aligned}
  \frac{\partial\psi^{\mathrm{R}}}{\partial x} &=
  C_0\frac{\sqrt{f}}{f'}\cdot
    \left(
    \cos\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot(\cos\phi\cos\theta+\sin\phi\sin\theta)\right)
    -\sin\theta\cdot\sin^{-1}\left(f'\cdot(-\cos\phi\sin\theta+\sin\phi\cos\theta)\right) 
    \right)
    \\\\\\\\
  \frac{\partial\psi^{\mathrm{R}}}{\partial y} &=
  C_0\frac{\sqrt{f}}{f'}\cdot
    \left(
    \sin\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\(\cos\phi\cos\theta+\sin\phi\sin\theta)\right)
    +\cos\theta\cdot\sin^{-1}\left(f'\cdot(-\cos\phi\sin\theta+\sin\phi\cos\theta)\right) 
    \right)
\end{aligned}

Since these expression are constant in $R$, we can write
\begin{aligned}
  \frac{\partial f}{\partial x} &=
    - \big(\frac{\sin\phi}{R}\big)\frac{\partial f}{\partial\phi}
    \\\\\\\\
  \frac{\partial f}{\partial y} &=
    \big(\frac{\cos\phi}{R}\big)\frac{\partial f}{\partial\phi}
\end{aligned}
where $f=\psi_x,\psi_y$.

