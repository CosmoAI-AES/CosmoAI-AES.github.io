---
title: Lens Models
usemathjax: true
---

# Lens Models

## Point Mass
Stars and other celestial objects may sometimes be modelled as so-called point-masses.
The gravitational potential is in this case  
$$
\begin{aligned}
\psi^R = \theta_E^2\ln \frac{\theta}{\theta_E}
\end{aligned}
$$
where $\theta_E$ is the previously defined angular Einstein radius, $\theta_E=R_E/D_L$ and where $\theta=\sqrt{\theta_1^2+\theta_2^2}.$

## SIS (Singular isothermal sphere)

It is often necessary to model the lens as an extended object. The simplest such model,
useful for instance in the modelling of a galaxy surrounded by dark amtter, is the 
so-called _Singular isothermal sphere_, or SIS-model for short. The following expression for $\psi^R$ is implemented in `amplitudes.py`
$$
\begin{aligned}
  \psi^R_\mathrm{SIS}(x,y) = \theta_E\cdot\theta,
\end{aligned}
$$
[CHECK: There was a negative sign here that I removed, HG]
where notation is as for the point-mass case. In the code, we are working in angular variables. Hence what is called `einsteinR` 
in the code, is the *angular Einstein radius* $\theta_E$. Thus the deflection is in the SIS case given as
$$
\begin{aligned}
  \frac{\partial\psi}{\partial \theta_1} &= \theta_E\cdot\frac{\theta_1}{\sqrt{\theta_1^2+\theta_1^2}}=\theta_E\frac{\theta_1}{\theta}\\\\\\\\
  \frac{\partial\psi}{\partial \theta_2} &= \theta_E\cdot\frac{\theta_2}{\sqrt{x^2+y^2}}=\theta_E\frac{\theta_2}{\theta}
\end{aligned}
$$
The differentiation is straight forward.
See `psiXvalue` and `psiYvalue` in `SIS.cpp`.

Roulette amplitudes are calculated using the recursive formulæ.

## SIE

$$
\begin{aligned}
\begin{split}
  \psi_{\xi_0,f,\theta,D_\mathrm{L}}^\textrm{SIE(R)}(R,\phi) =
  \frac{\xi_0}{D_\textrm{L}^2}\sqrt{\frac{f}{1-f^2}}R\cdot
  &\Bigg([\sin(\phi-\theta)]\cdot\sin^{-1}\left(\sqrt{1-f^2}\cdot \sin{(\phi-\theta)}\right)
  \\\\&
  +[\cos(\phi-\theta)]\cdot\sinh^{-1}\left(\frac{\sqrt{1-f^2}}{f}\cos(\phi-\theta)\right)\Bigg).
\end{split}
\end{aligned}
$$
where $(R,\phi)$ are the polar coordinates in the lens plane, i.e.
$$
\begin{equation}
    (x,y) = R\cdot (\sin\phi,\cos\phi).
\end{equation}
$$

The deflection is given as
$$
\begin{aligned}
  \frac{\partial\psi}{\partial x} &=
     C_0\cdot\frac{\sqrt{f}}{\sqrt{1-f^2}}\cdot\big(
        \cos\theta\cdot\sinh^{-1}(\frac{\sqrt{1-f^2}}{f}\frac{x'}{R})
        - \sin\theta\cdot\sin^{-1}(\sqrt{1-f^2}\frac{y'}{R})
        \big)
  \\\\\\\\
  \frac{\partial\psi}{\partial y} &=
     C_0\cdot\frac{\sqrt{f}}{\sqrt{1-f^2}}\cdot\big(
        \sin\theta\cdot\sinh^{-1}(\frac{\sqrt{1-f^2}}{f}\frac{x'}{R})
        + \cos\theta\cdot\sin^{-1}(\sqrt{1-f^2}\frac{y'}{R})
        \big)
\end{aligned}
$$
where
$$
\begin{aligned}
  x' &= \cos\theta\cdot x + \sin\theta\cdot y
  \\\\\\\\
  y' &= -\sin\theta\cdot x + \cos\theta\cdot y
  \\\\\\\\
  R &= \sqrt{x^2+y^2}
\end{aligned}
$$
As for SIS, $C_0=R_E/D_L^2$ is called `einsteinR` in the code.
See `psiXvalue` and `psiYvalue` in `SIE.cpp`.

+ [Calculation of the SIE Deflection](/math/SIE)
+ [](/math/Roulette%20Amplitudes%20in%20SIE)
+ [](/math/Legacy%20Notes%20on%20SIE)

::: {note} Implementation 
The factors $D_L$ and $D_L/D_S$ are ommitted in the calculations 
the roulette amplitudes ($\alpha$ and $\beta$), because they cancel when the
amplitudes are used in deflection formula.
:::
