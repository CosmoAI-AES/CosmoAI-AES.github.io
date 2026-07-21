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

# CosmoSim SIE Demo

This demo will demonstrate that the different simulation modes for SIE lenses are consistent.

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
cfg = { 'simulator' : { "model" : "Raytrace", "nterms" : 5, "cropsize" : 256 }
      , 'lens': { 
            'mode' : "SIE",
            'einsteinradius': 46 }
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
raysim = SimImage( param, verbose=0 )
rayim = raysim.getImage()
csimg.imshow( rayim, title="Raytrace SIE")
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
im05 = SimImage( param, verbose=0 ).getImage()
param["simulator"]["model"] = "Raytrace"
im06 = SimImage( param, verbose=0 ).getImage()

csimg.imageCompare( rayim, im06, "Raytrace", 'Sampled Raytrace')
csimg.imageCompare( rouim, im05, "Roulette", 'Sampled Roulette')
```

As for SIS, we see minor discrepancy in the sampled roulette.
The sampled raytrace, in contrast, looks perfect.

## Conclusion

We can see that the different simulation models give consistent results. 
The minor discrepancy in the sampled roulette simulation may be due
to numeric approximation.
