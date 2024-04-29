---
title: Lens Potential and Basic Notation
usemathjax: true
---

# Lens Potential and Basic Notation

**Under construction**

![Geometric model as described in the text](observer.png)

We assume a flat sky, so that the source is contained in a plane $S$
at distance $D_S$ from the observer, and the lens in a plane $L$ at
distance $D_L$ from the observer.
The optical axis is the line from the observer through the lens.
The planes $S$ and $L$ are orthogonal on the optical axis, and have
origin in the intersection therewith.

We consider a single source point at $\boldsymbol{\eta}_S$ in $S$.
The apparent position, as seen by the observer, is at $\nu_S$ and
\begin{equation}
  \Delta\boldsymbol{\eta}_S = \boldsymbol{\nu}_S - \boldsymbol{\eta}_S
\end{equation}
The apparent position in the lens plane $L$ is called
\begin{equation}
  \boldsymbol{\xi} = \frac{D_L}{D_S} \boldsymbol{\nu}_S.
\end{equation}


The deflection is most easily described in terms of angles, so 
we define $\beta$ and $\theta$ as the angles between 
the optical axis and respectively 
$\boldsymbol{\eta}_S$ and $\boldsymbol{\nu}_S$.
The deflection angle $\hat\alpha$ is the angle between 
the actual and apparent source in the source plane as seen
from the apparent image in the lens plane.
With the flat sky approximation, we have[^hatalpha],

\begin{equation}
  \alpha = \frac{D_{LS}}{D_S} \hat\alpha
\end{equation}
where $\alpha=\theta-\beta$ as the angle between
$\boldsymbol{\eta}_S$ and $\boldsymbol{\nu}_S$ as seen
from the observer.




The convergence, or dimensionless projected surface-mass density, is given
as a function $\kappa$, which is related to $\psi$ as follows:
\begin{equation}
  \kappa(X,Y)= \frac12D_L^2\left(\psi_{xx}(X,Y) + \psi_{yy}(X,Y)\right)
\end{equation}

[^hatalpha]: 
    This is seen because $D_S\alpha$ and $D_{LS}\hat\alpha$ are the lengths 
    of arcs between the actual and apparent source, and for small
    angles they are both approximately equal to the straigh line
    $\Delta\boldsymbol{\eta}_S$.
