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

This demo follows the pattern from [](/demo/Demo01.ipynb) 
and [](/demo/Dataset.ipynb),
and we will not take up space to explain constructs known therefrom.

## Preparation

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
import json
from CosmoSim import CosmoSim
from CosmoSim.datagen import SimImage
import CosmoSim.Image as csimg
import CosmoSim.dataset as csd
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
imsim = SimImage( param, verbose=0 )
im = imsim.getImage()
csimg.imshow( im, title="First example of a cluster lens" )
```

## Random dataset

We can also generate random datasets.

```{code-cell} ipython3
cfg = csd.readtoml( "cluster.toml" )
display( json.dumps( cfg ) )
```

::: {tip}
Download [cluster.toml](./dataset.toml).
:::

::: {note} Remark
The TOML file is similar to the one used in [](/demo/Dataset.ipynb).
The most notable difference is the `[cluster]`.
We also have to specify the lens model for the constuent lenses with the
`lens.model` parameter.
It cannot be inferred from `simulator.config`.
:::

Each constituent lens is placed in a random direction from the origin,
at a random distance upper bounded as $c\theta_E$ where $\theta_E$ is
the Einstein radius and $c$ is the constant given as `cluster.maxrelativelocation`.

We can draw a random object as before.

```{code-cell} ipython3
ob = csd.getline( cfg, fn="test.png" )
display( ob )
```

```{code-cell} ipython3
param = cs.Parameters( )
param.setRow( ob )
imsim = csg.SimImage( param, verbose=0 )
im = imsim.getImage()
csimg.imshow( im )
```

## A sample

```{code-cell} ipython3
def mkimg(cfg):
      ob0 = csd.getline( cfg, fn="test.png" )
      p0 = cs.Parameters( )
      p0.setRow( ob0 )
      sim = csg.SimImage( p0, verbose=0 )
      return imsim.getImage()
```

```{code-cell} ipython3
ims = [ mkimg(cfg) for i in range(6) ]
showImages( ims )
```

## Closure
