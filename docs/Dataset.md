---
title: Sample Datasets
---

# Sample Datasets

Hezaveh uses $192\times192$ image size with a pixel size of 0.04"
(seconds of arc).
This seems to be a reasonable choice to follow.

::: {note} Image Size
In early experiments, we used an image size of $512\times512$
in CosmoSim, but this requires more that 50Gb of GPU memory
for machine learning.
We have made successful tests using $256\times256$.
:::

## Proposed Selection Algorithm

This is based on a sketch by Ben David March 2026.

1.  Choose the Einstein radius uniformly at random, so that
    $0.1"\le\theta_E\le3.0"$.
    + where $\theta_E=R_E/\chi$, i.e. $R_E$ converted to angular units.
2.  Restrict such that $\Delta\beta\le\theta_E$.
    + **TODO** what is $\Delta\beta$?
3.  Choose the source position inside or around the critical curve,
    For example, choose the polar coordinates $(R,\phi)$ 
    + so that $R\le c\theta_E$ for some constant $C$, e.g. $c=1.2$.
    + $\phi$ chosen uniformly at random
4.  Choose the orientation of the elliptical lens uniformly at random.
5.  Choose the orientation of the elliptical source uniformly at random.
6.  CHoose the ellipticity $f$ of the lens uniformly at random, so
    that $0.6\le f\le 0.9$.
7.  Source parameters - sersic profiel
    + size: $2\le\sigma5$
    + sersic index  $1\le n_s\le 5$
    + luminosity  $10\le l\le 20$, exponentially distributed
      with $\lambda=2.0$ (see below)

## Proposal from Oda

| Parameter | Hezaveh (arcsec) | CosmoSim (512x512) |
| :-        | :-               | :-                 |
| $R_E$     | $0.1"\ldots3.0"$     | $1\ldots 39$ (resiprocal) |
| Lens Ellipticity | $0\ldots0.9$     | $1.0\ldots 0.1$ (resiprocal) |
| Source Size | $0.05"\ldots0.8"$ | $1\ldots10$ |
| Source Position ($R$) | not specified | $1\ldots10$ |
| $\chi$ | not specified | 50 |
| Lens rotation ($\theta$) | not specified | $0°\ldots 179°$ |
| Source rotation ($\phi$) | not specified | $0°\ldots 359°$ |
| Sersisk indeks (`n_sersic`) | N/A | $1\ldots5$ |
| Luminosity | N/A | $10\ldots20$[^exp] |

[^exp]: Luminosity is exponentially distributed with $\lambda=2.0$.

The exponential distribution used for luminsoty returns
$u = 1 - \exp{-\lambda\cdot x}$ where 
$x$ is exponentially distributed, that is with a probability 
density function $f(x;\lambda) = \lambda\exp{-\lambda x}$
for positive $x$.  
This $u$ is scaled to within the given range.


