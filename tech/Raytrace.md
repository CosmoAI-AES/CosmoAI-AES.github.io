(raytrace-implementation)=
# Implementation of Raytrace Support

The `Lens` class provides three functions to represent the
lens potential $\psi^$.
+ `psiValue( double, double )` evaluates $\psi^R(\theta_1,\theta_2)$
+ `psiXvalue( double, double )` evaluates 
   $\frac{\partial\psi^R}{\partial \theta_1}(\theta_1,\theta_2)$
+ `psiYvalue( double, double )`
   $\frac{\partial\psi^R}{\partial \theta_2}(\theta_1,\theta_2)$

For subclasses of `PsiFunctionLens` each of these are hard-coded
for the specific lens model.
For `SampledPsiFunctionLens` each function looks up the value in
a sampling matrix which is computed when the lens is instantiated.
The lens object is intantiated with an instance of `PsiFunctionLens`
which is used for the sampling.
The derivates are computed with a Sobel filter.

The Raytrace Model depends on the last two to compute the distortion.



