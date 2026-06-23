---
title: Cosmological Distances
author: Ben David Normann
---

# Cosmological Distances
---
Measuring distance in a cosmological setting requires some fancy footwork. The goal of this section is to find expressions for $D_\text{LS}, D_\text{L}$ and $D_\text{S}$ in cosmological settings. In the following, let us assume a homogeneous and isotropic universe. Id est, let us assume the metric

$$
ds^2 = c^2 dt^2 - a^2(t)
\left[ d\chi^2 + f_k^2(\chi)(d\theta^2 + \sin^2\theta\, d\phi^2) \right]
$$
where $a(t)$ is the scale factor and where
$$
f_k(\chi) = 
\begin{cases}
\dfrac{1}{\sqrt{k}} \sin(\chi \sqrt{k}) & (k>0\quad,\quad\text{closed universe}), \\[1ex]
\chi & (k=0\quad,\quad\text{flat universe}), \\[1ex]
\dfrac{1}{\sqrt{-k}} \sinh(\chi \sqrt{-k}) & (k<0\quad,\quad\text{open universe}).
\end{cases}
$$
is a faactor depending on the geometry of the universe. Light follows null-geodets, $ds^2=0$. Hence, assuming travel along the radial axis, we find that 
$$
ds^2=0\quad\Rightarrow\quad d\chi=\frac{c}{a(t)}dt.
$$


## Comoving distances
The comoving distance $d_\textrm{C}$, is the distance as set by a meter stick that expands with the universe. Along the radial axis the comoving distance between an event emitting light and it being observed must be given by 
$$
d_\textrm{C}\equiv \int_{t_{\rm em}}^{t_\textrm{obs}} d\chi
$$
Inserting from the discussion in the previous section we find

$$
d_\textrm{C}\equiv \int_{t_{\rm em}}^{t_\textrm{obs}} \frac{c\,dt}{a(t)}
= \int_\textrm{obs}^z \frac{c\,dz'}{H(z')},
$$

where $H(z)$ is the Hubble parameter. It is therefore clear that the comoving distance increases as space expands, much like the distance between two dots on the surface of a balloon increases as the baloon inflates. Note that this distance is associative. Let $d_{ij}$ be the comoving distance between events $t_i$ and $t_j$, and let there be three events $t_1<t_2<t_3$. Then $d_{13}=d_{12}+d_{23}$. To integrate any further, we need an expression for $H(z)$. Such an expression naturally depends on the cosmology assumed. For a homogeneous and isotropic universe one may show that
$$
H^2(z) = H_0^2 \sum_i \Omega_{i,0}\,(1+z)^{3(1+w_i)},
$$
where $H_0$ is the Hubble parameter of today. In a universe consisting mainly of dark energy, dark matter and curvature we find
$$
H^2(z) = H_0^2 \left[ \Omega_{m,0}(1+z)^3 + \Omega_{r,0}(1+z)^4 + \Omega_{\Lambda,0} + \Omega_{k,0}(1+z)^2 \right]
$$

with current observational values (Planck 2018):

| Component | $\Omega_{i,0}$ |
|---|---|
| Matter (dark + baryonic) | $\Omega_{m,0} \approx 0.315$ |
| Radiation | $\Omega_{r,0} \approx 9.4\times 10^{-5}$ |
| Dark energy ($\Lambda$) | $\Omega_{\Lambda,0} \approx 0.685$ |
| Curvature | $\Omega_{k,0} \approx 0$ |

Note that $\sum_i \Omega_{i,0} = 1$ (flat universe), so $\Omega_{k,0}$ is consistent with zero to within observational precision. In actual calculations we see that we can set $k=\Omega_{r,0}=0.$

### Simpson's rule to get actual expressions
Define first, for convenience, the dimensionless Hubble rate
$$
E(z) \equiv \sqrt{\Omega_{m,0}(1+z)^3 + \Omega_{r,0}(1+z)^4 + \Omega_{\Lambda,0} + \Omega_{k,0}(1+z)^2},
$$

so that the comoving distance becomes 
$$
d(z) = \dfrac{c}{H_0}\int_0^{z} \dfrac{dz'}{E(z')}
$$.
Applying Simpson's rule with $n$ even subintervals of width $h = z/n$ and weights $w_i \in \{1,4,2,4,\ldots,4,1\}$,
we find

$$
d(z) \approx \frac{c}{H_0} \cdot \frac{h}{3}\sum_{i=0}^{n} \frac{w_i}{E(ih)}.
$$


## Angular-diameter distance$

The next step is to relate observed angular size to actual, comoving distance. 

:::{note}
The distances $D_\text{L}$, $D_\text{S}$ and $D_\text{LS}$ used in gravitational lensing are angular distances.
:::

If an object of physical size $\Delta w$ subtends an angle $\Delta\theta$ on the sky, the angular-diameter distance is

$$
D_\textrm{A} \equiv \frac{\Delta w}{\Delta\theta}.
$$

In the RW metric, the radius of the spatial sphere is $a(t)f_k(\chi)$, so a small arc satisfies $\Delta w = a(t)f_k(\chi)\Delta\theta$. Now, rewriting via
$$a(t)=\frac{1}{1+z}$$
and recadting $f(\chi)\to r(z)$ as a function of the redshift instead, we find 

