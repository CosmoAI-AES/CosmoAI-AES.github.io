---
title: CosmoSim Scripts
theme: minima
usemathjax: true
---

# CosmoSim on the Command Line 

The CosmoSim module is executable (as of version 3.0.0),
providing several modes of operation.
+ `python -m CosmoSim --version` shows version information and exits.
+ `python -m CosmoSim --rnd --toml infile  --csvfile outfile ...` 
  does bulk simulation, generating random parameters based on the
  specification in the `infile`.
+ `python -m CosmoSim --csvfile fn ...` (without `--rnd`)
  does bulk simulation using the given set of parameters.
+ `python -m CosmoSim --roulette fn ...` 
  does roulette resimulation using amplitudes from the given file.

The dataset generation (`rnd`) can also be accessed separately:
+ `CosmoSim.dataset`
    + random generation of parameters for data sets
    + the output is a CSV file to be read by `datagen.py`
    + **TODO** further documentation

+ In version 2.x, the main functionality was split between two scripts
    + [`CosmoSim.datagen`](datagen%20script) is the main CLI tool 
        + bulk generation of images
    + `CosmoSim.roulettegen`  [](Roulette%20Resimulation)
        + generate images from a set of roulette amplitudes

## Other scripts

+ compare.py
    + Quantitatively compare two batches of images, intended for regression testing.
+ amplitudes.py
    + Generate a file with roulette amplitudes for the SIS lens.
    + For **development use** only
    + The generated files are included in the release packages and found by the
      library.

## Source Models Supported

The following names should be used to specify the source.
Other names are defined, but will be deprecated.

+ `"Spherical"` : Gaussian light distribution
+ `"Ellipsoid"` : Ellipsoid source with Gaussian distribution
+ `"SersicSphere"` : Spherical Source with Sersic profile
+ `"SersicEllipsoid"` : Ellipsoid source with Sersic profile
+ `"Triangle"` - a coloured triangle, for better visualisation of
  distortion effects
+ `"Image (Einstein)"` - a portrait of Einstein, for fun
  
## Lens and Simulation Models Supported


| Display name | Lens | Simulation | Sampled | Alias |
| :-           |  :-  |   :-       |  :-     | Alias |
| `"Point Mass (exact)"` | Point Mass | Exact (PM) | No | `"p"` |
| `"Point Mass (roulettes)"` | Point Mass | Roulette (PM)[^pm] | No | `"r"` |
| `"Sampled Roulette SIS"` | SIS | Roulette | Yes | `"ss"` |
| `"Sampled Roulette SIE"` | SIE | Roulette | Yes | `"srousie"` |
| `"Sampled Raytrace SIS"` | SIS | Raytrace | Yes | `"pss"` |
| `"Sampled Raytrace SIE"` | SIE | Raytrace | Yes | `"sraysie"` |
| `"Roulette SIS"` | SIS | Roulette | No | `"fs"` |
| `"Roulette SIE"` | SIE | Roulette | No | `"rousie"` |
| `"Raytrace SIS"` | SIS | Raytrace | No | `"rs"` |
| `"Raytrace SIE"` | SIE | Raytrace | No | `"raysie"` |

The display names are used in the GUI and should be used whereever
spaces do not confuse the parser.  The alias can be used in data files
where space may cause problems.

[^pm]: Roulette simulation for point mass lenses is implemented as a special 
       case and does not use the generic roulette simulator.
