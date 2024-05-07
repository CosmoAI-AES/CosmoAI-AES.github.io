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

Since $\mathcal{A}$ is real and symmetric, we can decompose it using the identity matrix 
and the Pauli spin matrices
\begin{equation}
   R_- = 
  \begin{bmatrix}
    1 & 0 \\\\  0 & -1
  \end{bmatrix}
  \quad
   R_/ = 
  \begin{bmatrix}
    0 & 1  \\\\  1 & 0
  \end{bmatrix}
\end{equation}
We get
\begin{equation}
  \mathcal{A}(\mathbf{x}) 
  = 
  (1-\kappa)I - \gamma_+R_- - \gamma_\times R_/
\end{equation}
where this **convergence** (or mass distribution) is
\begin{equation}
  \kappa(\theta) =
  \frac12( \psi_{\theta_1\theta_1} + \psi_{\theta_2\theta_2} )
\end{equation}
and
\begin{aligned}
  \gamma_+(\theta) &=
  \frac12( \psi_{\theta_1\theta_1} - \psi_{\theta_2\theta_2} ) \\\\\\\\
  \gamma_\times(\theta) &= \psi_{\theta_1\theta_2} 
\end{aligned}
We can then write
\begin{equation}
  \mathcal{A}(\boldsymbol{\theta}) 
  = 
  \begin{bmatrix}
    1 - \kappa - \gamma_+ & - \gamma_\times \\\\\\\\
    - \gamma_\times & 1 - \kappa + \gamma_+
  \end{bmatrix}
\end{equation}
It is then straight forward to prove that the eigenvalues of
$\mathcal{A}(\boldsymbol{\theta})$  are
\begin{equation}
  \lambda_\pm = 
    (1 - \kappa) \pm \sqrt{\gamma_+^2 + \gamma_\times^2}
\end{equation}
and we can verify that the inverse is given as
\begin{equation}
  \mathcal{A}^{-1}(\boldsymbol{\theta}) 
  = 
  \frac1{(1-\kappa)^2 - \gamma_+^2 - \gamma_\times^2}
  \begin{bmatrix}
    1 - \kappa + \gamma_+ & \gamma_\times \\\\\\\\
    \gamma_\times & 1 - \kappa - \gamma_+
  \end{bmatrix}
\end{equation}

## Magnification

The **magnification** of an image is given as
\begin{equation}
  \mu(\boldsymbol{\theta}) = \det \mathcal{A}^{-1}(\boldsymbol{\theta})
  = \frac1{\det\mathcal{A}} = \lambda_-\lambda_+ =
  \frac1{(1-\kappa)^2 - \gamma_+^2 - \gamma_\times^2}
\end{equation}

**TODO**
*What is the significance of this?*

**TODO** 
Is this consistent with the inverse magnification given in some sources?
The **inverse magnification** is
\begin{equation}
   \mu^{-1}(\theta) = \frac{\beta}{\theta}\cdot\frac{d\beta}{d\theta} 
\end{equation}

## Critical Curves and Caustics

The **critical curve** is defined as the set of points where the map from source to image plane
breaks down, i.e. when the magnification tends to infinity.
Thus the critical curve is the solution of the equation $\det\mathcal{A}=0$, or
\begin{equation}
  0 = \lambda_-\lambda_+ = (1-\kappa)^2 - \gamma_+^2 - \gamma_\times^2
\end{equation}

**TODO** Define **caustic**
