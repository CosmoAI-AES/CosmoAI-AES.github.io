---
title: datagen script
---

# datagen script

The datagen submodule is the main simulator application.
Its main purpose is batch generation of distorted images.

```sh
python -m CosmoSim.datagen
```

## Simple batch mode

The simples run of the simulator specifies a CSV file with
parameters, and generates the distorted image for each row.
```sh
python -m CosmoSim.datagen --csvfile Dataset/debug.csv
```

### Some useful options

+ `--directory dir` : directory path for output files
+ `--maxcount n`:  Maximum number of images to generate
+ `--reflines` : Add reference (axes) lines to the image
+ `--criticalcurves` : Add critical curves to the distorted image
+ `--centred` : centre image on the centre of light
+ `--nterms` : Number of Roulettes terms
+ `--imagesize` : image size for calculations
+ `--cropsize` : Final image size
+ Masking (see [Roulette](/docs/model/Roulette) Masking
    + `--maskradius` : Set explicit masking radius
    + `--mask` : Mask out the convergence circle
    + `--showmask` : Mark the convergence circle
    + `--maskscale` : Scaling factor for the mask radius

## Extra output images

These options create additional image files at different stages
of the simulation

+ `--original` : Also write original image before centring
+ `--apparent` : write apparent image
+ `--actual` : write actual image

## Setting parameters on the command line

Parameters which are not set in the CSV file, can be set on the
command line.  The CSV file takes precedence though.

+ `--lensmode m` : lens model
+ `--modelmode m` : simulation model
+ `--sourcemode m` : source model
+ `--sampled` : Use sample lens model
+ `--config` : Configuration. Specifying Simulation and Lens Model together.
+ `--x x --y y` : Set the source position in Cartesian co-ordinates.
+ `--x x --phi phi` : Set the source position in Polar co-ordinates.
  If both `--y` and `--phi` are specified, `--y` takes precedence.
+ `--sigma` : source size (sigma)
+ `--sigma2` : secondary source size (sigma2) for elliptical sources
+ `--theta` : source rotation angle (theta)
+ `--chi` : lens distance ratio ($\chi$)
+ `--einsteinradius` : Einstein radius
+ `--ratio` : Ratio (usually Elliptic eccentricity) for the lens
+ `--orientation` : Orientation of the lens
+ `--outfile` : Output file for roulette amplitudes, see
  [Roulette Resimulation](Roulette Resimulation)

## Undocumented options 

These options are not used in current research and have not been tested in
recent versions, if they have been implemented at all.

+ `--name` : simulation name
+ Joining images
    + `--components n` : Number of components for joined image
    + `--join` : Join several images from different viewpoints
+ `--amplitudes` : Amplitudes input file
+ `--psiplot'` : Plot lens potential as 3D surface
+ `--kappaplot` : Plot mass distribution as 3D surface
+ `--family` : Several images moving the viewpoint
+ `--no-xireference` calculate roulette amplitudes in the centre of light,
  instead of the source centre
    + this does not change the expansion point used for simulation
      in `datagen.py`.
    + requires `--centred`, lest the origin be the origin and the model collapse
    + `--xireference` is the default, using the same expansion point
       as the original simulation.

It is also possible to generate a single image by ommitting the CSV file
and giving all parameters on the command line.
