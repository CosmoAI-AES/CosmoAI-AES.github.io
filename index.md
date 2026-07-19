---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
---

# Mapping Dark Matter via Gravitational Lensing

[CosmoAI-AES](https://github.com/CosmoAI-AES)
is an inter-disciplinary research group at the Department of ICT and 
Natural Sciences at NTNU in Ålesund, working on gravitational lensing.

+ [Professor Hans Georg Schaathun](http://www.hg.schaathun.net/)
  is a computer scientist working on simulation and machine learning
+ [Dr Ben David Normann](https://www.bendavidnormann.com/research)
  is a mathematical physicist working on cosmology

These pages present prototypes for two pieces of software.

+ [CosmoSim](https://github.com/CosmoAI-AES/CosmoSim.md) is a simulator of 
  gravitational lensing, supporting both an interactive and graphical 
  user interface, and a command line interface for bulk generation of images.
+ [droulette](https://github.com/CosmoAI-AES/droulette.md) is not yet open source,
  but v0.1 has been released on PyPI.  It will become Open Source in the future.
  It provides the plumbing code to apply machine learning to 
  images from CosmoSim.

**Warning!** These pages are under construction, and there will be
errors and inconsistencies.

## Current version

The current stable version is v3.1.

There are beta releases of v3.2, with simplified code, removing some 
redundant legacy models.  However, the refactoring of the GUI is not
complete, and at least the GUI is not stable.

## Using CosmoSim 

+ **Installation**  CosmoSim is a 
  [Python Package](https://pypi.org/project/CosmoSim.md)
  and can be installed with `pip install CosmoSim`.
+ [CosmoSim GUI](/docs/scripts/GUI.md),
  which is run as `python -m CosmoSim.GUI`.
+ [CosmoSim Demos](/demo/index.md) exemplify intended workflows for
  testing the simulator, comparing simulation and lens models, and
  training and testing of machine learning models.
  Most of the demos use the API in  Jupyter Notebook.  Some depend
  on command line operation.

To understand the software, it will be necessary to have at least
a superficial understanding of the [](math/math.md).

## Documentation

+ [](math/math.md)
+ [](/user/user.md)

## Publications

We presented the first prototype at ECMS in 2023 [@hgs2023ecms], and a white paper
on the overall approach later the same year, in Norwegian [@schaathun2023].
More recently we have made a survey on gravitational lensing [@normann2025short].

MSc theses publicly available by @hanssen2024msc, @enoksen2026msc

