---
title: Lens Models
theme: minima
usemathjax: true
---

# SIS (Singular isothermal sphere)

# SIE (Singular isothermal ellipsoid)

The singular isothermal ellipsoid is a simple example of a non-spherical source.

The dimensionless projected surface-mass density $\kappa$ is given as
\begin{equation}
  \kappa(X,Y)=\frac{\sqrt{f}\xi_0}{2\sqrt{X^2+f^2Y^2}},
\end{equation}
where the axis ratio $f$ obeys $0<f\le1$ and $\xi_0$ is a constant parameter related to the total
mass (analogous to the Einstein radius $R_E$).

**Remark**
Note that the normalization is chosen such that the mass inside an elliptical iso-density contour for 
fixed $\Sigma$ is independent of the axis ratio $f$.

Solving the Poisson equation, this gives, according to Kormann (1994) the following.
\begin{equation}
  \psi_\textrm{SIE}(\phi,R,\theta) =
  \frac{\xi_0}{\chi_\textrm{L}^2}\sqrt{\frac{f}{1-f^2}}R\Bigg([\sin(\theta+\phi)]\arcsin\left(\frac{\sin{(\theta+\phi)}}{\sqrt{1-f^2}}\right)
  +[\cos(\theta+\phi)]\arcsinh\left(\frac{\sqrt{1-f^2}}{f}\cos(\theta+\phi)\right)\Bigg).
\end{equation}
where $(R,\theta)$ are the polar coordinates in the lens plane,
whereas $\phi$ is the orientation of the ellipse. Thus $\phi$ should take a constant value across the image. Note the co-ordinate relation
\begin{equation}
    (X,Y)\quad\mapsto\quad R(\sin\theta,\cos\theta).
\end{equation}


