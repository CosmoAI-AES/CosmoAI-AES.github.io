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
from CosmoSim.roulettegen import Resim
import CosmoSim.Image as csimg

print( "CosmoSim version:", cs.__version__ )
```

We use the same configuration as we have used before.

```{code-cell} ipython3
cfg = { 'simulator' : {
             "model" : "Raytrace",
             "centred" : True,
             "xireference" : True,
             "nterms" : 8, 
             "cropsize" : 256 }
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
param = Parameters(cfg)
rcfg = deepcopy(cfg)
rcfg["simulator"]["model"] = "Raytrace"
rparam = Parameters( rcfg )
```

We set up two simulators. We show only the raytrace simulation for now.  This will be used as a reference to assess the fidelity of other simulations.
Even though the simulator is set up for raytrace, it will also compute the roulette amplitudes for us.
We centre the image, as this is the standard mode of operation in practice, and thus best tested.

```{code-cell} ipython3
sim = SimImage( param, verbose=1 )
ray = sim.getImage()
csimg.imshow( ray, 'Raytrace')
```

## Roulette Amplitudes

As we have shown in previous demos, we can retrieve all the amplitudes as a pandas `Series` object.

```{code-cell} ipython3
df01 = sim.getData()
display(df01)
```

This calculation is made in double precision in the C+= library.
The python code also offers a calculation in arbidtrary precision.
The default is 64 digits at present.
This computation is slow, so do not worry if you do not see the results immediately.

```{code-cell} ipython3
df02 = sim.getRoulette(precision=64)
display(df02)
```

We remove non-numeric entries before we take the difference between the two calculations.

```{code-cell} ipython3
df01 = df01.drop( "source" )
df02 = df02.drop( "source" )
```

```{code-cell} ipython3
diff = df01-df02
print(diff)
```

```{code-cell} ipython3
print( diff.abs().max() )
```

```{code-cell} ipython3
xi = sim.sim.getNu()
print(np.array(xi))
```

```{code-cell} ipython3
df03 = sim.getRoulette(fn="pm09sie2.txt")
df03 = df03.drop("source")
display(df03)
```

```{code-cell} ipython3
maxerror = max( df02-df03 ) 
print( maxerror )
```

This error is much smaller, maybe negligible, even though it *is* within double precision.

```{code-cell} ipython3
print( np.double( maxerror ) )
```

We ignore the last amplitudes file that we have used, because it depends on the redundant orientation parameter, and the library does not currently handle this.

+++

## Resimulation

```{code-cell} ipython3
param1 = deepcopy( param )
param["simulator"]["centred"] = False
resim1 = Resim( df01, param=param1, verbose=1 )
im01 = resim1.getImage()
csimg.drawAxes( im01 )
csimg.imageCompare( im01, ray, "Resimulation", "Raytrace" )
```

```{code-cell} ipython3
param2 = deepcopy( param )
resim2 = Resim( df02, param=param1, verbose=0 )
im02 = resim2.getImage()
csimg.imageCompare( im02, ray, "Resimulation", "Raytrace" )
```

```{code-cell} ipython3
param3 = deepcopy( param )
resim3 = Resim( df03, param=param1, verbose=0 )
im03 = resim3.getImage()
csimg.imageCompare( im03, ray, "Resimulation", "Raytrace" )
```

## Conclusion
