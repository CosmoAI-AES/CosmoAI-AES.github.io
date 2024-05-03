---
title: The SIE Lens
usemathjax: true
---


# SIE (Singular isothermal ellipsoid)

The singular isothermal ellipsoid is a simple example of a non-spherical source.

The dimensionless projected surface-mass density $\kappa$ is given as
\begin{equation}
  \kappa(\xi_1,\xi_2)=\frac{\sqrt{f}\xi_0}{2\sqrt{\xi_1^2+f^2\xi_2^2}},
\end{equation}
where the axis ratio $f$ obeys $0\lt f\le1$ and $\xi_0$ is a constant parameter related to the total
mass (analogous to the Einstein radius $R_E$).

**Remark**
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

**Remark**
Note that the normalization is chosen such that the mass inside an elliptical iso-density contour for 
fixed $\Sigma$ is independent of the axis ratio $f$.

Solving the Poisson equation, this gives, according to Kormann (1994) the following.
\begin{aligned}
\begin{split}
  \psi_{\xi_0,f,\theta,D_\mathrm{L}}^\textrm{SIE(R)}(R,\phi) =
  \frac{\xi_0}{D_\textrm{L}^2}\sqrt{\frac{f}{1-f^2}}R\cdot
  &\Bigg([\sin(\phi-\theta)]\cdot\sin^{-1}\left(\sqrt{1-f^2}\cdot \sin{(\phi-\theta)}\right)
  \\\\&
  +[\cos(\phi-\theta)]\cdot\sinh^{-1}\left(\frac{\sqrt{1-f^2}}{f}\cos(\phi-\theta)\right)\Bigg).
\end{split}
\end{aligned}
where $(R,\phi)$ are the polar coordinates in the lens plane,
whereas $\theta$ is the orientation of the ellipse.
That is, the major axis of the ellipse is $\theta$ from the $x$-axis, counter-clockwise.
Thus $\phi$ should take a constant value across the image. Note the co-ordinate relation
\begin{equation}
    \boldsymbol{\xi}= R(\sin\phi,\cos\phi).
\end{equation}
In the following, we use the following shorthands:
\begin{aligned}
  f' & =\sqrt{1-f^2}, 
\\\\\\\\
  C_0 & = \frac{\xi_0}{D_L^2}
\end{aligned}

### Normalisation of the Lens Potential

Recall from [Lens Potential](LensPotential) that the lens potential $\psi^{\mathrm{R}}$
used in the Roulette formalism differs from the more standard normalisation by a
factor of $\xi_0^2/D_L^2$ or $C_0\xi_0$.  If we also mormalise $R$, and write
$R=\xi_0r$, we can rewrite $\psi$ as
\begin{split}
  \psi_{\xi_0,f,\theta,D_\mathrm{L}}^\textrm{SIE(R)}(r,\phi) =
  \frac{\xi_0^2}{D_\textrm{L}^2}\sqrt{\frac{f}{1-f^2}}r\cdot
  &\Bigg([\sin(\phi-\theta)]\cdot\sin^{-1}\left(\sqrt{1-f^2}\cdot \sin{(\phi-\theta)}\right)
  \\\\&
  +[\cos(\phi-\theta)]\cdot\sinh^{-1}\left(\frac{\sqrt{1-f^2}}{f}\cos(\phi-\theta)\right)\Bigg).
\end{split}
Now the standard normalisation reads
\begin{split}
  \psi_{\xi_0,f,\theta,D_\mathrm{L}}^\textrm{SIE}(r,\phi) =
  \sqrt{\frac{f}{1-f^2}}r\cdot
  &\Bigg([\sin(\phi-\theta)]\cdot\sin^{-1}\left(\sqrt{1-f^2}\cdot \sin{(\phi-\theta)}\right)
  \\\\&
  +[\cos(\phi-\theta)]\cdot\sinh^{-1}\left(\frac{\sqrt{1-f^2}}{f}\cos(\phi-\theta)\right)\Bigg).
\end{split}

## Derivation with $\theta=0$ 

