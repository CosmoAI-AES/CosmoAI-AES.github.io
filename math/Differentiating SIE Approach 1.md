---
title: Proof of the SIE Deflection
usemathjax: true
---

This is one of several approaches suggested for
differentiation of the lens potential for [](#sie).
It proves [](#theorem-sie-deflection).

(sie-approach-1)=
# Proof of the SIE Deflection

The deflection is given as the vector $\nabla\psi^{\mathrm{R}}$,
in a Cartesian co-ordinate system with axes aligned with the
axes of the lens.  We call this the lens frame.
We are interested in the deflection vector $\vec{\alpha}(x,y)$ in
a global frame, which shares the origin with the lens frame,
but is rotated clockwise by an angle $\lambda_L$.
In other words, the lens is oriented at an angle $\lambda_L$
(counterclockwise) in the global frame.

We will let $(x,y)$ denote the point in the global frame, and
$(x',y')$ the same point in the lens frame.  Hence
```{math}
\begin{aligned}
   \begin{bmatrix} x' \\ y' \end{bmatrix}
   &=
   \begin{bmatrix}
     \cos\lambda_L & \sin\lambda_L \\
     -\sin\lambda_L & \cos\lambda_L 
   \end{bmatrix}
   \cdot
   \begin{bmatrix} x \\ y \end{bmatrix}
\end{aligned}
```
In other words, the $(x,y)$ coordinates are rotated clockwise.
Similarly the deflection is given as $\nabla\psi^{\mathrm{R}}(x',y')$ in
the lens frame, and $\vec{\alpha}(x,y)$ in the global frame.
Thus, $\nabla\psi^{\mathrm{R}}$ has to be rotated counterclockwise, as
```{math}
\begin{aligned}
   \vec{\alpha}(x,y)
   &=
   \begin{bmatrix}
     \cos\lambda_L & -\sin\lambda_L \\
     \sin\lambda_L & \cos\lambda_L 
   \end{bmatrix}
   \cdot
   \nabla\psi^{\mathrm{R}}(x',y')
\end{aligned}
```
This gives
```{math}
\begin{aligned}
  \vec{\alpha}(x,y) = 
  C_0\frac{\sqrt{f}}{f'}\cdot
  \begin{bmatrix}
    \cos\lambda_L\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\lambda_L+y\sin\lambda_L}{R}\right)
    -\sin\lambda_L\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\lambda_L+y\cos\lambda_L}{R}\right) 
    \\
    \sin\lambda_L\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\lambda_L+y\sin\lambda_L}{R}\right)
    +\cos\lambda_L\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\lambda_L+y\cos\lambda_L}{R}\right) 
  \end{bmatrix}
\end{aligned}
```
