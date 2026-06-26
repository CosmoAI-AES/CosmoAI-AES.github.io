---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.19.4
kernelspec:
  name: python3
  display_name: Python 3 (ipykernel)
  language: python
---

# Custom Amplitudes Files

The critical element of roulettes simulation is the calculation of roulette
amplitudes.
The simulator using analytic formulæ (`PsiFunctionLens`) takes a text file
with pre-computed formulæ which are evaluated for the special case being
simulated.
Default files are included in the package, but it is possible to supply
custom file, as we will demonstrate below.

See [](/tech/Roulette Implementation) for more information about the
calculation.

## Preparation

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
import toml
from copy import deepcopy

import CosmoSim as cs
from CosmoSim import CosmoSim, Parameters
from CosmoSim.datagen import SimImage
import CosmoSim.Image as csimg

print( "CosmoSim version:", cs.__version__ )
```

## Baseline

We can define the configuration as a dict using the nested (TOML) structure.
We will use the standard roulette simulator and the SIS lens with the same
parameters throughout.  The only thing we will change is the amplitudes file.
We start with the default.

```{code-cell} ipython3
cfg = { 'simulator' : { "model" : "Roulette", "nterms" : 10, "cropsize" : 256 }
      , 'lens': { 
            'mode' : "SIS",
            'einsteinR': 46 }
      , 'source': {
            'mode': 'SersicSphere',
            'sigma': 20,
            'theta': 45,
            'luminosity' : 70,
            'position': 'cartesian'}
      , 'position': {'x': 11.01, 'y': 0.31}
      }
param = Parameters(cfg)
```

```{code-cell} ipython3
sim01 = SimImage( param, verbose=0 )
im01 = sim01.getImage()
csimg.imshow( im01, title="Default")
```

```{code-cell} ipython3
raycfg = deepcopy(cfg)
raycfg["simulator"]["model"] = "Raytrace"
rayparam = Parameters( raycfg )
raysim = SimImage( rayparam, verbose=0 )
rayim = raysim.getImage()
csimg.imageCompare( im01, rayim, "Baseline", 'Raytrace')
```


## Rational numbers

There is a bug up until v3.0 where certain constants are computed
as floating point numbers, and not rational numbers.
The first thing we want to check is if a change to rational numbers
will change or improve the simulation.

+ [sis20.txt](./sis20.txt)

```{code-cell} ipython3
param["lens"]["amplitudefile"] = "sis20.txt"

sim02 = SimImage( param, verbose=0 )
im02 = sim02.getImage()
csimg.imageCompare( im02, im01, "Rational numbers", 'Baseline')
csimg.imageCompare( im02, rayim, "Rational numbers", 'Raytrace')
```

## SIE style calculation

+ [sis10sie.txt](./sis10sie.txt)

```{code-cell} ipython3
param["lens"]["amplitudefile"] = "sis10sie.txt"

sim03 = SimImage( param, verbose=0 )
im03 = sim03.getImage()
csimg.imageCompare( im03, im01, "SIE style", 'Baseline')
csimg.imageCompare( im03, rayim, "SIE style", 'Raytrace')
```

