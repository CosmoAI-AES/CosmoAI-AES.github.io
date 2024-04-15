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
  \psi_{\xi_0,f,\theta,\chi_\mathrm{L}}^\textrm{SIE}(R,\phi) =
  \frac{\xi_0}{\chi_\textrm{L}^2}\sqrt{\frac{f}{1-f^2}}R\cdot
  &\Bigg([\sin(\theta+\phi)]\arcsin\left(\sqrt{1-f^2}\cdot \sin{(\theta+\phi)}\right)
  \\\\&
  +[\cos(\theta+\phi)]\mathrm{arcsinh}\left(\frac{\sqrt{1-f^2}}{f}\cos(\theta+\phi)\right)\Bigg).
\end{split}
\end{aligned}
where $(R,\phi)$ are the polar coordinates in the lens plane,
whereas $\theta$ is the orientation of the ellipse.
Thus $\phi$ should take a constant value across the image. Note the co-ordinate relation
\begin{equation}
    (X,Y)= R(\sin\theta,\cos\theta).
\end{equation}
In the following, we use the following shorthands:
\begin{aligned}
  f' & =\sqrt{1-f^2}, 
\\\\\\\\
  R_E & = \frac{\xi_0}{D_L^2}
\end{aligned}

## Derivation with $\theta=0$ 

