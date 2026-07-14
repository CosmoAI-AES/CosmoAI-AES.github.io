(critical-implementation)=
# Implementation of Critical Curves

The critical curve is the set of points $\theta$ where the determinant
of the magnification matrix $\mathcal{A}(\boldsymbol{\theta})$
vanishes.  We have
\begin{equation}
  \mathcal{A}(\boldsymbol{\theta}) 
  = 
  \begin{bmatrix}
    1 - \psi_{\theta_1\theta_1} & -\psi_{\theta_1\theta_2} \\
    -\psi_{\theta_1\theta_2} & 1 - \psi_{\theta_2\theta_2} 
  \end{bmatrix}
\end{equation}
and
\begin{equation}
  \det\mathcal{A}(\boldsymbol{\theta}) = 
    1 - \psi_{\theta_1\theta_1} - \psi_{\theta_2\theta_2} 
      + \psi_{\theta_1\theta_1}\psi_{\theta_2\theta_2}  
    + \psi_{\theta_1\theta_2}^2
\end{equation}
It is straight forward to compute this given the second
derivatives.

::: {note} Implementation v3.2.3
The current implement as of v3.2.3 defines the
critical curve as the set of points at which a
source point directly behind the lens is deflected.
This may be correct when the origin is appropriately
defined, but in general it is false.
:::

## The API

We see the critical curve as a set of points $(r,\phi)$ in
polar coordinates.
The `Lens::criticalXi( double phi )` method returns $r$ for
a given $\phi$ (`phi`).

As of v3.2.3 the implementation is incomplete.
We should have a generic, but probably slow implementation
in `Lens`, and faster implementations in subclasses where this
is possible.

## Critical Curves for Analytics Lenses

For circular lenses (SIS and Point Mass) the critical curve is a 
circle with radius $\theta_E$.
For these two lenses `criticalXi()` returns the Einstein radius.

For SIE, centred at the origin, the critical curve is given in
polar coordinates $(r,\phi)$ where
\begin{equation}
  r = \frac{\sqrt{f}\theta_E}{\sqrt{ \cos^2\phi + f^2\sin^2\phi}}
\end{equation}
where $f$ is the elliptic ratio.
This is impemented in `SIE::criticalXi()`.
  
