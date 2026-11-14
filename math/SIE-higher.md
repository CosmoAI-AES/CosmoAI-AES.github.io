---
title: Proof for the SIE derivatives 
---

(proof-sie-higher)=
# Proof for the SIE derivatives 


In order to prove [](#theorem-sie-higher), we 
will need the following lemmata.

(lemma-derg)=
::: {prf:lemma}
If $g(x,y)$ has the form in [](#SIE_form), then the
derivatives can be written on the form
```{math}
\frac{\partial g(x,y)}{\partial x} = 
\frac{g_1(x,y)}{R^2R'}
\\
\frac{\partial g(x,y)}{\partial y} =
\frac{g_2(x,y)}{R^2R'}
```
where $g_1$ and $g_2$ have the form of [](#SIE_form).
:::

::: {prf:proof}
We differentiate term by term, so it suffices to show that
each term gives a derivative on the right form.
Each term is differentiated using the product rule.
Differentiating the factors $x^i$, $x'^k$, and $y'^k$ clearly
give monomials of form of [](#SIE_form), which can be multiplied
by $R^2R'$ to give the required form for the lemma.

The tricky part is the square root expressions of $R$ and $R'$,
where the chain rule gives a non-polynomial factor.
For instance,
```{math}
\frac{\partial R^p}{\partial x} =
   pR^{p-1} \frac{\partial R}{\partial x} =
   pR^{p-1} \frac{x}{R}.
```
However, multiplying this by $RR'$ we can write
```{math}
\frac{\partial R^p}{\partial x} =
   \frac{pxR^pR'}{R^2R'},
```
as required.
The same can be done for $R'$ and for differentiation with
respect to $y$.
:::

::: {prf:lemma}
If $g(x,y)$ and $h(x,y)$ have the form in [](#SIE_form), 
then so has $f(x,y)=g(x,y)\cdot h(x,y)$.
:::

::: {prf:proof}
Since $g$ and $h$ are polynomials, so is their product.
:::

::: {prf:lemma}
We have
```{math}
\begin{aligned}
    \frac{\partial}{\partial x} R^2R'
    = \frac{2R^2R'^2x + R^4x}{R^2R'}
\end{aligned}
```
and
```{math}
\begin{aligned}
    \frac{\partial}{\partial y} R^2R'
    = \frac{2R^2R'^2y + R^4y}{R^2R'}
\end{aligned}
```
:::

::: {prf:proof}
We have
```{math}
\begin{aligned}
    \frac{\partial}{\partial x} R^2R'
    & = 2RR'\frac{x}{R} 
    + R^2\frac{x'}{R'}\frac{\partial x'}{\partial x}
    + R^2\frac{y'}{R'}\frac{\partial y'}{\partial x}
    \\&= 2R'x
    + R^2\frac{x'}{R'}\cos\lambda_L
    - R^2\frac{y'}{R'}\sin\lambda_L
    \\&= 2R'x
    + \frac{R^2}{R'}x
    \\&= \frac{2R^2R'^2x + R^4x}{R^2R'}
\end{aligned}
```
and
```{math}
\begin{aligned}
    \frac{\partial}{\partial y} R^2R'
    & = 2RR'\frac{y}{R} 
    + R^2\frac{x'}{R'}\frac{\partial x'}{\partial y}
    + R^2\frac{y'}{R'}\frac{\partial y'}{\partial y}
    \\& = 2R'y
    + R^2\frac{x'}{R'}\sin\lambda_L
    + R^2\frac{y'}{R'}\cos\lambda_L
    \\& = 2R'y
    + \frac{R^2}{R'}y
    \\&= \frac{2R^2R'^2y + R^4y}{R^2R'}
\end{aligned}
```
which gives the lemma.
:::

::: {prf:proof} of [](#theorem-sie-higher)
The proof is by mathematical induction on $i$ and $j$.
The base case follows from [](#theorem-sie-second) as discussed
above.

If $i>0$, we assume that it holds for $i-1$ and differentiate with
respect to $x$.
If $i=0$, we assume that it holds for $j-1$ and differentiate with
respect to $y$.

We write
```{math}
\begin{aligned}
    \frac{\partial}{\partial x}
    \frac{g(x,y)}{(R^2R')^t}
    & = \frac{\frac{\partial}{\partial x}g(x,y)(R^2R')^{t}
             - t(R^2R')^{t-1} \big(\frac{\partial}{\partial x} R^2R'\big)g(x,y)}
        {(R^2R')^{2t}}
    \\ & = \frac{\frac{\partial}{\partial x}g(x,y)(R^2R')^{2}
             - t\big(2R^2R'^2x + R^4x\big)g(x,y)}
        {(R^2R')^{t+2}}
\end{aligned}
```
Using the notation of [](#lemma-derg), we get
```{math}
\begin{aligned}
    \frac{\partial}{\partial x}
    \frac{g(x,y)}{(R^2R')^t}
    & = \frac{g_1(x,y)(R^2R')
             - t\big(2R^2R'^2x + R^4x\big)g(x,y)}
        {(R^2R')^{t+2}}
\end{aligned}
```
Now each term of the numerator has the required form because it is a product 
of polynomials of the required form.
The denominator is also as required with the exponent increased by two.

The derivative with respect to $y$ can be shown in the same way.
:::