In this section we assume $\theta=0$, aligning the elliptical lens with the
primary axis. Then $\phi$ becomes
\begin{equation}
  \psi(r,\phi) =
  R_E\cdot \frac{\sqrt{f}}{f'}R\cdot\left[ \sin\phi\sin^{-1}(f'\cdot\sin\phi) + \cos\phi\sinh^{-1}\left(\frac{f'}{f}\cdot\cos\phi\right)\right] 
\end{equation}
In Cartesian coordinates, we get
\begin{equation}
   \psi(x,y) = R_E\cdot \frac{\sqrt{f}}{f'}\cdot\left[ 
    y\sin^{-1}\left(f'\cdot\frac{y}{R}\right) 
    + x\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
    \right] 
\end{equation}
where 
\begin{equation}
  R=\sqrt{x^2+y^2}
\end{equation}

The deflection is given by the gradient $\nabla\psi$.
We need the following basic rules.
\begin{equation}
  \frac{d}{dx}\arcsin x  = \frac{1}{\sqrt{1-x^2}}
\end{equation}
\begin{equation}
  \frac{d}{dx}\sinh^{-1} x = \frac{1}{\sqrt{1+x^2}}
\end{equation}

### Differantiation with respect to $x$

Firstly, we differentiate the $\sin^{-1}$-term
\begin{aligned}
\begin{split}
  t_1 = \frac{d}{dx}
    y\sin^{-1}\left(f'\cdot\frac{y}{R}\right) 
    &= \frac{y}{\sqrt{1 - (f'\frac{y}{R})^2}}(f'y)
    \frac{d}{dx}\frac{1}{R}
    \\\\&
    = \frac{y}{\sqrt{1 - (f'\frac{y}{R})^2}}(f'y)
    \frac{-1}{R^2}
    \frac{dR}{dx}
    \\\\&
    = \frac{y}{\sqrt{1 - (f'\frac{y}{R})^2}}(f'y)
    \frac{-1}{R^2}
    \frac{x}{R}
    \\\\&
    = -\frac{f'xy^2}{\sqrt{1 - (f'\frac{y}{R})^2}}
    \frac{1}{R^3}
    \\\\&
    = -\frac{f'xy^2}{R^3}\cdot
    \frac{1}{\sqrt{1 - (f'\frac{y}{R})^2}}
\end{split}
\end{aligned}
Secondly, we differentiate the $\sinh^{-1}$-term
\begin{aligned}
\begin{split}
  \frac{d}{dx}
     x\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
    &= \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
    + \frac{x}{\sqrt{1 + (\frac{f'}{f}\frac{x}{R})^2}}\frac{f'}{f}
     \cdot \frac{d}{dx}\frac{x}{R}
    \\\\&
    = \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right) + t_2
\end{split}
\end{aligned}
where 
\begin{aligned}
\begin{split}
    t_2 &= \frac{x}{\sqrt{1 + (\frac{f'}{f}\frac{x}{R})^2}}\frac{f'}{f}
     \cdot \frac{d}{dx}\frac{x}{R}
    \\\\&
    = \frac{x}{\sqrt{1 + (\frac{f'}{f}\frac{x}{R})^2}}\frac{f'}{f}
     \cdot \left[ \frac{1}{R} - x\frac{1}{R^2}\frac{x}{R} \right] 
    \\\\&
    = \frac{x}{\sqrt{1 + (\frac{f'}{f}\frac{x}{R})^2}}\frac{f'}{f}
     \cdot \frac{x^2+y^2 - x^2}{R^3}
    \\\\&
    = \frac{f'}{f}\cdot\frac{xy^2}{\sqrt{1 + (\frac{f'}{f}\frac{x}{R})^2}}
     \cdot \frac{1}{R^3}
    \\\\&
    = \frac{f'xy^2}{R^3} \cdot \frac{1}{\sqrt{f^2 + (f'\frac{x}{R})^2}}
\end{split}
\end{aligned}
The partial derivative of the lens potential is then
\begin{equation}
  \frac{d}{dx}\psi(x,y) = 
  R_E\frac{\sqrt{f}}{f'}\cdot\left[ 
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
    + t_1 + t_2
    \right]
\end{equation}
We can prove that $t_1+t_2=0$.
\begin{equation}
    t_1 + t_2
    = \frac{f'xy^2}{R^3} \cdot \left[ \frac{1}{\sqrt{f^2 + (f'\frac{x}{R})^2}}
    - \frac{1}{\sqrt{1 - (f'\frac{y}{R})^2}} \right]
\end{equation}
It suffices to prove that $T=0$ where
\begin{equation}
    T =  \frac{1}{\sqrt{f^2 + (f'\frac{x}{R})^2}}
    - \frac{1}{\sqrt{1 - (f'\frac{y}{R})^2}} 
\end{equation}
We have
\begin{equation}
    T =  \frac{R}{\sqrt{f^2R^2 + (1-f^2)x^2}}
    - \frac{R}{\sqrt{R^2 - (1-f^2)y^2}} 
\end{equation}
Using the fact that $R^2=x^2+y^2$ we get
\begin{equation}
    T =
    =  \frac{R}{\sqrt{f^2y^2+x^2}}
    - \frac{R}{\sqrt{x^2 + f^2y^2}} = 0,
\end{equation}
as required.
We conclude that
\begin{equation}
  \frac{d}{dx}\psi(x,y) = 
  R_E\frac{\sqrt{f}}{f'}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
\end{equation}

### Differantiation with respect to $y$

The differentiation with respect to $y$ is similar and gives
\begin{equation}
  \frac{d}{dy}\psi(x,y) = 
  R_E\frac{\sqrt{f}}{f'}
    \sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
\end{equation}

## Deflection for arbitrary orientation

There are several approaches,
1. we can differentiate the general formula for $\psi$,
2. we can rotate the co-ordinate system, use the derivation for $\theta=0$,
   and finally undo the rotation.
There are several varations of the latter approach too.  Here
we will consider one, which we consider intuitively simple.

The deflection is given as the vector $\nabla\psi(x,y)$,
in a Cartesian co-ordinate system with axes aligned with the
axes of the lens.  We call this the lens frame.
We are interested in the deflection vector $\vec{\alpha}(x,y)$ in
a global frame, which shares the origin with the lens frame,
but is rotated clockwise by an angle $\theta$.
In other words, the lens is oriented at an angle $\theta$
(counterclockwise) in the global frame.

We obtain $\vec{\alpha}(x,y)$ in the global frame by rotating
$\nabla\psi(x,y)$ counterclockwise.  In other words
\begin{aligned}
  \vec{\alpha}(x,y) = 
  \begin{bmatrix}
    \cos\theta & -\sin\theta \\\\\\\\
    \sin\theta & \cos\theta 
  \end{bmatrix}
  \nabla\psi(x,y)
\end{aligned}
where the vectors are seen as column vectors, and
\begin{aligned}
  \nabla\psi = 
  R_E\frac{\sqrt{f}}{f'}\cdot
  \begin{bmatrix}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
    \\\\\\\\
    \sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
  \end{bmatrix}
\end{aligned}
Thus
\begin{aligned}
  \nabla\psi = 
  R_E\frac{\sqrt{f}}{f'}\cdot
  \begin{bmatrix}
    \cos\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
    -\sin\theta\cdot\sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
    \\\\\\\\
    \sin\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
    +\cos\theta\cdot\sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
  \end{bmatrix}
\end{aligned}


## Implementation

### Evaluation of the lens potential.

To evaluate the lens potential $\psi(x,y)$, we calculate the polar coordinates
$R$ and $\phi$, and use the formula above for 
$\psi_{\xi_0,f,\theta,\chi_\mathrm{L}}^\textrm{SIE}(R,\phi)$.

### Evaluation of the Deflection.

This uses
\begin{aligned}
  \frac{\partial\psi}{\partial x} &=
  R_E\frac{\sqrt{f}}{f'}\cdot
    \left(\cos\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
    -\sin\theta\cdot\sin^{-1}\left(f'\cdot\frac{y}{r}\right) \right)
    \\\\\\\\
  \frac{\partial\psi}{\partial x} &=
  R_E\frac{\sqrt{f}}{f'}\cdot
    \left( \sin\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
    +\cos\theta\cdot\sin^{-1}\left(f'\cdot\frac{y}{r}\right)  \right)
\end{aligned}
