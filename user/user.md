# User Documentation

The easiest tool to get started with is the [](GUI.md).

The proposed pipeline for [](/docs/ML/MachineLearning) is probably the best
starting point for using the command line interface and batch simulation.

Version 3.0 provides an API to use the simulator from Jupyter
Notebook or custom scripts.
See [](/demo/index).

## Physical interpretation

As of veresion 3.0.0, CosmoSim assumes angular units for the models.
This makes all units, such as source possition and Einstein radius,
comparable and independent of the distance from the observer.

As a rule of thumb, it is suggested to let one pixel correspond to 0.04
seconds of arc, but this is arbitrary from a simulation viewpoint, and
may be adjusted to align with observational images.
