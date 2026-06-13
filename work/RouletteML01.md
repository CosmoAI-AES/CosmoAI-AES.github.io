---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.19.3
kernelspec:
  name: python3
  display_name: Python 3 (ipykernel)
  language: python
---

# CosmoSim for Machine Learning Demo I

+ 0.04" per pixel (arc seconds per pixel)




+ SiE/Sersic
+ 2x / 4x SIE cluster with one source
+ Test expansion in origin ($\xi$)
+ check loss def - is it normalised
+ check NaN values for $\beta$

This is based on a sketch by Ben David March 2026.

1.  Choose the Einstein radius uniformly at random, so that
    $0.1"\le\theta_E\le3.0"$.
    + where $\theta_E$ is the Einstein radius in angular units.
3.  Choose the source position inside or around the critical curve,
    For example, choose the polar coordinates $(R,\phi)$
    + so that $R\le c\theta_E$ for some constant $C$, e.g. $c=1.2$.
    + $\phi$ chosen uniformly at random
4.  Choose the orientation of the elliptical lens uniformly at random.
5.  Choose the orientation of the elliptical source uniformly at random.
6.  CHoose the ellipticity $f$ of the lens uniformly at random, so
    that $0.6\le f\le 0.9$.
7.  Source parameters - sersic profile
    + size: $2\le\sigma\le5$
    + sersic index  $1\le n_s\le 5$
    + luminosity  $10\le l\le 20$, exponentially distributed
      with $\lambda=2.0$ (see below)

