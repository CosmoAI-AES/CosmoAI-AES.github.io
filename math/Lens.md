---
title: Lens Models
usemathjax: true
---

# Lens Models

## Point Mass

\begin{aligned}
\psi = \frac{R_E^2}{D_L^2}\ln \frac{\xi}{R_E}
\end{aligned}

## SIS (Singular isothermal sphere)

The following expression for $\psi$ is implemented in `amplitudes.py`
\begin{aligned}
  \psi^\mathrm{SIS}(x,y) = - R_E\cdot\sqrt{x^2,y^2}
\end{aligned}
The sign causes some confusion, and we need to check if also EIS below needs a
negative sign.

## Others


+ [SIE](/math/SIE)
