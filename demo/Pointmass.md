---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.19.3
kernelspec:
  name: python3
  display_name: Python 3 (ipykernel)
  language: python
---

# CosmoSim Pointmass Demo

The simplest lens model in CosmoSim is the pointmass, where all
the mass is compressed in a singular point.
This model is implemented many times.
Currently, there is a `PointMass` lens which can be used with the
standard models, `RouletteModel` and `RaytraceModel`.
The original implementations `PointMassRoulette` and
`PointMassExact` should be equivalent, but were not modular.

::: {warning} Work in Progress
:::

## Preparation

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
import toml

from CosmoSim import CosmoSim
from CosmoSim.datagen import SimImage
import CosmoSim.Image as csimg
from CosmoSim import Parameters
```

## The exact models

We can define the configuration as a dict using the nested (TOML) structure.

```{code-cell} ipython3
cfg = { 'simulator' : { "model" : "Raytrace" }
      , 'lens': { 
            'lens' : "PointMass",
            'einsteinR': 46,
            'ellipseratio': 0.34,
            'orientation': 107,
            'chi': 50}
      , 'source': {
            'mode': 'Spherical',
            'sigma': 20,
            'theta': 45,
            'position': 'cartesian'}
      , 'position': {'x': 11.01, 'y': 0.31}
      }
```

```{code-cell} ipython3
param = Parameters( cfg )
imsim01 = SimImage( param, verbose=0 )
im01 = imsim01.getImage()
```

To run the same simulation with the legacy, exact model, we simply change the
simulator setting and rerun.

```{code-cell} ipython3
param["simulator"]["model"] = "Point Mass (exact)" 
imsim02 = SimImage( param, verbose=0 )
im02 = imsim02.getImage()
csimg.imageCompare( im01, im02, "Modular Raytrace", 'Exact Point Mass')
```

Visually, this is perfect.

## The original roulette

```{code-cell} ipython3
param["simulator"]["model"] = "Point Mass (roulettes)"
imsim03 = SimImage( param, verbose=0 )
im03 = imsim03.getImage()
csimg.imageCompare( im02, im03, "Exact Point Mass", 'Legacy Roulette')
```

This looks perfect inside the convergence ring, as it should.

## Modular roulette

```{code-cell} ipython3
param["simulator"]["model"] = "Roulette"
imsim04 = SimImage( param, verbose=2 )
im04 = imsim04.getImage()
csimg.imageCompare( im02, im04, "Modular Raytrace", 'Modular Roulette')
```

```{code-cell} ipython3

```

```{code-cell} ipython3
csimg.imageCompare( im03, im04, "Legacy Roulette", 'Modular Roulette')
```

```{code-cell} ipython3

```
