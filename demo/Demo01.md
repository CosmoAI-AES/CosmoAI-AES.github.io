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

# CosmoSim Demo I

::: {warning} Requirements
This tutorial uses CosmoSim v3.1.  It will break in v3.2.
:::

## Preparation

We will use pandas to handle sets of lensing systems with
different parameters, pyplot for plotting, PIL for images,
as well as config files in TOML.  Hence we import the following
modules.

```{code-cell} ipython3
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image
import toml, json
```

From CosmoSim, we will use the main simulator `CosmoSim` and
the data generator `datagen`.

```{code-cell} ipython3
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
| Einstein Radius |  $R_E= 46$ | `einsteinradius` | `lens.einsteinR`       |
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
            'einsteinradius': 46,
            'ellipseratio': 0.34,
            'orientation': 107 }
      , 'source': {
            'mode': 'Spherical',
            'sigma': 20,
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

::: {note} Parameters
The `Parameter` print-out looks like a mess.  It is a cascading set of of dictionaries ([CascaDict](https://cascadict.readthedocs.io/en/latest/)), which makes it easy to process parameters from multiple sources and applying defaults. 
The idea is to be able to replace a few settings in the top layer without affecting other permanent settings in the other layers, but we have not yet developed this idea fully.
:::

::: {note} Remark
It is possible to define the config as a flat `dict` using the CSV labels, and
then convert it to the nested structure with the `getConfig()` function.
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
print( json.dumps( toml, indent=4 ) )
```

The result is a nested python `dict` which we can import as we did before.

::: {tip}
Note the use of the `json` library to pretty-print a dictionary.
:::

+++

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
param["simulator"]["nterms"] = 5
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
    plt.imshow( imRaytrace, cmap='gray')
    plt.title( "Raytrace Simulation" )
    plt.axis("off")

    return( imRaytrace, imRoulette, imRaytraceSampled, imRouletteSampled )
```

## The triangle source

The triangle source is specially designed for visual comparison of lensing
configurations.  This is what we get.

```{code-cell} ipython3
param["source"]["mode"] = "Triangle"
(im1,im2,im3,im4) = quadSim( param )
```

Since we stored the four images in variables (`im1` through `im4`), we can
also compare them using difference images.  However, we have to take the range
($0\ldots255$) into account when we calculate the difference.  The following
function does this

```{code-cell} ipython3
def imageDiff(im1,im2):
    return ( (im1.astype(float) - im2.astype(float) + 256)/2 ).astype(np.uint8)
```

::: {tip}
This function is also available in the `CosmoSim.Image` module.
```python
from CosmoSim.Image import imageDiff
```
:::

Armed with the function, we can plot diff images.

```{code-cell} ipython3
fig = plt.figure(figsize=(14,7))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(1, 3, 1)
plt.imshow( imageDiff( im1, im3 ), cmap='gray')
plt.title( "Raytrace Simulation" )
plt.axis("off")

fig.add_subplot(1, 3, 2)
plt.imshow( imageDiff( im2, im3 ), cmap='gray')
plt.title( "Roulette Simulation" )
plt.axis("off")
    
fig.add_subplot(1, 3, 3)
plt.imshow( imageDiff( im4, im3 ), cmap='gray')
plt.title( "Sampled Roulette Simulation" )
plt.axis("off")
```

We see that the two raytrace simulations perfectly match, except for the
tiny anomilty in the centre, which is probably due to the singularity of
the lens potential at the origin.

The roulette simulations match well within the convergence ring.

What should concern us at the minute is the very small convergence ring 
for the unsampled roulette simulation.  This does look wrong.

## The number of Roulette terms

The roulette simulation is based on a truncated series, but we did
not pay attention to the number of terms retained above.
A potential problem is that only five terms have been analytically
computed for the SIE lens.  This may explain the poor performance.
Since numerical differentiation is fast, there is no issue in using many terms
in the sampled version.
We can set the number of terms as follows.

```{code-cell} ipython3
param["simulator"]["nterms"] = 5
param["simulator"]["model"] = "Roulette"
param["simulator"]["sampled"] = False
imsim = SimImage( param, verbose=0 )
imr = imsim.getImage()
plt.imshow( imr, cmap='gray')
plt.title( "Roulette with five terms" )
plt.axis("off")
```

This looks a great deal better.  The small triangles are obviously the spurious images forming around the convergence ring.
To see better, we can add an axis cross, which also tells us exactly where the lens is, at the origin.:::

::: {tip} imshow
It takes a cumbersome few line to show an image neatly with `pyplot`.
Let's switch to a convenience function from `CosmoSim` in the next block.
:::

```{code-cell} ipython3
import CosmoSim.Image as csimg
csimg.drawAxes( imr )
csimg.imshow( imr )
```

To see it all, we can plot all the four simulations.

```{code-cell} ipython3
param["source"]["mode"] = "Triangle"
(im1,im2,im3,im4) = quadSim( param )
```

The difference images are as follows (compared against sampled raytrace).

```{code-cell} ipython3
fig = plt.figure(figsize=(14,7))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(1, 3, 1)
plt.imshow( imageDiff( im1, im3 ), cmap='gray')
plt.title( "Raytrace Simulation" )
plt.axis("off")

