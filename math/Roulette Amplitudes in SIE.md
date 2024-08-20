---
title: Roulette Amplitudes for the SIE Lens
usemathjax: true
---

# Roulette Amplitudes for the SIE Lens

We define a local co-ordinate system aligned with the lens, so that
the lens orientation is $\theta=0$.  
Let $(x',y')$ be a point in the local frame, corresponding to $(x,y)$ in 
the global frame.

The calculation of roulette amplitudes takes three steps.
1.  Calculate the partial derivatives of $\psi$ with respect to
    $x'$ and $y'$ up to required order.
    This is done recursively using a CAS engine.
2.  Calculate the partial derivatives of $\psi$ with respect to
    $x$ and $y$ up to required order, using the chain rule.
3.  Calculate the roulette amplitudes $\alpha_s^m$ and $\beta_s^m$.

## First-order derivatives

In the implementation, we calculate the first order derivatives of $\psi$ as
\begin{aligned}
  \frac{\partial\psi^{\mathrm{R}}}{\partial x} &=
  C_0\frac{\sqrt{f}}{f'}\cdot
    \left(
    \cos\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\theta+y\sin\theta}{R}\right)
    -\sin\theta\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\theta+y\cos\theta}{R}\right) 
    \right)
    \\\\\\\\
  \frac{\partial\psi^{\mathrm{R}}}{\partial y} &=
  C_0\frac{\sqrt{f}}{f'}\cdot
    \left(
    \sin\theta\cdot\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x\cos\theta+y\sin\theta}{R}\right)
    +\cos\theta\cdot\sin^{-1}\left(f'\cdot\frac{-x\sin\theta+y\cos\theta}{R}\right) 
    \right)
\end{aligned}
where $\theta$ is the orientation of the lens, and
\begin{aligned}
  f' & =\sqrt{1-f^2}, 
\\\\\\\\
  C_0 & = \frac{\xi_0}{D_L^2}
