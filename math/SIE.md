---
title: The SIE Lens
usemathjax: true
---


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
\begin{aligned}
\begin{split}
  \psi_{\xi_0,f,\phi,\chi_\mathrm{L}}^\textrm{SIE}(R,\theta) =
  \frac{\xi_0}{\chi_\textrm{L}^2}\sqrt{\frac{f}{1-f^2}}R\cdot
  &\Bigg([\sin(\theta+\phi)]\arcsin\left(\sqrt{1-f^2}\cdot \sin{(\theta+\phi)}\right)
  \\\\&
  +[\cos(\theta+\phi)]\mathrm{arcsinh}\left(\frac{\sqrt{1-f^2}}{f}\cos(\theta+\phi)\right)\Bigg).
\end{split}
\end{aligned}
where $(R,\theta)$ are the polar coordinates in the lens plane,
whereas $\phi$ is the orientation of the ellipse.
Thus $\phi$ should take a constant value across the image. Note the co-ordinate relation
\begin{equation}
    (X,Y)\quad\mapsto\quad R(\sin\theta,\cos\theta).
\end{equation}


## Sketches

Potential in polar coordinates (source?)
\begin{equation}
  \psi(r,\phi) =
  R_E\cdot \frac{\sqrt{f}}{f'}r\cdot\left[ \sin\phi\sin^{-1}(f'\cdot\sin\phi) + \cos\phi\sinh^{-1}\left(\frac{f'}{f}\cdot\cos\phi\right)\right] 
\end{equation}

In Cartesian coordinates, we get
\begin{equation}
   \psi(x,y) = R_E\cdot \frac{\sqrt{f}}{f'}\cdot\left[ 
    y\sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
    + x\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{r}\right)
    \right] 
\end{equation}
where $f$ is the exentricity parameter of the ellipsoid, and
\begin{equation}
  R_E = \frac{\xi_0}{D_L^2}
\end{equation}
and 
\begin{equation}
  r=\sqrt{x^2+y^2}
\end{equation}


\begin{equation}
  \frac{d}{dx}\psi(x,y) = 
  \frac{\sqrt{f}}{f'}\cdot\left[ 
    y\frac{1}{1-(f'\cdot\frac{y}{r})^2}
    \cdot
    \frac{xy}{r^3}
    +
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{r}\right) 
    +
    x\frac{1}{1+(\frac{f'}{f}\cdot\frac{x}{r})^2}
    \cdot
    \frac{y^2}{r^3}
    \right]
\end{equation}

\begin{equation}
  \frac{d}{dy}\psi(x,y) = 
  \frac{\sqrt{f}}{f'}\cdot\left[ 
    x\frac{1}{1+(\frac{f'}{f}\cdot\frac{y}{r})^2}
    \cdot
    \frac{xy}{r^3}
    +
    \sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
    +
    y\frac{1}{1-(f'\cdot\frac{y}{r})^2}\cdot\frac{x^2}{r^3}
    \right]
\end{equation}


\begin{equation}
  \frac{d}{dx}\psi(x,y) = 
  \frac{\sqrt{f}}{f'}\cdot\left[ 
    -\frac{y}{r}\frac{xy}{r^2-(f'\cdot{y})^2}
    +
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{r}\right) 
    +
    \frac{x}{r}\frac{y^2}{r^2+(\frac{f'}{f}\cdot{x})^2}
    \right]
\end{equation}

\begin{equation}
  \frac{d}{dy}\psi(x,y) = 
  \frac{\sqrt{f}}{f'}\cdot\left[ 
    -\frac{x}{r}\frac{xy}{r^2+(\frac{f'}{f}\cdot{x})^2}
    +
    \sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
    +
    \frac{y}{r}\frac{x^2}{r^2-(f'\cdot{y})^2}
    \right]
\end{equation}

\begin{equation}
  \frac{d}{dx}\arcsin x  = \frac{1}{\sqrt{1-x^2}}
\end{equation}
\begin{equation}
  \frac{d}{dx}\sinh^{-1} x = \frac{1}{\sqrt{1+x^2}}
\end{equation}
