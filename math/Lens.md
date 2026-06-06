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
\psi^R = \theta_E^2\ln\theta
\end{aligned}
$$
where $\theta_E$ is the previously defined angular Einstein radius, $\theta_E=R_E/D_L$ and where $\theta=\sqrt{\theta_1^2+\theta_2^2}.$ 
:::{note}
Note that if one starts from $\psi=\ln{x}$ one finds 
$$
\begin{aligned}
\psi^R = \theta_E^2\ln\frac{\theta}{\theta_E}= \theta_E^2\ln\theta-\theta_E^2\ln\theta_E
\end{aligned}
$$
But the latter term is a constant, and the potential is always defined only up to a constant term, which shows that these two expressions are the same, as far as physics is concerned.

:::

## SIS (Singular isothermal sphere)

It is often necessary to model the lens as an extended object. The simplest such model,
useful for instance in the modelling of a galaxy surrounded by dark amtter, is the 
so-called _Singular isothermal sphere_, or SIS-model for short. The following expression for $\psi^R$ is implemented in `amplitudes.py`

$$
  \psi^R_\mathrm{SIS}(x,y) = \theta_E\cdot\theta,
$$

where notation is as for the point-mass case. In the code, we are working in angular variables. Hence what is called `einsteinR` 
in the code, is the *angular Einstein radius* $\theta_E$. Note that the partial derivatives are readily calculated as

$$
  \frac{\partial\psi}{\partial \theta_1} = \theta_E\cdot\frac{\theta_1}{\sqrt{\theta_1^2+\theta_1^2}}=\theta_E\frac{\theta_1}{\theta}\quad\textrm{and}\quad
  \frac{\partial\psi}{\partial \theta_2} = \theta_E\cdot\frac{\theta_2}{\sqrt{x^2+y^2}}=\theta_E\frac{\theta_2}{\theta}
$$
Thus the reduced deflection angle is in the SIS case given as

$$\boldsymbol{\alpha}=\frac{\theta_E}{\theta}\left(\theta_1,\theta_2\right).$$
Note that the norm of this vector is constant; $\alpha=|\boldsymbol{\alpha}|=\theta_E.$

See `psiXvalue` and `psiYvalue` in `SIS.cpp`.

Roulette amplitudes are calculated using the recursive formulæ.

## SIE
The extension of the SIS to an ellipsoide is well described in KORMAANN 1994, and referred to as
 the _Singular Isothermal Ellipsoid_, or SIE-lens for short. It is a three-parameter family of lens models: 
The Einstein radius ($\theta_E$), the excentricity factor $f$ and the orientation $\lambda$ of the lens relative to the 
polar axis. Given these parameters, the lens profile is given as:
$$
\begin{aligned}
\begin{split}
  \psi^R_\textrm{SIE}(\theta_E,f,\lambda;\theta,\phi) =
  \theta_E\sqrt{\frac{f}{1-f^2}}\theta\cdot
  &\Bigg([\sin(\phi-\lambda)]\cdot\sin^{-1}\left(\sqrt{1-f^2}\cdot \sin{(\phi-\lambda)}\right)
  \\\\&
  +[\cos(\phi-\lambda)]\cdot\sinh^{-1}\left(\frac{\sqrt{1-f^2}}{f}\cos(\phi-\lambda)\right)\Bigg).
\end{split}
\end{aligned}
$$
where $(\theta,\phi)$ are (normalized) polar coordinates in the lens plane, i.e.
$$
\begin{equation}
    \boldsymbol{\theta}=\theta_E\mathbf{x}=\theta(\sin\phi,\cos\phi).
\end{equation}
$$

The deflection may now be calculated using that

\begin{aligned}
  \frac{\partial\psi}{\partial \theta_1} &=
     \theta_E\cdot\frac{\sqrt{f}}{\sqrt{1-f^2}}\cdot\big(
        \cos\lambda\cdot\sinh^{-1}(\frac{\sqrt{1-f^2}}{f}\frac{\theta_1^\prime}{\theta})
        - \sin\lambda\cdot\sin^{-1}(\sqrt{1-f^2}\frac{\theta_2^\prime}{\theta})
        \big)
  \\\\\\\\
  \frac{\partial\psi}{\partial \theta_2} &=
     \theta_E\cdot\frac{\sqrt{f}}{\sqrt{1-f^2}}\cdot\big(
        \sin\lambda\cdot\sinh^{-1}(\frac{\sqrt{1-f^2}}{f}\frac{\theta_1^\prime}{\theta})
        + \cos\lambda\cdot\sin^{-1}(\sqrt{1-f^2}\frac{\theta_2^\prime}{\theta})
        \big)
\end{aligned}

where

\begin{aligned}
  \theta_1^\prime &= \cos\lambda\cdot \theta_1 + \sin\lambda\cdot \theta_2
  \\
  \theta_2^\prime &= -\sin\lambda\cdot \theta_1 + \cos\lambda\cdot \theta_2
\end{aligned}

and $\theta = \sqrt{\theta_1^2+\theta_2^2}$ as before.
As for SIS, $\theta_E$ is called `einsteinR` in the code.
See `psiXvalue` and `psiYvalue` in `SIE.cpp`.

+ [Calculation of the SIE Deflection](/math/SIE)
+ [](/math/Roulette%20Amplitudes%20in%20SIE)
+ [](/math/Legacy%20Notes%20on%20SIE)
