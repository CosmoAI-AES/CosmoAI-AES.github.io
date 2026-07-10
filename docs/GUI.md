---
title: GUI control flow 
---

(GUI-architecture)=
# The GUI architecture

The `CosmoSim` class from `CosmoSim.GUI.CosmoSim` sets up
the simulator environment for the GUI.
This provides two features which are critical for the GUI,
1.  Threading to allow the simulator to run without holding up
    the GUI.
2.  Interface to change lens and simulator parameters without
    reinstantiating the objects.

## Thread and Event Model

The CosmoSim class makes sure that only one call to run the  simulator 
is made at the time, and that it is rerun if the parameters has changed
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
