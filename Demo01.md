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

In this demo, we will use the following sample parameters, taken from a test by Ben David 6 May 2026.
CosmoSim can take parameters in many different formats.  CSV files are generally used for bulk processing,
while TOML is more convenient for individual samples. The notation is not always harmonised, and is shown here for reference.

| GUI Name |         Parameter | CSV name | TOML Name                 |
| :-       |         :-        | :-       | :-                        |
| Einstein Radius |  $R_E= 46$ | `einsteinR` | `lens.einsteinR`       |
| Ellipticity |      $0.34$    | `ellipseratio` | `lens.ellipseratio` |
| Lens Orientation | 107       | `orientation` | `lens.orientation`   |
| Distance Ratio (chi) | $\chi=50\%$ | `chi` | `lens.chi` |
| x |                    $x= 11.01$ | `x` | `position.x`  |
| y |                    $y= 0.31$  | `x` |  `position.y` |
| Source Size |     $\sigma=20$ | `sigma` | `source.sigma`|
| Source Rotation | 45° | `theta` | `source.theta`        |

::: {admonition} Warning
The terms used in the code and config files do not always reflect standard mathematical notation.
In particular, `theta` is not $\theta$ in current notation.

Typically, the CSV names reflect the identifiers used in the code, which make them tricky to change.
For the time being, we have to live with the ambiguity.
:::

## First test of the API

We can define the configuration as a dict using the nested (TOML) structure.

```{code-cell} ipython3
cfg = { 'lens': { 
            'einsteinR': 46,
            'ellipseratio': 0.34,
            'orientation': 107,
            'chi': 50}
      , 'source': {
            'mode': 'Spherical',
            'sigma': 20,
            'theta': 45,
            'position': 'cartesian'}
      , 'position': {'x': 11.01, 'y': 0.31}
      }
```

CosmoSim uses `Parameters` objects which store the parameters as a cascaded dictionary,
incorporating defaults.   This is instantiated using the `dict` that we just made.

```{code-cell} ipython3
param = Parameters( cfg )
print( param )
```

::: {admonition} Remark
It is possible to define the config as a flat `dict` using the CSV labels, and
the convert it to the nested structure with the `getConfig()` function.
:::

We can simulate the configuration by merely instantiating a `SimImage` object, as follows.
The simulator runs as part of the instantiation.  
It is rather verbose, with debug messages still left in.

```{code-cell} ipython3
imsim = SimImage( param )
```

Usually, this output is not interesting, but if we have relied heavily on defaults, we can read some of the values actually used from this output.
We see `GAUSS` indicating that a Gaussian light profile has been used for the source. We also see `POINTMASS_EXACT` which refers to the point mass lens, which is simulated with an exact formula equivalent to raytracing. We will get back to this later.

The interesting part is the image, which we can retrieve with a 
second line.

```{code-cell} ipython3
im = imsim.getImage()
print( im )
print( type( im ) )
```

The image is a numpy *array*, but we can view it as a proper image using
`matplotlib`.

```{code-cell} ipython3
plt.imshow( im, cmap='gray')
plt.title( "First simulation test" )
plt.axis("off")
```

## More Complete configuration

For the second test, we will keep the configuration in a TOML file.
This tends to be easier to read than the `dict` in python code.
The file is [Demo01.toml](./Demo01.toml), and we read it thus:

```{code-cell} ipython3
import tomllib as tl
with open( "Demo01.toml", 'rb') as f:
            toml = tl.load(f)
print( toml )
```

The result is a nested python `dict` which we can import as we did before.

Most importantly, we are now defining `simulator.config=raysie`, which
says raytrace simulation with a SIE lens, and `source.mode=SersicSphere`
which says a spherical source with Sersic light profile.
The sersic parameters (`n_sersic` and `luminosity`) match the current
defaults in the GUI.

In the run below, we set `verbose=2` which gives extra diagnostic output.
This is just to demonstrate the feature.  It is only needed for debugging.

```{code-cell} ipython3
param = Parameters( toml )
imsim = SimImage( param, verbose=2 )
im = imsim.getImage()
plt.imshow( im, cmap='gray')
plt.title( "Simulation from TOML" )
plt.axis("off")
```

## Comparing simulation models

For the simulation of SIE lenses, `CosmoSim` provides a total of four
different simulation models
+ Raytrace is the exact simulation, as used above.
+ Roulette uses the Roulette formalism, which approximates using a
  local description of the lens potential

