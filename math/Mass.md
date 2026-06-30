
# Surface Mass Density

A final, very central concept in lensing, is the convergence $\kappa$.
This is the dimensionless,
projected surface-mass density, which is related to $\psi$ through the Poisson equation. In our 
coordinates this gives
\begin{equation}
  \boxed{\kappa(\boldsymbol{\theta})= \frac12\nabla_\theta\psi^R}
\end{equation}

Writing it out more explicitely, we find 
\begin{equation}
\kappa(\boldsymbol{\theta})= \frac12\left(
     \frac{\partial^2\psi^{\mathrm{R}}}{\partial\theta_1^2} + 
     \frac{\partial^2\psi^{\mathrm{R}}}{\partial\theta_2^2}
     \right)
\end{equation}

## SIE (Singular isothermal ellipsoid)

The singular isothermal ellipsoid is a simple example of a non-spherical source.


The dimensionless projected surface-mass density $\kappa$ is given as
\begin{equation}
  \kappa(\xi_1,\xi_2)=\frac{\sqrt{f}\xi_0}{2\sqrt{\xi_1^2+f^2\xi_2^2}},
\end{equation}
where the axis ratio $f$ obeys $0\lt f\le1$ and $\xi_0$ is a constant parameter related to the total
mass (analogous to the Einstein radius $R_E$).

::: {note} Remark
The relationship between $\kappa$ and the lens potential $\psi^{\mathrm{R}}$ is
\begin{equation}
  \kappa(\xi_1,\xi_2) = 
     \frac12D_L^2\left(
     \psi_{\xi_1\xi_1}^{\mathrm{R}}(\xi_1,\xi_2) 
     +
     \psi_{\xi_2\xi_2}^{\mathrm{R}}(\xi_1,\xi_2)
     \right)
\end{equation}
where $\psi^{\mathrm{R}}$ is defined in [Lens Potential](LensPotential).
:::

Solving the Poisson equation, this gives, according to 
@kormann1994isothermal the following.
$$
\begin{aligned}
\begin{split}
  \psi_{\xi_0,f,\theta,D_\mathrm{L}}^\textrm{SIE(R)}(\theta,\phi) =
  \frac{\xi_0}{D_\textrm{L}^2}\sqrt{\frac{f}{1-f^2}}\theta\cdot
  &\Bigg([\sin(\phi-\lambda_L)]\cdot\sin^{-1}\left(\sqrt{1-f^2}\cdot \sin{(\phi-\lambda_L)}\right)
  \\\\&
  +[\cos(\phi-\lambda_L)]\cdot\sinh^{-1}\left(\frac{\sqrt{1-f^2}}{f}\cos(\phi-\lambda_L)\right)\Bigg).
\end{split}
\end{aligned}
$$
where $(\theta,\phi)$ are the polar coordinates in the lens plane,
whereas $\lambda_L$ is the orientation of the ellipse.

::: {note} Remark
Note that the normalization is chosen such that the mass inside
an elliptical iso-density contour for 
fixed $\Sigma$ is independent of the axis ratio $f$.
:::
