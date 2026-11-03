---
title: Source Models
---

(chapter-source)=
# Source models

CosmoSim implements spherical and ellipsoid sources with 
sersic light profiles [@10.1071/as05001].
This is the most important source model for realistic scenarios.

## The Sersic index

The parameter *n* is the key to the profile's flexibility — since it
controls the shape of the light distribution:

* **n = 1**: reduces to an **exponential profile**,
  typical of galactic disks (like spiral galaxy disks)
* **n = 4**: reduces to the **de Vaucouleurs profile**,
  which closely matches the light distribution of elliptical galaxies and bulges
* **Higher n**: profile has a steep central peak (cuspy core) but very extended,
  faint outer wings
* **Lower n**: profile is flatter and more uniform,
  dropping off more sharply at large radii.

## General Ellipsoid Model

We will define the formulæ for a general ellipsoid source.
The spherical source is obtained by setting $\sigma_1=\sigma_2$.
We describe the ellipse centred at the origin in a Cartesian coordinate system,
with the major axis along the $y$-axis and the minor axis along
the $x$-axis.
This image is then rotated for the desired orientation $\lambda_S$.

+ Parameters (as used in the implementation)
    + Sersic index $n_s$ or `n_sersic`
    + luminosity $l$ or `luminosity`
    + major half-light radius $\sigma_1$ (`sigma`)
    + minor half-light radius $\sigma_2$ (`sigma2`)
+ Coefficients (currently hard-coded)
    + $b_1 = 1.992$
    + $b_0 = - 0.3271$
+ Derived quantities
    + Elliptic ratio $q = \frac{\sigma_2}{\sigma_1}$ (`q`)
    + $b = b_0 + b_1\cdot n$ (`bn`)
    + Polar radius $r = \sqrt{(x/q)^2+y^2}$  (`r`)
    + Effective radius $r_{\textrm{eff}} = \sigma_1$ (`re`)

The pixel value at position $(x,y)$ is then given as
\begin{equation}
  v_{x,y} = I_{\mathrm{eff}}\cdot\exp -b_n\cdot\bigg( \big(\frac{r}{r_{\textrm{eff}}}\big)^{\frac{1}{n_s}} - 1\bigg)
\end{equation}
where
\begin{equation}
I_{\mathrm{eff}} = 1000*l*\cdot \frac{b^{2n_s}}{2\pi\sigma_1\sigma_2\, n_s\cdot{e}^{b_n}\cdot \Gamma(2n_s)}.
\end{equation}

::: {note} Implementation
The calculation of $v_{x,y}$ is implemented as the `sersic()` function
in file `sersic.h`.
```cpp
inline double sersic( double n_sersic, double luminosity,
               double sigma1, double sigma2,
               double x, double y ) {
   auto q = sigma2/sigma1;  // Ellipticity
   auto r = std::sqrt( (x/q)*(x/q) + y*y ); // radius

   auto bn = 1.992*n_sersic - 0.3271;
   auto L = luminosity * 1000 ;

   auto re = sigma1 ; // effective radius

   auto I_eff = L*std::pow(bn, 2.0 * n_sersic)
              / (2 * pi * sigma1*sigma2*n_sersic * std::exp(bn)
              * std::tgamma(2.0*n_sersic)) ;

   auto value = round(I_eff*std::exp(-bn*((std::pow(r/re, 1.0/n_sersic))-1.0)));

   if (value > 255) { value = 255; }

   return value ;
}
```
:::

## Comments and discussion

::: {note} Proof that $r_{\textrm{eff}}$ is still the half-light radius, for any axis ratio

Set $r_{\textrm{eff}}=\sigma_1$ and $q=\sigma_2/\sigma_1$ in $\tilde r$ above, so
that the isophote $\tilde r=r_{\textrm{eff}}$ is exactly the ellipse with semi-axes
$(\sigma_1,\sigma_2)$. Substituting $u=x'/\sigma_1$, $v=y'/\sigma_2$
(Jacobian $\mathrm dx'\mathrm dy'=\sigma_1\sigma_2\,\mathrm du\,\mathrm dv$)
turns $\tilde r$ into the ordinary circular radius $\rho=\sqrt{u^2+v^2}$
in $(u,v)$-space, so

```{math}
\begin{split}
  L(\le R) = \iint_{\tilde r\le R} v(x,y)\,\mathrm dx\,\mathrm dy
  &= \sigma_1\sigma_2\iint_{\rho\le R} I_{\mathrm{eff}}\,
    \text{e}^{-b_{n_s}(\rho^{1/n_s}-1)}\,\mathrm du\,\mathrm dv
  \\&= \sigma_1\sigma_2\cdot L_{\mathrm{circ}}(\le R).
\end{split}
```
The factor $\sigma_1\sigma_2$ is common to $L(\le R)$ and to the total
$L_{\mathrm{tot}}=\sigma_1\sigma_2\cdot L_{\mathrm{circ}}(\le\infty)$,
so it cancels in the ratio:

\begin{equation}
  \frac{L(\le R)}{L_{\mathrm{tot}}} = \frac{L_{\mathrm{circ}}(\le R)}{L_{\mathrm{circ}}(\le\infty)}.
\end{equation}
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
\begin{equation}
  I_{\mathrm{eff}} = L\cdot\frac{b_{n_s}^{2n_s}}
    {2\pi\,\sigma_1\sigma_2\, n_s\, \text{e}^{b_{n_s}}\,\Gamma(2n_s)},
\end{equation}
i.e. literally the spherical-case formula with $\sigma^2\to
\sigma_1\sigma_2 = r_{\textrm{eff,circ}}^2$. This is the `I_eff` used in
the code above.