Each of these can also be run in a sampled version, where the lens potential
is sampled and differentiated numerically, instead of using algebraic functions
derived analytically.

To test different models, we can set `simulator.model`, which will override
`simulator.config`, while keeping the SIE lens.

```{code-cell} ipython3
param["simulator"]["model"] = "Roulette"
imsimRoulette = SimImage( param, verbose=0 )
imRoulette = imsimRoulette.getImage()
plt.imshow( imRoulette, cmap='gray')
plt.title( "Roulette Simulation" )
plt.axis("off")
```

Because the source is small and provides little light, it is hard
to distinguish the simulation models, but the critical point with Roulette
is that it only provides a local description of the primary image.  The
secondary image on the far side of the lens will never appear in a roulette
simulation.

Before we tamper with the source description, we will run sampled simulations 
as follows.

```{code-cell} ipython3
param["simulator"]["model"] = "Roulette"
param["simulator"]["sampled"] = True
imsimRouletteSampled = SimImage( param, verbose=0 )
imRouletteSampled = imsimRouletteSampled.getImage()

param["simulator"]["model"] = "Raytrace"
param["simulator"]["sampled"] = True
imsimRaytraceSampled = SimImage( param, verbose=0 )
imRaytraceSampled = imsimRaytraceSampled.getImage()
```

::: {admonition} Remark
It is unfortunate that we cannot suppress diagnostic output from the C++
modules at the moment.  This is on the bucket list.
:::

To better compare, we will show the four images side by side.

```{code-cell} ipython3
fig = plt.figure(figsize=(10, 10))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(2, 2, 1)
plt.imshow( imRouletteSampled, cmap='gray')
plt.title( "Sampled Roulette Simulation" )
plt.axis("off")

fig.add_subplot(2, 2, 2)
plt.imshow( imRaytraceSampled, cmap='gray')
plt.title( "Sampled Raytrace Simulation" )
plt.axis("off")

fig.add_subplot(2, 2, 3)
plt.imshow( imRoulette, cmap='gray')
plt.title( "Roulette Simulation" )
plt.axis("off")

fig.add_subplot(2, 2, 4)
plt.imshow( im, cmap='gray')
plt.title( "Raytrace Simulation" )
plt.axis("off")
```

## A convenience function

The following function does the four simulations and plots above,
for any given set of parameters `param`.
When we fiddle with the source (or lens) description, we will use
this to run all tests at once.

```{code-cell} ipython3
def quadSim( param ):
    param["simulator"]["model"] = "Roulette"
    param["simulator"]["sampled"] = True
    imsimRouletteSampled = SimImage( param, verbose=0 )
    imRouletteSampled = imsimRouletteSampled.getImage()

    param["simulator"]["sampled"] = False
    imsimRoulette = SimImage( param, verbose=0 )
    imRoulette = imsimRoulette.getImage()

    param["simulator"]["model"] = "Raytrace"
    param["simulator"]["sampled"] = True
    imsimRaytrace = SimImage( param, verbose=0 )
    imRaytrace = imsimRaytrace.getImage()

    param["simulator"]["sampled"] = False
    imsimRaytraceSampled = SimImage( param, verbose=0 )
    imRaytraceSampled = imsimRaytraceSampled.getImage()

    fig = plt.figure(figsize=(10, 10))
    fig.tight_layout(pad=0.0)
    plt.subplots_adjust(hspace=0.1, wspace=0.1) 

    fig.add_subplot(2, 2, 1)
    plt.imshow( imRouletteSampled, cmap='gray')
    plt.title( "Sampled Roulette Simulation" )
    plt.axis("off")

    fig.add_subplot(2, 2, 2)
    plt.imshow( imRaytraceSampled, cmap='gray')
    plt.title( "Sampled Raytrace Simulation" )

    plt.axis("off")

    fig.add_subplot(2, 2, 3)
    plt.imshow( imRoulette, cmap='gray')

    plt.title( "Roulette Simulation" )
    plt.axis("off")
    fig.add_subplot(2, 2, 4)
    plt.imshow( im, cmap='gray')
    plt.title( "Raytrace Simulation" )
    plt.axis("off")
```

## The triangle source

```{code-cell} ipython3
param["source"]["mode"] = "Triangle"
quadSim( `param` )
```

# Old sketches


With the simulator instance, we can get the image.  We take an annotated version which shows the centre of light (green) and the reference point for roulette expansion (blue).

```
def annotatedSim(imsim):
    im = imsim.getAnnotated()WithWith
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
