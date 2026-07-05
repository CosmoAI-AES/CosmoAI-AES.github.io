(getXi)=
# Apparent position

Roulette amplitudes are normally calculated in the apparent
position $\nu$ of the source.
The known parameter is the actual position $\eta$, while 
$\nu$ has to be computed.
There are three approaches.

+ The SIS lens has constant deflection, and hence the raytrace
  equation can be used.
    + $\nu = \chi\eta + \nabla\psi(\chi\eta)$
+ The point mass lens gives a quadratic equation whose solution is
    + $\chi\eta/2 + \sqrt{\frac14+R_E^2}\cdot\frac{\chi\eta}{||\chi\eta||}$
+ The universal solution is to use fix-point iteration to find the
  solution numerically

::: {note} Implementation
The fix point iteration is implemented in `Lens::getXi`.
Lens models where an analytic solution is known, may override
this in subclasses.
:::
