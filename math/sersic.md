---
title: Ellipsoid Source with Sersic profile
usemathjax: true
---

# Ellipsoid Source with Sersic profile

One of the most popular source models is an ellipsoid with
sersic profile.
In our implementation, this individual sources are defined by
two size parameters, $\sigma_1$ and $\sigma_2$, for the minor
and major axes of the ellipsoid.

Additionally some parameters are currently hard-coded.
+ The Sersic index $n=4$
+ Coefficients $b_1 = 1.992$, $b_0 = - 0.3271$

We define
+ elliptic ratio $q = \frac{\sigma_2}{\sigma_1}$
+ effective radisu $r_e = 10\sigma_1$
+ $r = \sqrt{(x/q)^2+y^2}$
+ $b = b_0 + b_1\cdot n$

The pixel value is given as
$$v = \exp -b\cdot\bigg( \big(\frac{r}{r_e}\big)^{\frac{1}{n}} - 1\bigg)$$
