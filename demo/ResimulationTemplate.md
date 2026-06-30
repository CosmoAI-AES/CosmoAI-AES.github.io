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

# Resimulation Template 

This Demo assumes that you are familiar with the principles from
[](./Demo01).  We start with the same imports

```{code-cell} ipython3
from copy import deepcopy

from CosmoSim.datagen import SimImage
from CosmoSim.roulettegen import Resim
import CosmoSim.Image as csimg
from CosmoSim import Parameters

import CosmoSim as cs
print( "CosmoSim version", cs.__version__ )
```

## Basic Configuration

We start with parameters similar to the ones from [](./Demo01),
to make a baseline raytrace simulation using a SIE lens.
We have just rounded some of the parameters to get neater numbers.
We will use the simulation from `SimImage` to get roulette amplitudes
for resimulation.

```{code-cell} ipython3
cfg = { "simulator" : {
            "model" : "Raytrace",
            "nterms" : 5,
            "centred" : False
      }
      , "lens" : {
            "mode" : "SIE",
            "einsteinR" : 50,
            "ellipseratio" : 0.4,
            "orientation" : 105
      }
      , "source" : {
            "mode" : "SersicEllipsoid",
            "sigma" : 10,
            "sigma2" : 30,
            "theta" : 45,
            "position" : "cartesian",
            "n_sersic" : 4,
            "luminosity" : 10
      }
      , "position" : { "x" : 12, "y" : 6 }
 }
param = Parameters( cfg )
```

Note that we have set `centred=False`.  If we centre the image, we do not get a fair comparison between original roulette simulation and resimulation.

```{code-cell} ipython3
imsim = SimImage( param, verbose=0 )
im = imsim.getImage()
csimg.drawAxes( im )
csimg.imshow( im, "Baseline simulation" )
```

## Roulette parameters

We can retrieve the roulette amplitudes with the `getData()` method.
The resulting data is a pandas `Series`.

```{code-cell} ipython3
row = imsim.getData()
rsim = Resim( row, verbose=0 )
resimImage = rsim.getImage()
csimg.imageCompare( resimImage, im, "Resimulation", "Original Raytrace" )
```

For reference, we can do the original roulette simulation, using a
`SimImage` object.

```{code-cell} ipython3
roulettecfg = deepcopy( cfg )
roulettecfg["simulator"]["model"] = "Roulette"
roulettecfg["simulator"]["centred"] = False
rouletteparam = Parameters( roulettecfg )
roulette = SimImage( rouletteparam, verbose=0 )
rouletteImage = roulette.getImage()
csimg.imageCompare( resimImage, rouletteImage, "Resimulation", "Roulette simulation" )
```

The two roulette simulations look similar but displaced compared to each other.

## Further inspection 

### The Source 

We can have a look at the original source image.

```{code-cell} ipython3
actual = rsim.getActualImage()
csimg.imshow( actual, "Actual source image" )
```

### Data row

The data row retrived by `getData()` looks like this:

```{code-cell} ipython3
display( row )
```

Here we see that we have roulette amplitudes up to order 5, which is the maximum implemented for analytical SIE.
