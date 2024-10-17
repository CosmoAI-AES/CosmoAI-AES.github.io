---
title: CosmoSim Software Model
theme: minima
permalink: /docs/Software
usemathjax: true
---

![CosmoSim Modules](software.svg)

The CosmoSim software suite consists of three layers.
1.  The simulator library, *simlib*
1.  The python wrapper, *CosmoSimPy*
1.  A range of executable python scripts, including the GUI
   `CosmoGUI.py` and the batch generator `datagen.py`.

The mathematical model is implemented in the simulator library, which
is consequently the most important part to document properly.


## Python modules

All python code is collected in the `CosmoSimPy` directory

+ CosmoSim
    + Python package wrapping the simulator library.
+ Arguments.py
    + Argument parser and other shared functions for the scripts.