In this section we assume $\theta=0$, aligning the elliptical lens with the
primary axis. Then $\phi$ becomes
\begin{equation}
  \psi(r,\phi) =
  C_0\cdot \frac{\sqrt{f}}{f'}R\cdot\left[ \sin\phi\sin^{-1}(f'\cdot\sin\phi) + \cos\phi\sinh^{-1}\left(\frac{f'}{f}\cdot\cos\phi\right)\right] 
\end{equation}
In Cartesian coordinates, we get
\begin{equation}
   \psi(x,y) = C_0\cdot \frac{\sqrt{f}}{f'}\cdot\left[ 
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
  \frac{d}{dx}\sin^{-1} x  = \frac{1}{\sqrt{1-x^2}}
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
  C_0\frac{\sqrt{f}}{f'}\cdot\left[ 
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
  C_0\frac{\sqrt{f}}{f'}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
\end{equation}

### Differantiation with respect to $y$

The differentiation with respect to $y$ is similar and gives
\begin{equation}
  \frac{d}{dy}\psi(x,y) = 
  C_0\frac{\sqrt{f}}{f'}
    \sin^{-1}\left(f'\cdot\frac{y}{R}\right) 
\end{equation}

## Deflection for arbitrary orientation

There are several approaches,
1. we can differentiate the general formula for $\psi$,
2. we can rotate the co-ordinate system, use the derivation for $\theta=0$,
   and finally undo the rotation.
There are several varations of the latter approach too.  Here
we will consider one, which we consider intuitively simple.

### Approach 1. Rotation of the Coordinate System

The deflection is given as the vector $\nabla\psi$,
in a Cartesian co-ordinate system with axes aligned with the
axes of the lens.  We call this the lens frame.
We are interested in the deflection vector $\vec{\alpha}(x,y)$ in
a global frame, which shares the origin with the lens frame,
but is rotated clockwise by an angle $\theta$.
In other words, the lens is oriented at an angle $\theta$
(counterclockwise) in the global frame.

We will let $(x,y)$ denote the point in the global frame, and
$(x',y')$ the same point in the lens frame.  Hence
\begin{aligned}
   \begin{bmatrix} x' \\\\\\\\ y' \end{bmatrix}
   &=
   \begin{bmatrix}
     \cos\theta & \sin\theta \\\\\\\\
     -\sin\theta & \cos\theta 
   \end{bmatrix}
   \cdot
   \begin{bmatrix} x \\\\\\\\ y \end{bmatrix}
\end{aligned}
In other words, the $(x,y)$ coordinates are rotated clockwise.
Similarly the deflection is given as $\nabla\psi(x',y')$ in
the lens frame, and $\vec{\alpha}(x,y)$ in the global frame.
Thus, $\nabla\psi$ has to be rotated counterclockwise, as
\begin{aligned}
   \vec{\alpha}(x,y)
   &=
   \begin{bmatrix}
     \cos\theta & -\sin\theta \\\\\\\\
     \sin\theta & \cos\theta 
   \end{bmatrix}
   \cdot
   \nabla\psi(x',y')
\end{aligned}
This gives
\begin{aligned}
  \vec{\alpha}(x,y) = 
  C_0\frac{\sqrt{f}}{f'}\cdot
  \begin{bmatrix}
    \cos\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\theta+y\sin\theta}{R}\right)
    -\sin\theta\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\theta+y\cos\theta}{R}\right) 
    \\\\\\\\
    \sin\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\theta+y\sin\theta}{R}\right)
    +\cos\theta\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\theta+y\cos\theta}{R}\right) 
  \end{bmatrix}
\end{aligned}


## Implementation

This is implemented in the SIE class (`src/simlib/SIE.cpp`).

### Evaluation of the lens potential.

To evaluate the lens potential $\psi(x,y)$, we calculate the polar coordinates
$R$ and $\phi$, and use the formula above for 
$\psi_{\xi_0,f,\theta,D_\mathrm{L}}^\textrm{SIE(R)}(R,\phi)$.

### Evaluation of the Deflection.

This uses
\begin{aligned}
  \frac{\partial\psi}{\partial x} &=
  C_0\frac{\sqrt{f}}{f'}\cdot
    \left(
    \cos\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\theta+y\sin\theta}{R}\right)
    -\sin\theta\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\theta+y\cos\theta}{R}\right) 
    \right)
    \\\\\\\\
  \frac{\partial\psi}{\partial y} &=
  C_0\frac{\sqrt{f}}{f'}\cdot
    \left(
    \sin\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\theta+y\sin\theta}{R}\right)
    +\cos\theta\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\theta+y\cos\theta}{R}\right) 
    \right)
\end{aligned}
as taken from the expression for $\vec\alpha(x,y)$ above.
