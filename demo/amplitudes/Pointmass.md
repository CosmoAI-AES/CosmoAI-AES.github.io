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

# Point Mass Amplitudes

This test follows up on problems arising from [](./AmplitudeFile.ipynb)
and tests calculation of roulette amplitudes from python.


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

We use the same configuration as we have used before.

```{code-cell} ipython3
pmcfg = { 'simulator' : { "model" : "Roulette", "nterms" : 8, "cropsize" : 256 }
      , 'lens': { 
            'mode' : "PM",
            "amplitudefile" : "pm50.txt",
            'einsteinR': 46 }
      , 'source': {
            'mode': 'SersicSphere',
            'sigma': 20,
            'theta': 45,
            'luminosity' : 70,
            'position': 'cartesian'}
      , 'position': {'x': 11.01, 'y': 0.31}
      }
pmparam = Parameters(pmcfg)
rcfg = deepcopy(pmcfg)
rcfg["simulator"]["model"] = "Raytrace"
rparam = Parameters( rcfg )
```

```{code-cell} ipython3
sim01 = SimImage( pmparam, verbose=0 )
im01 = sim01.getImage()
raysim = SimImage( rparam, verbose=0 ).getImage()
csimg.imageCompare( pm01, pmray, "Baseline", 'Raytrace')
```

## Roulette Amplitudes

```{code-cell} ipython3
df01 = sim01.getData()
display(df01)
```

```{code-cell} ipython3
xi = sim01.getXi()
print(xi)
```

```{code-cell} ipython3
df02 = sim01.getRoulette()
display(df02)
display(df01-df02)
```

```{code-cell} ipython3
df03 = sim01.getRoulette(fn="pm09sie2.txt")
display(df03)
```

```{code-cell} ipython3
df04 = sim01.getRoulette(fn="pm10sie.txt")
display(df04)
```

## Resimulation


## Conclusion
