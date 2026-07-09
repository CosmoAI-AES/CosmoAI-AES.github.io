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
from CosmoSim import Parameters
from CosmoSim.datagen import SimImage
from CosmoSim.roulettegen import Resim
import CosmoSim.Image as csimg

print( "CosmoSim version:", cs.__version__ )
```

We use the same configuration as we have used before.

```{code-cell} ipython3
cfg = { 'simulator' : {
             "model" : "Raytrace",
             "centred" : False,
             "xireference" : True,
             "nterms" : 5, 
             "cropsize" : 256 }
      , 'lens': { 
            'mode' : "PM",
            "amplitudefile" : "pm50v3.2.txt",
            'einsteinradius': 46 }
      , 'source': {
            'mode': 'SersicSphere',
            'sigma': 20,
            'luminosity' : 20,
            'position': 'cartesian'}
      , 'position': {'x': 10, 'y': 5 }
      }
param = Parameters(cfg)
```

::: {note} File source
The amplitudes file `pm50v3.2.txt` is the one taken from v3.2 of CosmoSim.
:::

We set up two simulators. We show only the raytrace simulation for now.
This will be used as a reference to assess the fidelity of other simulations.
Even though the simulator is set up for raytrace,
it will also compute the roulette amplitudes for us.
We centre the image, as this is the standard mode of operation in practice,
and thus best tested.

```{code-cell} ipython3
sim = SimImage( param, verbose=0 )
ray = sim.getImage()
csimg.imshow( ray, 'Raytrace')
```

## Roulette Amplitudes

As we have shown in previous demos, we can retrieve all the amplitudes as a pandas `Series` object.

```{code-cell} ipython3
df01 = sim.getData()
```

This calculation is made in double precision in the C+= library.
The python code also offers a calculation in arbidtrary precision.
The default is 64 digits at present.
This computation is slow, so do not worry if you do not see the results immediately.

```{code-cell} ipython3
df02 = sim.getData(precision=64,verbose=0)
```

We can compare the two, but we need a little trick to disregard non-numeric entries.

```{code-cell} ipython3
df = pd.DataFrame( [ df01, df02, df02.drop(["filename","source"])-df01 ],
                   index=[ "C++", "Python", "Difference" ] ).transpose()
display(df)
```

We can quickly check the worst discrepancy:

```{code-cell} ipython3
dfnumeric = df.drop( [ "source", "filename" ] )
display(dfnumeric.head())
```

```{code-cell} ipython3
diff = dfnumeric["Difference"].abs()
print( "Absolute error:", diff.max() )
```

```{code-cell} ipython3
py = dfnumeric["Python"].abs()
py = py.mask( py == 0 )
df["Relative difference"] = diff/py
display( df )
```

It is impossible to read the high precision numbers in this display format.
For instance $\beta^4_1$ seems to have a differance greater than one.
We can check this by converting to double, or otherwise print in scientific notation.

```{code-cell} ipython3
print( df.loc["beta[4][1]"].astype(np.double) )
```

## Resimulation

```{code-cell} ipython3
resim1 = Resim( df01, param=param, verbose=0 )
im01 = resim1.getImage()
csimg.imageCompare( im01, ray, "Resimulation", "Raytrace" )
```

```{code-cell} ipython3
resim2 = Resim( df02, param=param, verbose=0 )
im02 = resim2.getImage()
csimg.imageCompare( im02, ray, "Resimulation", "Raytrace" )
```

```{code-cell} ipython3
csimg.imageCompare( im02, im01, "Resimulation high precision", "Resimulation double precision" )
```

```{code-cell} ipython3
rparam = deepcopy( param )
rparam["simulator"]["model"] = "Roulette"
rsim = SimImage( rparam, verbose=0 )
rou = rsim.getImage()
csimg.imageCompare( rou, im01, "Original Roulette", "Resimulation" )
```

## Further inspection

```{code-cell} ipython3
xi = sim.sim.getNu()
print(np.array(xi))
```

## Conclusion