fig.add_subplot(1, 3, 2)
plt.imshow( imageDiff( im2, im3 ), cmap='gray')
plt.title( "Roulette Simulation" )
plt.axis("off")
    
fig.add_subplot(1, 3, 3)
plt.imshow( imageDiff( im4, im3 ), cmap='gray')
plt.title( "Sampled Roulette Simulation" )
plt.axis("off")
```

This gives a much better match.  The sampled roulette has a little
noise compared to the unsampled versions, but this may just be due
to sampling and numerical error.

## Elliptic source

Finally, lets look at elliptic sources.  We reset the simulator to 
Raytrace and SIE, and change the source to `SersicEllipsoid`.

```{code-cell} ipython3
param["simulator"]["config"] = "raysie"
param["source"]["mode"] = "SersicEllipsoid"
(im1,im2,im3,im4) = quadSim( param )
```

We also compute the diff images

```{code-cell} ipython3
fig = plt.figure(figsize=(14,7))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(1, 3, 1)
plt.imshow( imageDiff( im1, im3 ), cmap='gray')
plt.title( "Raytrace Simulation" )
plt.axis("off")

fig.add_subplot(1, 3, 2)
plt.imshow( imageDiff( im2, im3 ), cmap='gray')
plt.title( "Roulette Simulation" )
plt.axis("off")
    
fig.add_subplot(1, 3, 3)
plt.imshow( imageDiff( im4, im3 ), cmap='gray')
plt.title( "Sampled Roulette Simulation" )
plt.axis("off")
```

It may also be interesting to rotate the source differently

```{code-cell} ipython3
print( param.get( ("source","theta") ) )
param["source"]["theta"] = 90
(im1,im2,im3,im4) = quadSim( param )
```

We observe that the original rotation of the source was 45°.
We changed it to 90°.

```{code-cell} ipython3
fig = plt.figure(figsize=(14,7))
fig.tight_layout(pad=0.0)
plt.subplots_adjust(hspace=0.1, wspace=0.1) 

fig.add_subplot(1, 3, 1)
plt.imshow( imageDiff( im1, im3 ), cmap='gray')
plt.title( "Raytrace Simulation" )
plt.axis("off")

fig.add_subplot(1, 3, 2)
plt.imshow( imageDiff( im2, im3 ), cmap='gray')
plt.title( "Roulette Simulation" )
plt.axis("off")
    
fig.add_subplot(1, 3, 3)
plt.imshow( imageDiff( im4, im3 ), cmap='gray')
plt.title( "Sampled Roulette Simulation" )
plt.axis("off")
```

As we can see, different rotations make a massive difference to the observed
image.  However, this source is extremely longated.

::: {tip}
To change the source size, we can use
```
param["source"]["sigma"] = 20
param["source"]["sigma2"] = 40
```
The parameter `sigma` refers to the standard deviation in a Gaussian
light profile.  Ellipsoid spheres have a size parameter along each axis,
hence `sigma` and `sigma2`.
:::

## Closure

We have demonstrated the four basic simulation modes here, roulette and raytrace
with and without sampling. This provides the cornerstone for further exploration.

We have also demonstrated some variation in sources, but we have still not discussed
what makes reasonable parameters for lenses and sources.

The only lens we have considered is SIE.  The other main alternative is SIS.
Point Mass lenses are also implemented but not as thoroughly tested with newer
features of CosmoSim. (As of 1 July 2026 with CosmoSim v3.1.0.)

```{code-cell} ipython3

```
