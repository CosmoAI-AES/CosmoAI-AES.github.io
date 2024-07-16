---
title: Differenting SIE APproach 1
usemathjax: true
---


This is one of several approaches suggested for
differentiation of the lens potential for [SIE](SIE).

# Approach 1. Rotation of the Coordinate System

The deflection is given as the vector $\nabla\psi^{\mathrm{R}}$,
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
Similarly the deflection is given as $\nabla\psi^{\mathrm{R}}(x',y')$ in
the lens frame, and $\vec{\alpha}(x,y)$ in the global frame.
Thus, $\nabla\psi^{\mathrm{R}}$ has to be rotated counterclockwise, as
\begin{aligned}
   \vec{\alpha}(x,y)
   &=
   \begin{bmatrix}
     \cos\theta & -\sin\theta \\\\\\\\
     \sin\theta & \cos\theta 
   \end{bmatrix}
   \cdot
   \nabla\psi^{\mathrm{R}}(x',y')
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
