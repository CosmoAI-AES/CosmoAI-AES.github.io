---
title: Machine Learning Examples
usemathjax: true
---

# Machine Learning Examples

## Parameter Recovery

The vanilla problem is to assume particular lens and source models, and
aim to estimate the relevant parameters.  For instance,
+ The SIS lens model has a single parameter $R_E$ (Einstein radius),
+ The spherical source model has three parameters, the size $\sigma$
  and the position $(x,y)$.
+ Additionally, there is a distance parameter $\chi$ which is the distance
  to the lens relative to the distance to the source (plane).

A simple script to generate a random dataset could be the following,
but the ranges for the random parameters should be reviewed.
As given, it will output a csv file with 300 datapoints.
```python
#! /usr/bin/env python3

import numpy as np
from random import randint

n = 300
fn = "dataset.csv"

def getline(idx):

    # Source
    sigma = randint(1,60)

    # Lens
    einsteinR = randint(10,50)
    chi = randint(30,70)

    # Polar Source Co-ordinates
    phi = randint(0,359)
    R = randint(einsteinR,100)

    # Cartesian Co-ordinates
    x = R*np.cos(np.pi*phi/180)
    y = R*np.sin(np.pi*phi/180)

    srcmode = "Spherical"
    lensmode = "SIS"
    simmode = "Raytrace"
    return f'"{idx:04}","image-{idx:04}.png",{srcmode},{lensmode},{simmode},{chi},' \
         + f'{einsteinR},{sigma},{x},{y}'

header = ( "index,filename,source,lens,model,chi,"
         + "einsteinR,sigma,x,y\n"
         )

with open(fn, 'w') as f:
    f.write(header)
    for i in range(n):
        l = getline(i+1)
        f.write(l)
        f.write("\n")
```

The command to generate the $400\times400$ images from these datapoints is
```sh
python3 CosmoSimPy/datagen.py -C -Z 400 --csvfile dataset.csv --directory images
```
The `-C` flag is important to avoid leaking information to the machine learning system.
It centres the image around the centre of mass, which is a well-definece reference point
for any image.  Without the flag, the lens is at the centre of the image, and the machine
learning model would learn to take advantage of this fact.

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
+ The relative position of the reference point `xiX` and `xiY`
+ Possibly `sigma` if we want to resimulate

**TODO** Complete this

`--xireference`

Other colums
+ `x`, `y` is the source position as in the original dataset
+ `centreX`, `centreY` position of the centre of mass in the originally
  simulated image, before centring
+ `reletaX`, `reletaY`
+ `offsetX`, `offsetY`
