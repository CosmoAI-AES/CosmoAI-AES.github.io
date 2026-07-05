---
title: Lens API
theme: minima
usemathjax: true
---

+ Forward raytrace.
    + `double Lens::psiXvalue( double x, double y ) const `
    + `double Lens::psiYvalue( double x, double y ) const `
+ Inverse raytrace
    + `cv::Point2d Lens::getXi( cv::Point2d chieta )`
      returns the apparent position $\xi$ corresponding to actual position 
      $\chi\eta$ (`chieta`).
      This is primarily used to find the reference point for the roulette formalism.
        + Co-ordinates are in the lens plane to be totally independent of the source.
        + See [calculation](/math/getXi)
+ Lens potential
    + `double Lens::psiValue( double x, double y ) const `
      is used primarily for sampling to create `SampledLens` models
      from `PsiFunctionLens` models.
+ Roulette formalism
    + `void Lens::calculateAlphaBeta( cv::Point2d xi, int m ) `
      calculates the roulette amplitudes in the given point `xi` up the
      given order `m`
    + `double Lens::getAlphaXi( int m, int s ) `
    + `double Lens::getBetaXi( int m, int s ) `
    + `double Lens::getAlpha( cv::Point2d xi, int m, int s ) `
    + `double Lens::getBeta( cv::Point2d xi, int m, int s ) `
+ Debugging and diagnostics
    + `std::string Lens::idString() ` returns a string to identify the lens model.
      This is intended for use in debugging output
+ Caustics and Critical Curves (under construction)
    + `double Lens::criticalXi( double phi ) const `
    + `cv::Point2d Lens::caustic( double phi ) const `
