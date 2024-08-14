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
  \psi^\mathrm{SIS}(x,y) = - \frac{R_E}{D_L^2}\cdot\sqrt{x^2+y^2}
\end{aligned}
The sign causes some confusion, and we need to check if also SIE below needs a
negative sign.

## SIE

\begin{aligned}
\begin{split}
  \psi_{\xi_0,f,\theta,D_\mathrm{L}}^\textrm{SIE(R)}(R,\phi) =
  \frac{\xi_0}{D_\textrm{L}^2}\sqrt{\frac{f}{1-f^2}}R\cdot
  &\Bigg([\sin(\phi-\theta)]\cdot\sin^{-1}\left(\sqrt{1-f^2}\cdot \sin{(\phi-\theta)}\right)
  \\\\&
  +[\cos(\phi-\theta)]\cdot\sinh^{-1}\left(\frac{\sqrt{1-f^2}}{f}\cos(\phi-\theta)\right)\Bigg).
\end{split}
\end{aligned}
where $(R,\phi)$ are the polar coordinates in the lens plane, i.e.
\begin{equation}
    (x,y) = R\cdot (\sin\phi,\cos\phi).
\end{equation}

+ [Deflection in SIE](/math/SIE)

# Implementation 


+ The factors $D_L$ and $D_L/D_S$ are ommitted in the calculations 
  the roulette amplitudes ($\alpha$ and $\beta$), because they cancel when the
  amplitudes are used in deflection formula.
