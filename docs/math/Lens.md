---
title: Lens Models
theme: minima
usemathjax: true
---

# SIS (Singular isothermal sphere)

The following expression for $\psi$ is implemented in `amplitudes.py`
{% raw %}
$$
\begin{aligned}\psi^\mathrm{SIS}(x,y) = - R_E\cdot\sqrt{x^2,y^2}\end{aligned}
$$
{% endraw %}
The sign causes some confusion, and we need to check if also EIS below needs a
negative sign.


# SIE (Singular isothermal ellipsoid)

The singular isothermal ellipsoid is a simple example of a non-spherical source.

The dimensionless projected surface-mass density $\kappa$ is given as
\begin{equation}
  \kappa(X,Y)=\frac{\sqrt{f}\xi_0}{2\sqrt{X^2+f^2Y^2}},
\end{equation}
where the axis ratio $f$ obeys $0\lt f\le1$ and $\xi_0$ is a constant parameter related to the total
mass (analogous to the Einstein radius $R_E$).

**Remark**
Note that the normalization is chosen such that the mass inside an elliptical iso-density contour for 
fixed $\Sigma$ is independent of the axis ratio $f$.

Solving the Poisson equation, this gives, according to Kormann (1994) the following.
$$
\begin{aligned}
\begin{split}
  \psi_{\xi_0,f,\phi,\chi_\mathrm{L}}^\textrm{SIE}(R,\theta) =
  \frac{\xi_0}{\chi_\textrm{L}^2}\sqrt{\frac{f}{1-f^2}}R\cdot
  &\Bigg([\sin(\theta+\phi)]\arcsin\left(\sqrt{1-f^2}\cdot \sin{(\theta+\phi)}\right)
  \\&
  +[\cos(\theta+\phi)]\mathrm{arcsinh}\left(\frac{\sqrt{1-f^2}}{f}\cos(\theta+\phi)\right)\Bigg).
\end{split}
\end{aligned}
$$
where $(R,\theta)$ are the polar coordinates in the lens plane,
whereas $\phi$ is the orientation of the ellipse. Thus $\phi$ should take a constant value across the image. Note the co-ordinate relation
\begin{equation}
    (X,Y)\quad\mapsto\quad R(\sin\theta,\cos\theta).
\end{equation}