$$
D_\textrm{A}(z) = a(t)f_k(\chi)=\frac{r(z)}{1+z},
$$
where $r(z)$ is the comiving distance in terms of redshift.

Thus $D_\textrm{A}$ is the *apparent size distance*: it accounts for the fact that objects at higher redshift were physically closer when the light was emitted, since the scale factor was smaller.
## Expressions for $D_\textrm{L}$ and $D_\textrm{S}$
We may now write down expressions for $D_\textrm{L}$ and $D_\textrm{S}$. In terms of comoving distance, we have 
$$
D_\textrm{L}=\frac{r_\textrm{L}}{(1+z_\textrm{L})}\quad\text{and}\quad D_\textrm{S}=\frac{r_\textrm{S}}{(1+z_\textrm{S})}
$$
The ratio is thus 

$$
\frac{D_L}{D_S} = \frac{(1+z_S)\,r(z_\textrm{L})}{(1+z_L)\,r(z_\textrm{S})},
$$



In the flat case ($k=0$) this reduces to CHECK THIS!

$$
\frac{D_L}{D_S} = \frac{(1+z_S)\,d_\text{L}}{(1+z_L)\,d_\text{S}}.
$$

This is as far as we get without actually calculating the comoving distances. Using the results from the comoving-distance section, we obtain the following expressions for $D_\text{L}$ and $D_\text{L}$ in terms of redshift in a flat, $\Lambda CDM$ universe:

$$
D_\text{L} = \frac{c}{H_0(1+z_\text{L})}S(z_\text{L})\quad\text{and}\quad D_\text{S} = \frac{c}{H_0(1+z_\text{S})}S(z_\text{S})
$$
where we have for simplicity defined the Simpson's sum
$$
S(z)=\frac{h}{3}\sum_{i=0}^{n}\frac{w_i}{E(i\,h)}, \qquad h = \frac{z}{n}.
$$

$$
D_S = \frac{c}{H_0(1+z_S)}\frac{h_S}{3}\sum_{i=0}^{n}\frac{w_i}{E(i\,h_S)}, \qquad h_S = \frac{z_S}{n}.
$$
Hence we have 
$$
\boxed{\frac{D_L}{D_S} = \frac{(1+z_S)}{(1+z_L)}\cdot\frac{S_\text{L}}{S_\text{S}}.}
$$
CHECK if this gets modified for $k\neq 0$.

## Expression for $D_\textrm{LS}$

Similarely, one may show that the angular-diameter distance $D_\text{LS}$ between the lens plane and source plane is given by

$$
D_\text{LS}(z_\text{L},z_\text{S}) = (1+z_\text{S})^{-1} r_\text{LS}(z_1,z_2)
$$
where 

$$
r_\text{LS} = r_\text{S}\sqrt{1-k r_\text{L}^2} - r_\text{L}\sqrt{1-k r_\text{S}^2},
$$
and $k$ is the usual curvature parameter. The redshift is accounting for the fact that the source (and lens) is no longer at the same physical distance as it was at the time of emitting the light that the observer at $z=0$ now sees. This gives

$$
(1+z_s)D_\text{LS} = (1+z_s)D_\text{S} \sqrt{1-k(1+z_\text{L})^2 D_\text{L}^2}
-(1+z_\text{L})D_\text{L} \sqrt{1-k(1+z_\text{S})^2 D_\text{S}^2},
$$
which in turn gives for a flat universe ($k=0$) that 
$$
\boxed{D_\text{LS} = D_\text{S}
-\frac{1+z_\text{L}}{1+z_\text{S}}D_\text{L},}
$$
Hence, one ought observe that even in the case of a flat universe, $D_\text{LS} \neq D_\text{S} - D_\text{L}$.

## The Einstein radius
The Einstein radius (for a circularly symmetric lens) can be expressed as

$$
\theta_E = \sqrt{\frac{M(\theta_E)}{\pi \Sigma_\text{cr} D_L^2}},
$$

where $M(\theta_E)$ is the projected mass enclosed within $\theta_E$. The critical surface density is given as
$$
\Sigma_\text{cr} = \frac{c^2}{4\pi G}\frac{D_S}{D_L D_{LS}}.
$$
Inserting the above expressions for a flat, homogeneous and isotropic universe, we find for the critical density,
 we find 
 The denominator simplifies as

$$
D_{LS} = D_S - \frac{1+z_L}{1+z_S}D_L
= \frac{c}{H_0(1+z_S)}\left(S_S - S_L\right),
$$

so that

$$
\boxed{\Sigma_\text{cr} = \frac{c\,H_0(1+z_L)}{4\pi G}\cdot\frac{S_S}{S_L(S_S - S_L)}.}
$$

The physical Einstein radius in the lens plane is now generally
$$
\xi_0 = \sqrt{\frac{4GM\,S_L(S_S - S_L)}{c\,H_0\,(1+z_L)\,S_S}}.
$$
(where $M$ as always is the mass enclosed within the Einstein radius). For the SIS-lens we now have
$$
\xi_0^{\rm SIS} = \frac{4\pi\sigma_v^2\,S_L(S_S-S_L)}{c\,H_0\,(1+z_L)\,S_S},
$$
