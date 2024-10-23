---
title: GUI Thread and Event Model
---

The CosmoSim object defines the following
+ Events
    + `updateEvent`
    + `simEvent`
+ Threads
    + `simThread`


The `simThread` (thread and function) loops. waiting for a `simEvent` 
to
1.  clear the event
2.  run the simulator (`runSim()` in the C++ code)
3.  set an `updateEvent` to trigger update of the GUI.

The `runSim()` function has a test to quit immediately if
it is already running.


