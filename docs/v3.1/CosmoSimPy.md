---
title: CosmoSimPy - The Python Bindings
---

# CosmoSimPy - The Python Bindings

The `CosmoSim` class provides the core interface to
manage simulations.  There are two classes of the same
name; a parent class written in C++ and a derived class
written in Python.

## History and Rationale

The Python wrappers are designed to support both the GUI
and the batch generation.  The GUI requires interactive
parameter tuning and real time responsiveness.  It is not
necessarily ideal to use the same structure for both GUI and
batch, but in the early prototyping stages, we did not have the
capacity to maintain two separate strains.

Originally, only one class was wrapped for Python, `CosmoSim`.
This was simply to avoid all the plumbing code for the bindigs,
but as the configuration options increased, this became cumbersome.
When multiple sources and cluster lenses were introduced, these would
be constructed from the python code, requiring bindings also for Lens
and Source classes.

The current separation of responsibilities between Python and C++ is
inconsistent, and more code should be moved from C++ to Python.  This
is work in progress.

## Thread and Event Model

This thread and event model is created to allow interactive
parameter changes while the simulator is running.  The model
makes sure that only one call to run the simulator is made
at the time, and that it is rerun if the parameters has changed
while running.

The CosmoSim object defines the following
+ Events
    + `updateEvent`
    + `simEvent`
+ Threads
    + `simThread`

The `simThread` (thread and function) loops. waiting for a `simEvent` 
to
1.  clear the event
2.  run the simulator (`runSim()`) in the C++ code).
3.  set an `updateEvent` to trigger update of the GUI.

To avoid race conditions, it is critical that `runSim()` is only
ever run from the `simThread`.  To call the simulator, the
`runSimulator()` method should be used instead.  This function
simply sets the `simEvent`.

There is a thin python wrapper to the `runSim()` method.  All it does
is to snapshot the source model as an attribute, to prevent it from
being garbage collected while the simulator is running.
