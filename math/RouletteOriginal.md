(roulette-original)=
# Original definition of roulette amplitudes

The original derivation of the roulette amplitudes $\alpha_s^m$ and $\beta_s^m$
is given by @10.1088/0264-9381/33/24/245003 in equations (93-94) for $s=0$ and
in (109-112) for $s>0$.
The two cases are combined into one by @10.1007/s10714-020-02677-z
(Eq. (5-6)).
Adapting their formulæ to our notation, we get the following definition.

(def-roulette-original)=
::: {prf:definition} Roulette Formalism
The roulette amplitudes $\alpha_s^m$ and $\beta_s^m$ are defined as
$$
\begin{aligned}
\alpha_s^m &= - \frac{1}{2^{\delta_{0s}}}
\sum_{k=0}^m\binom{m}{k}
  \left(\mathcal{C}_s^{m(k)}\partial_1+\mathcal{C}_s^{m(k+1)}\partial_2\right)
\partial_1^{m-k}\partial_2^k\psi^\textrm{R}
\\
   \mathcal{C}_s^{m(k)} &=\frac{1}{\pi}\int_{-\pi}^{\pi}{\rm d}\phi\sin^k\phi\cos^{m-k+1}\phi\cos s\phi
\\
   \beta_s^m &=-\sum_{k=0}^m\binom{m}{k}\left({\mathcal{S}}_s^{m(k)}\partial_1+{\mathcal{S}}_s^{m(k+1)}\partial_2\right)\partial_1^{m-k}\partial_2^k\psi^\textrm{R}
\\
   \mathcal{S}_s^{m(k)} &=\frac{1}{\pi}\int_{-\pi}^{\pi}{\rm d}\phi\sin^k\phi\cos^{m-k+1}\phi\sin s\phi.
\end{aligned}
$$
where $\theta_i$ are angular co-coordinates in the lens plane (cf. [](#fig-local-cartesian)),
and
$$
\partial_i=\frac{\partial}{\partial\theta_i}.
$$ 
:::
