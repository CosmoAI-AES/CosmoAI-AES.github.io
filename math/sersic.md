---
title: Sersic profiles
---

## Spherical Source with Sersic profile

The following is the actual implementation as of v3.0.0.
It calculates the value at pixel `(row,col)`.

```cpp
float re = sigma; // effective radius
float r = std::sqrt(std::pow(x, 2)+std::pow(y, 2)); //source position
float bn = 1.992*n_sersic - 0.3271;
float F = luminosity * std::pow(10, 3);
float pi = 3.141592;
float I_eff = F*std::pow(bn, 2.0 * n_sersic)
            / ( 2 * pi * std::pow(re, 2.0) * n_sersic * std::exp(bn) 
              * std::tgamma(2.0 * n_sersic));
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

The lumonosity is given here as $L$ (`F` in the code) which 
is 1000 times the input parameter `luminosity`.
We can then define the value of pixel $(x,y)$ as
$$v_{x,y} = I_{\mathrm{eff}}\cdot
    \text{e}^{-b_n\big(\big(\frac{r}{\sigma}\big)^{\frac{1}{n_s}}-1\big)}$$
where

$$
\begin{equation*}
  b_n  = 1.992n_s - 0.3271
\end{equation*}
$$
$$
\begin{equation*}
    r  = \sqrt{x^2+y^2} 
\end{equation*}
$$
$$
\begin{equation*}
I_{\mathrm{eff}} =  L\cdot \frac{b_n^{2n_s}}{2\pi\sigma^2n_s\text{e}^{b_n}\cdot \Gamma(2n_s)}
\end{equation*}
$$

The model is taken from [](doi:10.1071/as05001). The parameter *n* is the key to the profile's flexibility — since it controls the shape of the light distribution:

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
+ effective radius $r_{\textrm{eff}} = 10\sigma_1$ (see `CHECK` in the code below)
+ $r = \sqrt{(x/q)^2+y^2}$
+ $b = b_0 + b_1\cdot n$

The pixel value is given as
$$v = I_{\mathrm{eff}}\cdot\exp -b\cdot\bigg( \big(\frac{r}{r_{\textrm{eff}}}\big)^{\frac{1}{n}} - 1\bigg)$$
where, as in the spherical case but with $\sigma^2\to\sigma_1\sigma_2$,
$$I_{\mathrm{eff}} = L\cdot \frac{b^{2n}}{2\pi\sigma_1\sigma_2\, n\,\text{e}^{b}\cdot \Gamma(2n)}.$$
See [](#sersic-elliptic-general) for the general recipe (arbitrary $n$
and position angle), including the proof that $r_{\textrm{eff}}$ is the half-light
radius for any axis ratio $q$ -- this holds for whatever value $r_{\textrm{eff}}$
is actually given, including the current $r_{\textrm{eff}}=10\sigma_1$; it just
means the half-light ellipse currently has semi-axes
$(10\sigma_2,10\sigma_1)$ rather than $(\sigma_1,\sigma_2)$.

The code is given as

```cpp
auto q = sigma2/sigma1;
int n = 4;  // Sersic index
auto re = 10*sigma1; // effective radius
// CHECK: this factor of 10 means the half-light ellipse (where r==re)
// actually has semi-axes (10*sigma2, 10*sigma1), not (sigma1, sigma2).
// If sigma1/sigma2 are meant to *be* the half-light semi-axes, this
// looks like a bug or a leftover unit conversion -- kept as-is for now
// since it matches the current implementation; revisit once confirmed.
auto r = std::sqrt(std::pow(x/q, 2)+std::pow(y, 2));
auto bn = 1.992*n - 0.3271;
auto F = luminosity * std::pow(10, 3);
auto pi = 3.141592;
auto I_eff = F*std::pow(bn, 2.0*n)
           / (2*pi*sigma1*sigma2*n*std::exp(bn)*std::tgamma(2.0*n));
