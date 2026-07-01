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

# CosmoSim Demo III Roulette Resimulation 

This Demo assumes that you are familiar with the principles from
[](./Demo01.md).  We start with the same imports

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
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
which we used in [](./Demo01.md) but simulates from precomputed roulette
parameters and not from a regular lens model. 

## Basic Configuration

We start with parameters similar to the ones from [](./Demo01),
to make a baseline raytrace simulation using a SIE lens.
We have just rounded some of the parameters to get neater numbers.
We will use the simulation from `SimImage` to get roulette amplitudes
for resimulation.

```{code-cell} ipython3
with open( "Demo03.toml", 'rb' ) as f:
            toml = tl.load(f)

param = Parameters( toml )
imsim = SimImage( param, verbose=0 )
im = imsim.getImage()
csimg.imshow( im, "Baseline simulation" )
```

::: {tip}
Download [Demo03.toml](./Demo03.toml).
:::

::: {tip}
Here we use convenience functions from the `CosmoSim.Image` module (`csimg`),
instead of using matplotlib directly.
The code in [](./Demo01) was more cumbersome code on this point.
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
The resulting data is a pandas `Series`.

```{code-cell} ipython3
row = imsim.getData()
display( row )
```

Here we see that we have roulette amplitudes up to order 5, which is the maximum implemented for analytical SIE.

```{code-cell} ipython3
rsim = Resim( row )
resimImage = rsim.getImage()
csimg.imshow( resimImage, "Resimulation" )
```

For reference, we can do the original roulette simulation, using a
`SimImage` object.

```{code-cell} ipython3
param["simulator"]["model"] = "Roulette"
roulette = SimImage( param, verbose=0 )
rouletteImage = roulette.getImage()
csimg.imshow( rouletteImage, "Roulette simulation" )
```

The two roulette simulations look similar but displaced compared to each other.

## The Source 

We can also have a look at the original source image.

```{code-cell} ipython3
actual = rsim.getActualImage()
csimg.imshow( actual, "Actual source image" )
```

## Comparison

To compare the images, we can plot side by side
We also add reference lines to each image, except the difference image.
If the code is confusing, it is because we

```{code-cell} ipython3
imdiff = csimg.imageDiff(rouletteImage,resimImage)
rdiff = csimg.imageDiff(rouletteImage,im)

csimg.drawAxes(actual)
csimg.drawAxes(im)
csimg.drawAxes(rouletteImage)
csimg.drawAxes(resimImage)

fig = plt.figure(figsize=(15,10))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(2, 3, 1)
csimg.imshow( actual, "Actual source image" )
fig.add_subplot(2, 3, 2)
csimg.imshow( im, "Original raytrace simulation" )
fig.add_subplot(2, 3, 3)
csimg.imshow( rdiff, "Roulette/raytrace difference" )
fig.add_subplot(2, 3, 5)
csimg.imshow( imdiff, "Difference image" )
fig.add_subplot(2, 3, 4)
csimg.imshow( rouletteImage, "Roulette simulation" )
fig.add_subplot(2, 3, 6)
csimg.imshow( resimImage, "Resimulation" )
```

::: {note}
We have not centred the images above.

For use with machine learning, it is critical to centre the image on a canonical
point to avoid leaking information from the choice of origin.  We usually centre
the image on the centre of light.

In weak lensing, with a single visible image, it is also useful to centre and crop
to get a better view.  Here, however, with images curling around the origin, centring
makes little difference to the display, and the extra conversion would only be confusing.
:::

## Centring the image

In the original simulation, centring is straight forward, by
setting `simulator.centred` to `True`.

```{code-cell} ipython3
param["simulator"]["centred"] = True
param["simulator"]["model"] = "Raytrace"
imsim = SimImage( param, verbose=0 )
imC = imsim.getImage(verbose=1)

fig = plt.figure(figsize=(10,5))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(1, 2, 1)
csimg.imshow( imC, "Original simulation - centred" )
fig.add_subplot(1, 2, 2)
csimg.imshow( csimg.imageDiff(imC,im), "Difference" )
```

We have plotted the difference image to see that centring does make a difference.
We can also note the difference it makes to the data for resimulation.

```{code-cell} ipython3
rowC = imsim.getData()
display( pd.DataFrame( [row, rowC] ).transpose() )
```

The roulette amplitudes do not change.  The are calculated in the same point.
However the relative source position `reletaX`/`reletaY` does. 
It is the sum of the original position and the centrepoint `centreX`/`centreY`.

We can do the same with roulette; `centred` is still `True`.

```{code-cell} ipython3
param["simulator"]["model"] = "Roulette"
roulette = SimImage( param, verbose=0 )
rouletteImageC = roulette.getImage(verbose=0)

fig = plt.figure(figsize=(10,5))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(1, 2, 1)
csimg.imshow( rouletteImageC, "Roulette simulation - centred" )
fig.add_subplot(1, 2, 2)
csimg.imshow( csimg.imageDiff(rouletteImageC,rouletteImage), "Difference" )
```

Finally we resimulate from the data from the centred simulatior.
We compare the result with both the original resimulation and with the centred
raytrace.

```{code-cell} ipython3
rsim = Resim( rowC, verbose=0 )
resimImageC = rsim.getImage()

fig = plt.figure(figsize=(15,5))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(1, 3, 1)
csimg.imshow( resimImageC, "Resimulation from centred image" )
fig.add_subplot(1, 3, 2)
csimg.imshow( csimg.imageDiff(resimImageC,resimImage), "Difference with previous resimulation" )
fig.add_subplot(1, 3, 3)
csimg.imshow( csimg.imageDiff(resimImageC,imC), "Difference with centred raytrace" )
```

We note that the image has shifted compared to the original resimulation.  
The right hand image shows that the co-ordinate system is shifted to match the
centred raytrace image.

## Closure

Resmulation is going to be critical to evaluate machine learning models in practical scenarioes.
The resimulated image can be compared to the observation without having a ground truth for the roulette amplitudes.

There is some work in progress here.  
I hope we have managed to demonstrate some of the caveats, particularly with respect to centring.
Documentation of [](/tech/Notation.md) and the definitions of the different co-ordinate systems is ongoing work.

```{code-cell} ipython3

```
