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

# CosmoSim Demo II Annotation

CosmoSim can add several annotations to generated images.
This tutorial will show the ones available as of v3.0.0.

## Preparation

We use the same basic setup and lens configuration as we used
in [](./Demo01.ipynb).  The following code is copied therefrom and trimmed.

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
import tomllib as tl

from CosmoSim.datagen import SimImage
import CosmoSim.Image as csimg
from CosmoSim import Parameters


with open( "Demo01.toml", 'rb') as f:
            toml = tl.load(f)

param = Parameters( toml )
imsim = SimImage( param, verbose=0 )
im = imsim.getImage()
csimg.imshow( im,  "Initial configuration" )
```

## Annotation

The cosmological annotations is retrieved with the `getAnnotated()` method.

```{code-cell} ipython3
im = imsim.getAnnotated()
csimg.imshow( im,  "Annotated image" )
```

The critical curve is shown in white and the convergence ring in blue.
The green point is the centre of light.  In machine learning we would
translate the image to centre it on the centre of image.
We can also get the exact co-ordinates of this centre.

```{code-cell} ipython3
print( "Centre point", imsim.centrepoint )
```

We can add an axis cross, which is useful to see the location of the origin,
and hence also of the lens.

```{code-cell} ipython3
csimg.drawAxes( im )
plt.imshow( im, cmap='gray')
plt.title( "With axis cross" )
plt.axis("off")
```

Note that the convergence ring passes through the centre of the lens, as
it always should.

::: {note} Remark
Annotations obviously clutters the image, and it is an ongoing project to make the annotations as flexible and unobtrusive as possible.
:::

## The source

The unlensed source can be displayed as follows.

```{code-cell} ipython3
im = imsim.getActualImage()
csimg.drawAxes( im )
plt.imshow( im, cmap='gray')
plt.title( "The source w/o lensing" )
plt.axis("off")
```

We barely see the tiny source which sits on the $x$-axis.
We could remove the axis cross to see it better.

## Cropping

Generally, we use an oversized image for calculation, and then crop it down
to a manageable size.

```{code-cell} ipython3
print( "Prior shape", im.shape )
im = csimg.crop( im )
print( "Posterior shape", im.shape )
csimg.imshow( im, "Cropped image" )
```

The default cropsize is 256, but in the batch process, the sizes are read
from `simulator.imagesize` and `simulator.cropsize`.  We could give it as
an argument to `crop()` too.

```{code-cell} ipython3
im = csimg.crop( im, 128 )
plt.imshow( im, cmap='gray')
plt.title( "Much cropped image" )
plt.axis("off")
```

## Closure

Annotation is work in process, as we mentioned.  Stay tuned.

```{code-cell} ipython3

```
