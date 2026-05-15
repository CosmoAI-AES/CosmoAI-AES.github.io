---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.19.2
kernelspec:
  name: python3
  display_name: Python 3 (ipykernel)
  language: python
---

# CosmoSim Demo Part I

## Preparation

We will use pandas to handle sets of lensing systems with
different parameters, pyplot for plotting, PIL for images,
as well as config files in TOML.  Hence we import the following
modules.

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
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

## Simulating an image

## Batch Simulation

Now we need to load the original dataset to be able to rerun the simulator.

```
dataset = pd.read_csv( "dataset.csv" )
origrow = dataset[ dataset["filename"] == fn ].iloc[0]
display( origrow )
```

That's the configuration we want to simulate.
Now we need to instantiate the simulator, as follows:

```
sim = CosmoSim()
sim.setMaskMode( False )
imsim = SimImage(sim,row=origrow,verbose=0)
```

With the simulator instance, we can get the image.  We take an annotated version which shows the centre of light (green) and the reference point for roulette expansion (blue).

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
plt.axis("off")
plt.title( fn )
plt.imshow(im)
```
