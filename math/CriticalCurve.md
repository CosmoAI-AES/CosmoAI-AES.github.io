---
title: Critical Curves
usemathjax: true
---

# Critical Curves

We build on the notation defined in [Lens Potential](LensPotential).
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
  \mathcal{A}(\boldsymbol{\theta}) 
  = \frac{\partial\boldsymbol{\beta}}{\partial\boldsymbol{\theta}}
  = 
  \begin{bmatrix}
    \frac{\partial u}{\partial \theta_1} &
    \frac{\partial u}{\partial \theta_2} \\\\\\\\
    \frac{\partial v}{\partial \theta_1} &
    \frac{\partial v}{\partial \theta_2}
  \end{bmatrix}
\end{equation}
where $\boldsymbol{\beta}=(u,v)$ and $\boldsymbol{\theta}=(\theta_1,y)$.

The raytrace equation is given as
\begin{equation}
  \boldsymbol{\beta} = \boldsymbol{\theta}  - \nabla\psi
\end{equation}
which gives
\begin{equation}
  \mathcal{A}(\boldsymbol{\theta}) 
  = 
  \begin{bmatrix}
    1 - \psi_{\theta_1\theta_1} & -\psi_{\theta_1\theta_2} \\\\\\\\
    -\psi_{\theta_1\theta_2} & 1 - \psi_{\theta_2\theta_2} 
  \end{bmatrix}
\end{equation}
We can equivalently write it in normalised screen space co-cordinates
\begin{equation}
  \mathcal{A}(\mathbf{x}) 
  = 
  \begin{bmatrix}
    1 - \psi_{x_1x_1} & -\psi_{x_1y_2} \\\\\\\\
    -\psi_{x_1y_2} & 1 - \psi_{y_2y_2} 
  \end{bmatrix}
\end{equation}

## Decomposition

The **convergence** (or mass distribution) is
\begin{equation}
  \kappa(\theta) =
  \frac12( \psi_{\theta_1\theta_1} + \psi_{\theta_2\theta_2} )
\end{equation}
We also defines the shorthands
\begin{aligned}
  \gamma_+(\theta) &=
  \frac12( \psi_{\theta_1\theta_1} - \psi_{\theta_2\theta_2} ) \\\\\\\\
  \gamma_\times(\theta) &= \psi_{\theta_1\theta_2} 
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
