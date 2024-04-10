---
title: The SIE Lens
permalink: /math/SIE
usemathjax: true
---

# Sketches

Potential in polar coordinates (source?)
$$ \psi(r,\phi) = R_E\cdot \frac{\sqrt{f}}{f'}r\cdot\left[ \sin\phi\sin^{-1}(f'\cdot\sin\phi) + \cos\phi\sinh^{-1}\left(\frac{f'}{f}\cdot\cos\phi\right)\right] $$

In Cartesian coordinates, we get

$$ \psi(x,y) = R_E\cdot \frac{\sqrt{f}}{f'}\cdot\left[ 
    y\sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
    + x\sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{r}\right)
    \right] $$
where $f$ is the exentricity parameter of the ellipsoid, and
$$R_E = \frac{\xi_0}{D_L^2}$$

and $$r=\sqrt{x^2+y^2}$$


$$\frac{d}{dx}\psi(x,y) = 
  \frac{\sqrt{f}}{f'}\cdot\left[ 
    y\frac{1}{1-(f'\cdot\frac{y}{r})^2}
    \cdot
    \frac{xy}{r^3}
    +
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{r}\right) 
    +
    x\frac{1}{1+(\frac{f'}{f}\cdot\frac{x}{r})^2}
    \cdot
    \frac{y^2}{r^3}
    \right]$$
$$\frac{d}{dy}\psi(x,y) = 
  \frac{\sqrt{f}}{f'}\cdot\left[ 
    x\frac{1}{1+(\frac{f'}{f}\cdot\frac{y}{r})^2}
    \cdot
    \frac{xy}{r^3}
    +
    \sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
    +
    y\frac{1}{1-(f'\cdot\frac{y}{r})^2}\cdot\frac{x^2}{r^3}
    \right]$$


$$\frac{d}{dx}\psi(x,y) = 
  \frac{\sqrt{f}}{f'}\cdot\left[ 
    -\frac{y}{r}\frac{xy}{r^2-(f'\cdot{y})^2}
    +
    \sinh^{-1}\left(\frac{f'}{f}\cdot\frac{x}{r}\right) 
    +
    \frac{x}{r}\frac{y^2}{r^2+(\frac{f'}{f}\cdot{x})^2}
    \right]$$
$$\frac{d}{dy}\psi(x,y) = 
  \frac{\sqrt{f}}{f'}\cdot\left[ 
    -\frac{x}{r}\frac{xy}{r^2+(\frac{f'}{f}\cdot{x})^2}
    +
    \sin^{-1}\left(f'\cdot\frac{y}{r}\right) 
    +
    \frac{y}{r}\frac{x^2}{r^2-(f'\cdot{y})^2}
    \right]$$



$$\frac{d}{dx}\arcsin x = \frac{1}{\sqrt{1-x^2}}$$
$$\frac{d}{dx}\sinh^{-1} x = \frac{1}{\sqrt{1+x^2}}$$

