---
title: Sersic profiles
usemathjax: true
---

## Spherical Source with Sersic profile

The following is the actual implementation as of v3.0.0.
It calculates the value at pixel `(row,col)`.

```c++
float re = sigma; // effective radius
float r = std::sqrt(std::pow(x, 2)+std::pow(y, 2)); //source position
float bn = 1.992*n_sersic - 0.3271;
float F = luminosity * std::pow(10, 3);
float pi = 3.141592;
float I_eff = F*std::pow(bn, 2.0 * n_sersic)/(2 * pi * std::pow(re, 2.0) * n_sersic * std::exp(bn) * std::tgamma(2.0 * n_sersic));
float value = round(I_eff*std::exp(-bn*((std::pow(r/re, 1.0/n_sersic))-1.0)));
if (value > 255) { value = 255; }
dst.at<uchar>(row, col) = (uchar)value;
```

The above code uses two indexing systems.  
The point being drawn is $(x,y)$ in a Cartesian co-ordinate
system with the origin in the centre of the lens.
The pixel is addressed using matrix indexing (`row`,`col`).
The translation between the two is not shown here, and we
will refer only to $(x,y)$ when we translate the code into
algenbra.

The lumonosity is given here as $L$ which is 1000 times the
input parameter `luminosity`.
We can then define the value of pixel $(x,y)$ as
$$v_{x,y} = I_{\mathrm{eff}}\cdot
    \text{e}^{-b_n\big(\big(\frac{r}{\sigma}\big)^{\frac{1}{n_s}}-1\big)}$$
where
$$
\begin{align}
  b_n & = 1.992n_s - 0.3271 \\
    r & = \sqrt{x^2+y^2}  \\
I_{\mathrm{eff}} & =  L\cdot \frac{b_n^{2n_s}}{2\pi\sigma^2n_s\text{e}^{b_n}\cdot \Gamma(2n_s)}
\end{align}
$$

The parameter *n* is the key to the profile's flexibility — since it controls the shape of the light distribution:

* **n = 1**: reduces to an **exponential profile**, typical of galactic disks (like spiral galaxy disks)
* **n = 4**: reduces to the **de Vaucouleurs profile**, which closely matches the light distribution of elliptical galaxies and bulges
* **Higher n**: profile has a steep central peak (cuspy core) but very extended, faint outer wings
* **Lower n**: profile is flatter and more uniform, dropping off more sharply at large radii.



## Ellipsoid Source with Sersic profile

We have hardcoded an implementation of an elliptic profile, namely the de Vaucouleurs' profile.
In our implementation, this individual source is defined by
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

The model is taken from [](https://arxiv.org/pdf/astro-ph/0503176).
