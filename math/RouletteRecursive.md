(roulette-recursive)=
# Recursive definition of roulette amplitudes

\subsection{General recursive formulae}

A key element of the Roulettes formalism is recursive expressions developed in [](
https://doi.org/10.1007/s10714-020-02677-z)
for the amplitudes $\alpha_s^m$ and $\beta_s^m$.
The base case is given as,
$$
\begin{equation*}
        \alpha_1^0 = -\partial_1 \psi^\textrm{R}
	\quad\text{and}\quad

        \beta_1^0 = -\partial_2 \psi^\textrm{R}
\end{equation*}
$$
The recursive relations are given as
$$
\begin{equation*}
   \alpha_{s+1}^{m+1} = (C_+^+)_{s+1}^{m+1} (\partial_1 \alpha_s^m
    - \partial_2 \beta_s^m)
\end{equation*}
$$
$$
\begin{equation*}
     \beta_{s+1}^{m+1} = (C_+^+)_{s+1}^{m+1} (\partial_1 \beta_s^m
    + \partial_2 \alpha_s^m)
\end{equation*}
$$

$$
\begin{equation*}
   \alpha_{s-1}^{m+1} = (C_-^+)_{s+1}^{m+1} (\partial_1 \alpha_s^m
    + \partial_2 \beta_s^m)
\end{equation*}
$$
$$
\begin{equation*}
     \beta_{s-1}^{m+1} = (C_-^+)_{s-1}^{m+1} (\partial_1 \beta_s^m
    - \partial_2 \alpha_s^m)
\end{equation*}
$$
with
$$
\begin{equation*}
	(C_+^+)_s^m = 2^{\delta_{0(s-1)}} \frac{m + 1}{m + 1 + s}
	    \quad\text{and}\quad
	    (C_-^+)_s^m = 2^{-\delta_{0s}} \frac{m + 1}{m + 1 - s}
\end{equation*}
$$
The astute reader may notice that amplitudes for even sums $s+m$
cannot be found through these relations.
However, the contribution from these terms are equal to zero,
because of the factor $c_{m+s}$ in Equation \eqref{eqn:general mapping}.
In other words, one can calculate all the amplitudes needed from the aforementioned relations.

