
`Lens::getXi`

This function calculates the apparent position $\xi$
in the lens plane, given the actual position $\chi\eta$.
There are three approaches.

+ The SIS lens has constant deflection, and hence the raytrace
  equation can be used.
    + $\xi = \chi\eta + \nabla\psi(\chi\eta)$
    + The same formula applies to SIE, because the direction from
      the lens is known, and the deflection does not depend on the
      distance from the centre.
+ The point mass lens gives a quadratic equation whose solution is
    + $\chi\eta/2 + \sqrt{\frac14+R_E^2}\cdot\frac{\chi\eta}{||\chi\eta||}$
+ The universal solution is to use fix-point iteration to find the
  solution numerically
