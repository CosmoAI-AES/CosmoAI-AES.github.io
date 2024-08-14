---
title: Differentiation of SIE
usemathjax: true
---

# Differentiation of SIE (Approach 2)


Calculation of the amplitudes is computationally expensive,
and a lot of care is needed to make it tenable.
We have tried several approaches which have failed.
The following notes solve only the subproblem of
differentiating $\psi$ many times.

**Under Construction**

# Differentiation of SIE

Using a Cartesian coordinate system aligned with the lens,
the lens potential is given as
\begin{equation}
   \psi^{\mathrm{R}}(x',y') = C_0\cdot \frac{\sqrt{f}}{f'}\cdot\left[ 
    y'\sin^{-1}\left(f'\cdot\frac{y'}{R}\right) 
    + x'\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x'}{R}\right)
    \right] 
\end{equation}
where 
\begin{equation}
  R=\sqrt{x'^2+y'^2}
\end{equation}
The first order derivatives (see [SIE](SIE)) are given as
\begin{equation}
  \frac{d}{dx'}\psi^{\mathrm{R}}(x',y') = 
  C_0\frac{\sqrt{f}}{f'}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x'}{R}\right)
    \\
  \frac{d}{dy'}\psi^{\mathrm{R}}(x',y') = 
  C_0\frac{\sqrt{f}}{f'}
    \sin^{-1}\left(f'\cdot\frac{y'}{R}\right) 
\end{equation}

We want to differentiate in the global coordinate system
$(x,y)$.  Since the lens is located at the global
origin, the $(x,y)$-system is obtained by rotating
the $(x',y')$-system by an angle $\theta$.
Hence
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
We can differentiate the coordinates, so that
\begin{align}
   \frac{dx'}{dx} & = \cos\theta
   \\\\\\\\
   \frac{dx'}{dy} & = \sin\theta
   \\\\\\\\
   \frac{dy'}{dx} & = -\sin\theta
   \\\\\\\\
   \frac{dy'}{dy} & = \cos\theta
\end{align}
Note that all of these derivatives are constants, so that all
higher-order derivatives vanish.

# Differentiation in the global frame

Because $\psi$ is specified most compactly in the lens frame,
it is computationally cheaper to differentiate in this frame.
Given derivatives in the lens frame, we can find the derivatives
in the global frame using the chain rule.
We get
\begin{equation}
  \frac{\partial^{m+n}\psi}{(\partial x)^m(\partial r)^n}
  = \sum_{i=0}^m \sum_{j=0}^n \binom{m+n}{i+j}
  \big(\frac{\partial x'}{\partial x}\big)^{m-i}
  \big(\frac{\partial y'}{\partial x}\big)^{i}
  \big(\frac{\partial x'}{\partial y}\big)^{n-j}
  \big(\frac{\partial y'}{\partial y}\big)^{j}
  \frac{\partial^{m+n}\psi}{(\partial x')^{m-i+j}(\partial y')^{n-j+i}}
\end{equation}
Inserting for the derivatives of $x'$ and $y'$ we get
\begin{equation}
  \frac{\partial^{m+n}\psi}{(\partial x)^m(\partial r)^n}
  = \sum_{i=0}^m \sum_{j=0}^n \binom{m+n}{i+j}
  \cos^{m-i+j}\theta\cdot
  \sin^{n-j+i}\theta\cdot
  (-1)^i
  \frac{\partial^{m+n}\psi}{(\partial x')^{m-i+j}(\partial y')^{n-j+i}}
\end{equation}
**TODO** Check this
