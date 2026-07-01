---
title: The Roulette Formalism
usemathjax: true
---


# The Roulette Formalism

+ [](#roulette-recursive)
+ [](#roulette-original)



```{figure} Model_2Db.svg
---
scale: 50%
float: right
---
The figure shows the set-up for the flat-sky approximation,
with the source plane (the lens plane) a distance $D_{\mathrm{S}}$
($D_{\mathrm{L}}$) from the observer.
```

```{figure} /docs/Model_3D.jpeg
---
scale: 50%
float: right
---
The figure shows the set-up for the model used.
In particular, the local coordinate systems used in the source plane 
and lens plane are shown.
```

Using angular coordinates, such that 
$$
\partial_i=\frac{\partial}{\partial\theta_i}
$$ 
we find the following expressions for the so-called Roulette amplitudes.

$$
\begin{equation}
\alpha_s^m = - \frac{1}{2^{\delta_{0s}}}
\sum_{k=0}^m\binom{m}{k}
  \left(\mathcal{C}_s^{m(k)}\partial_1+\mathcal{C}_s^{m(k+1)}\partial_2\right)
\partial_1^{m-k}\partial_2^k\psi^\textrm{R}
\end{equation}
$$

$$
\begin{equation}
   \mathcal{C}_s^{m(k)}=\frac{1}{\pi}\int_{-\pi}^{\pi}{\rm d}\phi\sin^k\phi\cos^{m-k+1}\phi\cos s\phi
\end{equation}
$$

$$
\begin{equation}
   \beta_s^m=-\sum_{k=0}^m\binom{m}{k}\left({\mathcal{S}}_s^{m(k)}\partial_1+{\mathcal{S}}_s^{m(k+1)}\partial_2\right)\partial_1^{m-k}\partial_2^k\psi^\textrm{R}
\end{equation}
$$

$$
\begin{equation}
   \mathcal{S}_s^{m(k)}=\frac{1}{\pi}\int_{-\pi}^{\pi}{\rm d}\phi\sin^k\phi\cos^{m-k+1}\phi\sin s\phi.
\end{equation}
$$

The observed lensing is decomposed into two steps, as shown the figure.
The first step is a translation (deflection), corresponding to the difference 
$\boldsymbol{\Delta\eta}$ between actual 
($\boldsymbol{\eta}_\textrm{act}$)
and apparent 
($\boldsymbol{\eta}_\textrm{app}$) source-plane position.
In the roulette formalism, this translational part of the lensing is given as
$$\begin{equation}
   \boldsymbol{\alpha}=\nabla_\theta\psi^\textrm{R}=-(\alpha^0_1,\beta^0_1),
\end{equation}$$
where $(\alpha_1^0,\beta_1^0)$ is a vector of roulette amplitudes, as
defined above.

The second step is the actual, non-linear distortion.
The distorted image is drawn in a local co-ordinate system in the lens
plane, centred at $\boldsymbol{\theta}=(\theta_1,\theta_2)$, 
Following Clarkson, we use polar co-ordinates for the distorted image. While Clarkson used $(r,\phi)$ we will use $(\tilde{\theta},\phi)$, since we use angular units.

```{figure} Model_LocalPolar.svg
---
scale: 50%
float: right
---
The lens plane, viewed face-on. The local polar co-ordinate system
$(\tilde{\theta},\phi)$ is centred on the image, with $\tilde\theta$
the (angular) radius and $\phi$ the angle from the local polar axis
(parallel to the global $\theta_1$ direction). The global coordinate
directions $\theta_1,\theta_2$, centred on the lens, are shown for
reference.
```
The source image is described in Cartesian co-ordinates $(\tilde{\beta}_1,\tilde{\beta}_2)^\textrm{T}$ centered
at $\boldsymbol{\beta}$ in the source plane.
Thus the light observed at a position (pixel) $(\tilde{\theta},\phi)$ is drawn from
a different position (pixel) $(\tilde{\beta}_1,\tilde{\beta}_2)=\mathcal{D}(\tilde{\theta},\phi)$ in the source image.
From Eq. (48) in [](doi:10.1088/0264-9381/33/24/245003)
it is possible to show that the mapping $\mathcal{D}$ is given as

$$
\begin{aligned}
   \begin{bmatrix} \tilde{\beta}_1 \\\\ \tilde{\beta}_2 \end{bmatrix} &=
   \tilde{\theta}\cdot\begin{bmatrix} \cos\phi \\\\ \sin\phi \end{bmatrix} 
      + \sum_{m=1}^{\infty} \frac{\tilde{\theta}^m}{m!}
      \cdot\sum_{s=0}^{m+1} c_{m+s}
       \left(\alpha_s^m \boldsymbol{A}_{s} + \beta_s^m \boldsymbol{B}_{s} \right) 
       \begin{bmatrix} C^+ \\\\ C^- \end{bmatrix}
   \\
   C^\pm &= \pm \frac{s}{m+1},
   \\
   c_{m+s} &= 
      \frac{1 - (-1)^{m+s}}{4} =
   \begin{cases}
      0, \quad m+s \text{ is even},\\
      \frac12, \quad m+s \text{ is odd},
   \end{cases}
\\
    \boldsymbol{A}_{s} &= \begin{bmatrix}
    \cos{(s-1)\phi} & \cos{(s+1)\phi} \\
    -\sin{(s-1)\phi} &  \sin{(s+1)\phi} \end{bmatrix},
    \\
    \boldsymbol{B}_{s} &=
    \begin{bmatrix} 
        \sin{(s-1)\phi} & \sin{(s+1)\phi} \\
        \cos{(s-1)\phi} & -\cos{(s+1)\phi} 
    \end{bmatrix}.
\end{aligned}
$$
The coefficients $\alpha_m^s$ and $\beta_m^s$ depend on the lens potential
$\psi(\theta_1,\theta_2)$, from which one may derive the physical properties of the lens.

In practice the sum has to be truncated by limiting $m\le m_0$ for some $m_0$.

The roulette amplitudes are always calculated in a specific 
[Reference Point](ReferencePoint.md).