auto value = round(I_eff*std::exp(-bn*((std::pow(r/re, 1.0/n))-1.0)));
if (value > 255) { value = 255; }
dst.at<uchar>(row, col) = (uchar)value;
```

(sersic-elliptic-general)=
## General elliptical Sersic profile

The hard-coded implementation above fixes $n=4$ and only handles
ellipses aligned with the $(x,y)$ axes. This section gives the general
recipe: arbitrary Sersic index $n_s$, an arbitrary position angle, and a
luminosity normalisation consistent with the spherical case.

### Rotating into the ellipse's own axes

[**TODO** Do we need this section HG?] If the ellipse is rotated by a position angle $\lambda$ relative to the
$x$-axis (same convention as $\lambda_L$/$\theta$ in the
[SIE lens](SIE.md)), first rotate into the ellipse's own frame:
$$
\begin{equation*}
  x' = (x-x_0)\cos\lambda + (y-y_0)\sin\lambda
\end{equation*}
$$
$$
\begin{equation*}
  y' = -(x-x_0)\sin\lambda + (y-y_0)\cos\lambda
\end{equation*}
$$
If the source is always axis-aligned, as in the current implementation,
this step is skipped and $(x',y')=(x-x_0,y-y_0)$.

### Elliptical radius

Replace the circular radius $r=\sqrt{x'^2+y'^2}$ with an *elliptical
radius*, using the axis ratio $q=\sigma_2/\sigma_1\le 1$:
$$
\begin{equation}
  \tilde r = \sqrt{x'^2+(y'/q)^2}.
\end{equation}
$$
This is exactly what the hard-coded code above already does for the
axis-aligned case (with $y'=y$ playing the role of the unscaled axis).
The pixel value is then given by the *same* 1D formula as the
spherical case, with $r\to\tilde r$ and general $n_s$:
$$
\begin{equation}
  v(x,y) = I_{\mathrm{eff}}\cdot
  \text{e}^{-b_{n_s}\left(\left(\tilde r/r_{\textrm{eff}}\right)^{1/n_s}-1\right)},
  \qquad b_{n_s}=1.992\,n_s-0.3271.
\end{equation}
$$


:::{note}{Proof that $r_{\textrm{eff}}$ is still the half-light radius, for any axis ratio}

Set $r_{\textrm{eff}}=\sigma_1$ and $q=\sigma_2/\sigma_1$ in $\tilde r$ above, so
that the isophote $\tilde r=r_{\textrm{eff}}$ is exactly the ellipse with semi-axes
$(\sigma_1,\sigma_2)$. Substituting $u=x'/\sigma_1$, $v=y'/\sigma_2$
(Jacobian $\mathrm dx'\mathrm dy'=\sigma_1\sigma_2\,\mathrm du\,\mathrm dv$)
turns $\tilde r$ into the ordinary circular radius $\rho=\sqrt{u^2+v^2}$
in $(u,v)$-space, so

$$
\begin{equation}
  L(\le R) = \iint_{\tilde r\le R} v(x,y)\,\mathrm dx\,\mathrm dy
  = \sigma_1\sigma_2\iint_{\rho\le R} I_{\mathrm{eff}}\,
    \text{e}^{-b_{n_s}(\rho^{1/n_s}-1)}\,\mathrm du\,\mathrm dv
  = \sigma_1\sigma_2\cdot L_{\mathrm{circ}}(\le R).
\end{equation}
$$
The factor $\sigma_1\sigma_2$ is common to $L(\le R)$ and to the total
$L_{\mathrm{tot}}=\sigma_1\sigma_2\cdot L_{\mathrm{circ}}(\le\infty)$,
so it cancels in the ratio:

$$
\begin{equation}
  \frac{L(\le R)}{L_{\mathrm{tot}}} = \frac{L_{\mathrm{circ}}(\le R)}{L_{\mathrm{circ}}(\le\infty)}.
\end{equation}
$$
This is exactly the same enclosed-flux fraction as in the spherical
case at the same $R$ -- and since $b_{n_s}$ is defined so that this
fraction is $1/2$ at $R=r_{\textrm{eff}}$ in the circular case, it is also $1/2$ at
$R=r_{\textrm{eff}}$ here, **for every axis ratio $q$**. So $\tilde r=r_{\textrm{eff}}$
(i.e. the ellipse with semi-axes $\sigma_1,\sigma_2$) always encloses
exactly half of the total light, regardless of ellipticity. 

A single scalar is still convenient for describing "how big" a source
is independent of orientation and axis ratio -- for that, the
**circularised** effective radius
$r_{\textrm{eff,circ}}=\sqrt{\sigma_1\sigma_2}$ is the natural choice: it
is the radius of the circle with the same *area* as the half-light
ellipse. Use it for reporting/logging a source's size, but note it is
a *derived* quantity here, not a substitute for $\sigma_1$ inside
$\tilde r$ -- plugging $r_{\textrm{eff,circ}}$ into $\tilde r$ in place
of $\sigma_1$ (while keeping the same $q$) would trace a *different*
ellipse, not $(\sigma_1,\sigma_2)$.
:::


### Luminosity normalisation

An ellipse with semi-axes $\sigma_1,\sigma_2$ has area
$\pi\sigma_1\sigma_2$, in place of the circle's $\pi\sigma^2$. The
$I_{\mathrm{eff}}$ normalisation therefore becomes
$$
\begin{equation}
  I_{\mathrm{eff}} = L\cdot\frac{b_{n_s}^{2n_s}}
    {2\pi\,\sigma_1\sigma_2\, n_s\, \text{e}^{b_{n_s}}\,\Gamma(2n_s)},
\end{equation}
$$
i.e. literally the spherical-case formula with $\sigma^2\to
\sigma_1\sigma_2 = r_{\textrm{eff,circ}}^2$. This is the `I_eff` used in
the code above.

