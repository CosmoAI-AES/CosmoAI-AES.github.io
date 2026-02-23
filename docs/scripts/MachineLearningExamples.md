---
title: Machine Learning Examples
usemathjax: true
---

# Machine Learning Examples

We describe two scenarioes below.
The first one assumes a parametric lens model.  
The second one uses the roulette formalism as a parameter-free model.

## Parameter Recovery

The vanilla problem is to assume particular lens and source models, and
aim to estimate the relevant parameters.  For instance,
+ The SIS lens model has a single parameter $R_E$ (Einstein radius),
+ The spherical source model has three parameters, the size $\sigma$
  and the position $(x,y)$.
+ Additionally, there is a distance parameter $\chi$ which is the distance
  to the lens relative to the distance to the source (plane).

The machine learning problem is to estimate the columns
`chi`, `einsteinR`, `sigma`, `x`, and `y` in the CSV file from the corresponding
image files.

## Roulette Amplitude Recovery

The roulette amplitudes can be thought of as coefficients of a Taylor expansion of the lens
potential.  Thus they give a local description of the lens potential in a single point.
The hope is to use this as a parameter-free model, but the research is still in early stages.

The basic dataset can be generated as above, or more parameters can be varied,
including the choice of lens and source models.
However, when we generate the images, we need to generate the roulette
amplitudes as well.
This can be done as follows:
```python
python3 CosmoSimPy/datagen.py \
   -C -Z 800 -z 400 -D images \
   --nterms 5 --outfile roulette.csv --csvfile dataset.csv --xireference
```
This generates a new file `roulette.csv` wgucg includes the roulette amplitudes 
instead of lens parameters.

The columns we want to estimate in this scenario are
+ The roulette amplitudes `alpha[`$m$`][`$s$`]` and `beta[`$m$`][`$s$`]` 
  up to a chosen maximum $m$.
  This is the local description of the lens potential $\psi$.
+ The position of the reference point `xiX` and `xiY` relative to the
  centre of mass.
  This is the point where we have the local description of $\psi$.
+ Possibly `sigma` if we want to resimulate.  
  The position of the source is not required, as it is inferred from
  the roulette amplitudes.

The `--xireference` option tells the simulator to calculate the amplitudes
in the image of the centre of the actual source.  Without the option, 
the amplitudes are calculated in the apparent centre of mass.

Source information, including the position (`x`, `y`) are copied
from the original dataset.
Other colums of the CSV file are described under
[Roulette Formalism](/docs/model/Roulette).
