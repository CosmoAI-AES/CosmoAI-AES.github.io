(roulette-recursive)=
# Recursive definition of roulette amplitudes

A key element of the Roulettes formalism is recursive expressions 
developed by @10.1007/s10714-020-02677-z.
The first result is taken from their Equation (9).
This theorem is taken from @10.1007/s10714-020-02677-z Eq. (09).
As before, we use angular coordinates $\theta_i$ in the lens plane,
and write
$$
\partial_i=\frac{\partial}{\partial\theta_i}.
$$ 

::: {prf:theorem} Normann and Clarkson
The zero-order roulette amplitudes are given as
\begin{equation*}
        \alpha_1^0 = -\partial_1 \psi^\textrm{R}
	\quad\text{and}\quad
        \beta_1^0 = -\partial_2 \psi^\textrm{R}
\end{equation*}
:::


::: {prf:theorem} Normann and Clarkson
The higher-order roulette amplitudes are given as
\begin{equation*}
   \alpha_{s+1}^{m+1} = (C_+^+)_{s+1}^{m+1} (\partial_1 \alpha_s^m
    - \partial_2 \beta_s^m)
\end{equation*}

\begin{equation*}
     \beta_{s+1}^{m+1} = (C_+^+)_{s+1}^{m+1} (\partial_1 \beta_s^m
    + \partial_2 \alpha_s^m)
\end{equation*}

\begin{equation*}
   \alpha_{s-1}^{m+1} = (C_-^+)_{s+1}^{m+1} (\partial_1 \alpha_s^m
    + \partial_2 \beta_s^m)
\end{equation*}

\begin{equation*}
     \beta_{s-1}^{m+1} = (C_-^+)_{s-1}^{m+1} (\partial_1 \beta_s^m
    - \partial_2 \alpha_s^m)
\end{equation*}
where
\begin{equation*}
	(C_+^+)_s^m = 2^{\delta_{0(s-1)}} \frac{m + 1}{m + 1 + s}
	    \quad\text{and}\quad
	    (C_-^+)_s^m = 2^{-\delta_{0s}} \frac{m + 1}{m + 1 - s}
\end{equation*}
:::

The theorem is originally given by @10.1007/s10714-020-02677-z as Equations (10-13).
The astute reader may notice that amplitudes for even sums $s+m$
cannot be found through these relations.
However, the contribution from these terms are equal to zero.
In other words, one can calculate all the amplitudes needed from the aforementioned relations.

