---
title: Critical Curves for The SIE Lens
usemathjax: true
---


# Critical Curves for The SIE Lens

The [SIE](SIE) lens is defined by the convergence
\begin{equation}
  \kappa(\xi_1,\xi_2)=\frac{\sqrt{f}\xi_0}{2\sqrt{\xi_1^2+f^2\xi_2^2}},
\end{equation}
where $f$ is the ratio between the minor and major axes.

According to [Kormann 1994](https://articles.adsabs.harvard.edu/cgi-bin/nph-iarticle_query?1994A&A...284..285K&classic=YES)
(**TODO** Check specific paper)
the magnification matrix for SIE now becomes
\begin{equation}
  \mathcal{A}(\boldsymbol{\theta}) 
  = 
  \begin{bmatrix}
    1 - 2\kappa\sin^2\phi &
    \kappa\sin(2\phi) 
    \\\\\\\\
    \kappa\sin(2\phi) &
    1 - 2\kappa\cos^2\phi &
  \end{bmatrix}
\end{equation}
where $(\xi,\phi)$ are the polar coordinates of the normalised screen space point
$\mathbf{x}$.
Now the critical curve is given as the points $(\xi_{\mathrm{crit}},\phi)$ given as
\begin{equation}
   \xi_{\mathrm{crit}} =
  \frac{\sqrt{f}\xi_0}{\sqrt{\cos^2\phi+f^2\sin^2\phi}},
\end{equation}
