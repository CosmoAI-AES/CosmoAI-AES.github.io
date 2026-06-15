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

# CosmoSim Roulette Resimulation Demo 

This Demo assumes that you are familiar with the principles from
[](./Demo01).  We start with the same imports

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
import toml
import tomllib as tl

from CosmoSim import CosmoSim
from CosmoSim.datagen import SimImage
import CosmoSim.Image as csimg
from CosmoSim import Parameters

import CosmoSim as cs
print( "CosmoSim version", cs.__version__ )
```

Additionally, we require the `Resim` class for resimulation.

```{code-cell} ipython3
from CosmoSim.roulettegen import Resim
```

The `Resim` class shares the `GenericSim` superclass with `SimImage`,
which we used in [](./Demo01) but simulates from precomputed roulette
parameters and not from a regular lens model. 

## Basic Configuration

We start with parameters similar to the ones from [](./Demo01),
to make a baseline raytrace simulation using a SIE lens.
We have just rounded some of the parameters to get neater numbers.
We will use the simulation from `SimImage` to get roulette amplitudes
for resimulation.

```{code-cell} ipython3
with open( "Demo03.toml", 'rb') as f:
            toml = tl.load(f)

param = Parameters( toml )
imsim = SimImage( param, verbose=0 )
im = imsim.getImage()
csimg.imshow( im, "Baseline simulation" )
```

::: {tip}
Here we use convenience functions from the `CosmoSim.Image` module (`csimg`),
instead of using matplotlib directly.  [](./Demo01) used more cumbersome code.
:::

::: {tip} 
For debugging, it may be useful to change the verbosity level on the fly.
On this point, the C++ code functions differently from the python code.
Where the python code often has per-class and per-function verbosity settings,
the C++ code uses a single global variable which can be set thus:
```
from CosmoSim.CosmoSimPy import setDebug
setDebug(3)
```
This is set every time the `Resim` or `SimImage` classes are instantiated,
which works well enough if only one instance is made, or all use the same 
verbosity level.  For more complex situations, the above `setDebug` may be
useful.  We used it during debugging, but it has now been from the final demo.
:::

## Roulette parameters

We can retrieve the roulette amplitudes with the `getData()` method.

```{code-cell} ipython3
row = imsim.getData(verbose=2)
```

We have run this in verbose mode since it is the first time we use it.
Feel free to go back to the instantiation of `imsim` to reduce it.

The resulting data is a pandas `Series`.

```{code-cell} ipython3
display( row )
```

Here we see that we have roulette amplitudes up to order 16.
High-order amplitudes are zero, so we may want to look at the the first
ones.

```{code-cell} ipython3
display( row[0:25] )
```

```{code-cell} ipython3
rsim = Resim( row, verbose=0 )
resimImage = rsim.getImage()
csimg.imshow( resimImage, "Resimulation" )
```

```{code-cell} ipython3
actual = rsim.getActualImage()
csimg.imshow( actual, "Actual source image" )
```

To compare the images, we can plot side by side

```{code-cell} ipython3
csimg.drawAxes(actual)

fig = plt.figure(figsize=(15,10))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(2, 3, 1)
csimg.imshow( actual, "Actual source image" )

fig.add_subplot(2, 3, 5)
csimg.imshow( csimg.imageDiff(im,resimImage), "Difference image" )

csimg.drawAxes(im)
csimg.drawAxes(resimImage)

fig.add_subplot(2, 3, 4)
csimg.imshow( im, "Original simulation" )
fig.add_subplot(2, 3, 6)
csimg.imshow( resimImage, "Resimulation" )


## Roulette amplitudes from sampled lenses

## Resimulation

## Comparing simulation models

```
