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

# Cluster Lenses (Demo n° 1)

This demo follows the pattern from [](/demo/Demo01.ipynb),
and we will not explain constructs known therefrom.

## Preparation

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
from CosmoSim import CosmoSim
from CosmoSim.datagen import SimImage
import CosmoSim.Image as csimg
from CosmoSim import Parameters
```

## First test of Cluster Lenses

We choose the following parameters for the first simulation.

```{code-cell} ipython3
cfg = { "simulator" : { "model" : "Raytrace", "cropsize" : 256 }
      , 'lens': { "cluster" : "SIE/5/5/8/0.3/45;SIE/-5/-5/8/0.3/45" }
      , 'source': {
            'mode': 'Spherical',
            'sigma': 5,
            'theta': 45,
            'position': 'cartesian'}
      , 'position': { 'x': 11.01, 'y': 0.31 }
      }
param = Parameters( cfg )
```

The new element is the lens specification, which is not as user friendly as it was.
The `cluster` attribute gives a list of lenses separated by semicolon.
Each constituent lens consists of the lens model (`"SIE"`) and a list of
lens parameters separated by slash (`/`).  For SIE, these parameters are
$x$/$y$/$\theta_E$/$f$/$\phi_L$, i.e. position $(x,y)$, Einstein radius,
ellipticity, and orientation.

Given the parameters, the simulation is as before.

```{code-cell} ipython3
imsim = SimImage( param )
im = imsim.getImage()
csimg.imshow( im, title="First example of a cluster lens" )
```

## Closure