\end{aligned}
For $\theta=0$, this simplifies to
\begin{aligned}
  \frac{d}{dx}\psi^{\mathrm{R}}(x,y) &=
  C_0\frac{\sqrt{f}}{f'}
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{R}\right)
\\\\\\\\
  \frac{d}{dy}\psi^{\mathrm{R}}(x,y) &= 
  C_0\frac{\sqrt{f}}{f'}
    \sin^{-1}\left(f'\cdot\frac{y}{R}\right) 
\end{aligned}

We take the same approach as we did with the raytrace equation, 
finding the roulette amplitudes first for $\theta=0$, and then 
rotating the entire system to find the amplitudes for arbitrary 
$\theta$.

## Inner differentation of the co-ordinate transformation

The local co-ordinates are given as the rotation
\begin{aligned}
   \begin{bmatrix} x' \\\\\\\\ y' \end{bmatrix}
   &=
   \begin{bmatrix}
     \cos\theta & \sin\theta \\\\\\\\
     -\sin\theta & \cos\theta 
   \end{bmatrix}
   \cdot
   \begin{bmatrix} x \\\\\\\\ y \end{bmatrix}
\end{aligned}
We can differentiate the coordinates, so get
\begin{align}
   \frac{dx'}{dx} & = \cos\theta
   \\\\\\\\
   \frac{dx'}{dy} & = \sin\theta
   \\\\\\\\
   \frac{dy'}{dx} & = -\sin\theta
   \\\\\\\\
   \frac{dy'}{dy} & = \cos\theta
\end{align}
We use this with the chain rule below.

## Step 2.  Chain rule derivation.

\begin{aligned}
   \frac{\partial^{m+n}\psi}{(\partial x)^m(\partial y)^n} =
     \sum_{i=0}^m\sum_{j=0}^n
     \binom{m}{i}\binom{n}{j}
     \cos^{m-i+j}\theta\cdot
     \sin^{n-j+i}\theta\cdot
     (-1)^i\cdot
     \frac{\partial^{m+n}\psi}{(\partial x)^{m+n-i-j}(\partial y)^{i+j}} 
\end{aligned}

## Step 3.  Roulette Amplitudes

Define
\begin{aligned}
   \Gamma^m_s &=
\begin{cases}
      0  \quad\text{if $m+s$ is even},\\\\\\\\
      -\frac{D_L^{m+1}}{2^{m+\delta_{0s}}}\binom{m+1}{\frac{m+1-s}2} \quad \text{otherwise}
\end{cases} \\\\\\\\
   \square &=  \frac{\partial^2}{(\partial x)^2}
      + \frac{\partial^2}{(\partial y)^2}
\end{aligned}
Note that $\square$ is an operator.
Then we have
\begin{aligned}
   \alpha^m_s &=
      \Gamma^m_s\square^{\frac{m+1-s}2}
      \sum_{k=0}^{\lfloor s/2 \rfloor} (-1)^k
      \binom{s}{2k}
      \frac{\partial^s\psi}{(\partial x)^{s-2k}(\partial y)^{2k}}
   \\\\\\\\
   \beta^m_s &=  
      \Gamma^m_s\square^{\frac{m+1-s}2}
      \sum_{k=0}^{\lfloor (s-1)/2\rfloor} (-1)^k
      \binom{s}{2k+1}
      \frac{\partial^s\psi}{(\partial x)^{s-2k-1}(\partial y)^{2k+1}}
\end{aligned}

In practice, we omit the $D_L$ factors, because they cancel against other factors
when the amplitudes are used in the deflection formulæ.

For implementation, we need to rewrite $\alpha_s^m$ and $\beta_s^m$
without the $\square$ operator.
We get
\begin{aligned}
   \alpha^m_s(\vec{\xi}) &=
      \Gamma^m_s
      \sum_{k=0}^{\lfloor s/2 \rfloor} (-1)^k
      \binom{s}{2k}
      \sum_{h=0}^H\binom{H}{h}
      \frac{\partial^{m+1}\psi(\vec{\xi})}
          {(\partial x)^{m+1-2k-2h}(\partial y)^{2k+2h}}
   \\\\\\\\
   \beta^m_s(\vec{\xi}) &=  
      \Gamma^m_s
      \sum_{k=0}^{\lfloor (s-1)/2\rfloor} (-1)^k
      \binom{s}{2k+1}
      \sum_{h=0}^H\binom{H}{h}
      \frac{\partial^{m+1}\psi(\vec{\xi})}
          {(\partial x)^{m-2k-2h}(\partial y)^{2k+2h+1}}
\end{aligned}
where
\begin{aligned}
  H = \frac{m+1-s}{2}
\end{aligned}

## Alternative Step 3.  Roulette Amplitudes

This uses the ECMS paper.
\begin{aligned}
   \alpha^m_s &= - \frac1{2^{\delta_{0s}}} D_\textrm{L}^{m+1}
   \sum_{k=0}^m\binom{m}{k}\left({\mathcal{C}}_s^{m(k)}\partial_{\xi_1}
                                +{\mathcal{C}}_s^{m(k+1)}\partial_{\xi_2}\right)
                      \partial_{\xi_1}^{m-k}\partial_{\xi_2}^k\psi,
   \\\\\\\\
   \beta^m_s &=-D_\textrm{L}^{m+1}\sum_{k=0}^m\binom{m}{k}\left({\mathcal{S}}_s^{m(k)}\partial_{\xi_1}+{\mathcal{S}}_s^{m(k+1)}\partial_{\xi_2}\right)\partial_{\xi_1}^{m-k}\partial_{\xi_2}^k\psi
\end{aligned}
where
\begin{aligned}
   \mathcal{C}^{m(k)}_s &= \frac{1}{\pi}\int_{-\pi}^{\pi}{\rm d}\phi\sin^k\phi\cos^{m-k+1}\phi\cos s\phi
   \\\\\\\\
   \mathcal{S}^{m(k)}_s &= \frac{1}{\pi}\int_{-\pi}^{\pi}{\rm d}\phi\sin^k\phi\cos^{m-k+1}\phi\sin s\phi
\end{aligned}
Rearranging, for the sake of implementation, we can write
\begin{aligned}
   \alpha^m_s &= - \frac1{2^{\delta_{0s}}} D_\textrm{L}^{m+1}
   \sum_{k=0}^m\binom{m}{k}\left({\mathcal{C}}_s^{m(k)}
                      \partial_{\xi_1}^{m-k+1}\partial_{\xi_2}^k\psi
                                +{\mathcal{C}}_s^{m(k+1)}
                      \partial_{\xi_1}^{m-k}\partial_{\xi_2}^{k+1}\psi
				\right)
   \\\\\\\\
   \beta^m_s &= -D_\textrm{L}^{m+1}\sum_{k=0}^m\binom{m}{k}\left(
         {\mathcal{S}}_s^{m(k)}
	 \partial_{\xi_1}^{m-k+1}\partial_{\xi_2}^k\psi
	 +
	 {\mathcal{S}}_s^{m(k+1)}
	 \partial_{\xi_1}^{m-k}\partial_{\xi_2}^{k+1}\psi
	 \right)
\end{aligned}
