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


The observed lensing is decomposed into two steps, as shown by the figure.
The first step is a translation (deflection), corresponding to the difference between apparent ($\boldsymbol{\theta}$)
and actual ($\boldsymbol{\beta}$) source position:
$$\begin{equation}
   \boldsymbol{\alpha}=\boldsymbol{\theta}-\boldsymbol{\beta}.
\end{equation}$$
We have already seen that the deflection angle $boldsymbol{\alpha}$ may be expressed as the gradient of the two-dimensional projected lensing potential. In the roulette formalism this translates into a set of so-called roulette amplitudes. In particular 
$$\begin{equation}
   \boldsymbol{\alpha}=\nabla_\theta\psi^\textrm{R}=-(\alpha^0_1,\beta^0_1),
\end{equation}$$
where $(\alpha_1^0,\beta_1^0)$ is a vector of roulette amplitudes, as
defined above. 

The second step is the actual, non-linear distortion, and may be expresed through higher-order derivatives of the lensing potential. The distorted image is drawn in a local co-ordinate system in the lens
plane, centred at $\boldsymbol{\theta}=(\theta_1,\theta_2)$. Following Clarkson, we use polar co-ordinates for the distorted image. While Clarkson used $(r,\phi)$ we will use $(\tilde{\theta},\phi)$, since we use angular units.

The source image is described in Cartesian co-ordinates $(\tilde{\beta}_1,\tilde{\beta}_2)^\textrm{T}$ centered
at $\boldsymbol{\beta}$ in the source plane.

::::{grid} 1 1 2 2

:::{figure} Model_LocalPolar.svg
:label: fig-local-polar
:width: 100%
The lens plane, viewed face-on. The dashed vector
$\boldsymbol{\theta}=(\theta_1,\theta_2)$ gives the position of the
image's light centre (the small dot) relative to the lens. The local
polar co-ordinate system $(\tilde{\theta},\phi)$ is centred on this
light centre, with $\tilde\theta$ the (angular) radius and $\phi$ the
angle from the local polar axis (parallel to the global $\theta_1$
direction). The global coordinate directions $\theta_1,\theta_2$,
centred on the lens, are shown for reference.
:::

:::{figure} Model_LocalCartesian.svg
:label: fig-local-cartesian
:width: 100%
The source plane, viewed face-on. The dashed vector
$\boldsymbol{\beta}=(\beta_1,\beta_2)$ gives the position of the
source's light centre (the small dot) relative to the optical axis.
The local Cartesian co-ordinate system $(\tilde{\beta}_1,\tilde{\beta}_2)$
is centred on this light centre, parallel to the global
$\beta_1,\beta_2$ axes. The global coordinate directions
$\beta_1,\beta_2$, centred on the optical axis, are shown for
reference.
:::

::::
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
$\psi^\textrm{R}(\theta_1,\theta_2)$, from which one may derive the physical properties of the lens.

In practice the sum has to be truncated by limiting $m\le m_0$ for some $m_0$.

The roulette amplitudes are always calculated in a specific 
[Reference Point](ReferencePoint.md). In the next section we will give expressions for calculating the roulette amoplitudes.
