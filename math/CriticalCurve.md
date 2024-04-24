---
title: Critical Curves
usemathjax: true
---

# Critical Curves

The derivation is based on
[Principles of Gravitational Lensing](https://link.springer.com/book/10.1007/978-3-030-02122-1) by Congdon and Keeton 2018.

## Basic Notation

Working with angular co-ordinates, $\beta$ denotes the source
and $\theta$ the image.  We consider only a single deflected point.

The **inverse magnification** is
\begin{equation}
   \mu^{-1}(\theta) = \frac{\beta}{\theta}\cdot\frac{d\beta}{d\theta} 
\end{equation}
The **amplification tensor** $A$ is given in terms of its inverse which 
is the Jacobian of the lens mapping.
\begin{equation}
  A^{-1} (\boldsymbol{\theta}) = \frac{d\boldsymbol{\beta}}{d\boldsymbol{\theta}}
  = 
  \begin{bmatrix}
    \frac{\partial u}{\partial x} &
    \frac{\partial u}{\partial y} \\\\\\\\
    \frac{\partial v}{\partial x} &
    \frac{\partial v}{\partial y}
  \end{bmatrix}
\end{equation}
where $\boldsymbol{\beta}=(u,v)$ and $\boldsymbol{\theta}=(x,y)$.

The raytrace equation is given as
\begin{equation}
  \boldsymbol{\beta} = (\boldsymbol{\theta})  - \nabla\psi
\end{equation}
which gives
\begin{equation}
  A^{-1} (\boldsymbol{\theta}) 
  = 
  \begin{bmatrix}
    1 - \psi_{xx} & -\psi_{xy} \\\\\\\\
    -\psi_{xy} & 1 - \psi_{yy} 
  \end{bmatrix}
\end{equation}

The **convergence** (or mass distribution) is
\begin{equation}
  \kappa(\theta) =
  \frac12( \psi_{xx} + \psi_{yy} )
\end{equation}
We also defines the shorthands
\begin{aligned}
  \gamma_+(\theta) &=
  \frac12( \psi_{xx} - \psi_{yy} ) \\\\\\\\
  \gamma_\times(\theta) &= \psi_{xy} 
\end{aligned}
We can then write
\begin{equation}
  A(\boldsymbol{\theta}) 
  = 
  \frac1{(1-\kappa)^2 - \gamma_+^2 - \gamma_\times^2}
  \begin{bmatrix}
    1 - \kappa + \gamma_+ & \gamma_\times \\\\\\\\
    \gamma_\times & 1 - \kappa - \gamma_+
  \end{bmatrix}
\end{equation}
It can be shown that $A^{-1}$ and $A$ are indeed inverses.

## Questions

The **magnification** of an image is given as
\begin{equation}
  \mu(\boldsymbol{\theta}) = \det A(\boldsymbol{\theta})
\end{equation}
*What is the significance of this?*
