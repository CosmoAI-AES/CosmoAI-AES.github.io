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

# The Point Mass Lens

This demo will demonstrate that the different simulation modes for Point Mass
lenses are consistent.
It may be useful also to look at [](/v3.1/PointMass.ipynb) which also includes
the closed form simulators in CosmoSim v3.1.

## Preparation

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
import toml
from copy import deepcopy

import CosmoSim as cs
from CosmoSim import Parameters
from CosmoSim.datagen import SimImage
import CosmoSim.Image as csimg

print( "CosmoSim version:", cs.__version__ )
```

## Raytrace

We can define the configuration as a dict using the nested (TOML) structure.

```{code-cell} ipython3
cfg = { 'simulator' : { "model" : "Raytrace", "nterms" : 10, "cropsize" : 256 }
      , 'lens': { 
            'mode' : "PM",
            'einsteinradius': 46 }
      , 'source': {
            'mode': 'SersicSphere',
            'sigma': 20,
            'theta': 45,
            'luminosity' : 20,
            'position': 'cartesian'}
      , 'position': {'x': 11.01, 'y': 0.31}
      }
param = Parameters(cfg)
```

```{code-cell} ipython3
raysim = SimImage( param, verbose=0 )
rayim = raysim.getImage()
csimg.imshow( rayim, title="Raytrace Point Mass")
```

## Roulette

```{code-cell} ipython3
param["simulator"]["model"] = "Roulette"

rousim = SimImage( param, verbose=0 )
rouim = rousim.getImage()
csimg.imageCompare( rouim, rayim, "Roulette model", 'Raytrace')
```

This looks perfect inside the convergence ring, as it should.

+++

## Sampling

```{code-cell} ipython3
param["simulator"]["sampled"] = True
imsim05 = SimImage( param, verbose=0 )
im05 = imsim05.getImage()
csimg.imageCompare( rayim, im05, "Raytrace", 'Sampled Roulette')
csimg.imageCompare( rouim, im05, "Roulette", 'Sampled Roulette')
```
