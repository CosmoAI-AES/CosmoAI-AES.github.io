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

# CosmoSim Annotation Demo 

## Preparation

We will use pandas to handle sets of lensing systems with
different parameters, pyplot for plotting, PIL for images,
as well as config files in TOML.  Hence we import the following
modules.

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
import toml
```

From CosmoSim, we will use the main simulator `CosmoSim` and
the data generator `datagen`.

```{code-cell} ipython3
from CosmoSim import CosmoSim
from CosmoSim.datagen import SimImage
import CosmoSim.Image as csimg
from CosmoSim import Parameters
```



# Annotation

It is possible to annotate images, something we have not shown above.
The following example was used in a different demo and could be adapted.

```
def annotatedSim(imsim):
    im = imsim.getAnnotated()
    print( "Centre point", imsim.centrepoint )
    print( "Prior shape", im.shape )
    csimg.drawAxes( im )
    im = csimg.crop( im )
    print( "Posterior shape", im.shape )
    return im
im = annotatedSim(imsim)
```
