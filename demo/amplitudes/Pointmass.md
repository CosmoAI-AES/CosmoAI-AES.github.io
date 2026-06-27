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

The test below follow the main patterns from [](./AmplitudeFile.ipynb).

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

## Rational numbers

+ [pm20.txt](./pm20.txt) is calculated using `CosmoSim.Roulettes` v3.0.5

```{code-cell} ipython3
pmparam["lens"]["amplitudefile"] = "pm20.txt"

pmsim02 = SimImage( pmparam, verbose=0 )
pm02 = pmsim02.getImage()
csimg.imageCompare( pm02, pm01, "Rational numbers", 'Baseline')
csimg.imageCompare( pm02, pmray, "Rational numbers", 'Raytrace')
```

There is no visual discrepancy between the two implementations, but we can check it numerically as well, by taking the Euclidean distance between the two images.

```{code-cell} ipython3
print( sum( (pm01-pm02).astype(np.double).flatten()**2 ) )
```

## SIE style calculation

+ [pm10sie.txt](./pm10sie.txt) is calculated using the same logic as the amplitudes for the SIE lens.

```{code-cell} ipython3
pmparam["lens"]["amplitudefile"] = "pm10sie.txt"

pmsim03 = SimImage( pmparam, verbose=0 )
pm03 = pmsim03.getImage()
csimg.imageCompare( pm03, pm01, "SIE style", 'Baseline')
csimg.imageCompare( pm03, pmray, "SIE style", 'Raytrace')
```

Again, it is identical, and wrong.

```{code-cell} ipython3
print( sum( (im01.astype(np.double)-im03.astype(np.double)).flatten()**2 ) )
```

Since the point mass is circular symmetric, the orientation parameter for SIE
is redundant, and makes the above formulæ unnecessarily complicated.
Using the `--circular` argument to `CosmoSim.Roulettes.sie`, we get the following
amplitudes formulæ.

```{code-cell} ipython3
pmparam["lens"]["amplitudefile"] = "pm09sie2.txt"

pmsim04 = SimImage( pmparam, verbose=0 )
pm04 = pmsim04.getImage()
csimg.imageCompare( pm04, pm01, "SIE style", 'Baseline')
csimg.imageCompare( pm04, pmray, "SIE style", 'Raytrace')
```

It does not make a difference to the simulation, but it is simpler.

## Some more examples

```{code-cell} ipython3
pmparam["position"]["y"] = 10
pmparam["simulator"]["model"] = "Raytrace"
a1 = SimImage( pmparam, verbose=0 ).getImage()
pmparam["simulator"]["model"] = "Roulette"
a2 = SimImage( pmparam, verbose=0 ).getImage()
csimg.imageCompare( a2, a1, "SIE style", 'Raytrace')
```

```{code-cell} ipython3
pmparam["position"]["y"] = 20
pmparam["simulator"]["model"] = "Raytrace"
a1 = SimImage( pmparam, verbose=0 ).getImage()
pmparam["simulator"]["model"] = "Roulette"
a2 = SimImage( pmparam, verbose=0 ).getImage()
csimg.imageCompare( a2, a1, "SIE style", 'Raytrace')
```

## Conclusion

```{code-cell} ipython3

```
