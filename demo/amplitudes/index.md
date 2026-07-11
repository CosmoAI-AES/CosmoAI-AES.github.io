# Amplitude calculation

These demos are only for those who want to study the numerical and symbolic
calculation of roulette amplitudes.  They have been created as part of the
debugging and validation of the roulette calculations from v3.0 to v3.2.

+ [](AmplitudeFile.ipynb) show how to use custom files with algebraic expressions
  for the roulette amplitudes.  It also discusses some of the variants tried
  in v3.0-v3.2.
+ By default CosmoSim calculates roulette amplitudes in double precision in the C++
  library.  It is also possible to compute in arbitrary precision.  These two
  demos show how, and compare the approaches.
    + [](Pointmass.ipynb)
    + [](SIS.ipynb)
