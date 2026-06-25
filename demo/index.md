# CosmoSim demoes

These demoes are written in Jupyter notebook and demonstrate the
use of the CosmoSim API.
They can be downloaded and run, assuming CosmoSim v3 is installed.

```
pip install CosmoSim>=3.0.1b1 --upgrade
```

+ Fundamentals of the simulator 
    + [](Demo01.ipynb) shows the basic operation of the simulator.
    + [](Demo02Annotation.ipynb) shows how to annotate the simulated images with
      critical curves and key points. 
    + [](Demo03Resimulation.ipynb) sbows the principles of simulation from 
      roulette amplitudes.
+ Test of individual models.  These demos will primarily test that the different
  simulation models and implementations of the same lens give consistent results.
    + [](Pointmass.ipynb) 
    + [](SIS.ipynb) 
    + [](SIE.ipynb) 
+ Applications for machine learning 
    + [](Dataset.ipynb) shows how to generate datasets for machine learning.
    + [](ML/Testing.ipynb) shows how to generate datasets for machine learning.
    + See also [](/docs/ML/Pipeline).
+ Cluster lenses
    + [](./Cluster/Cluster01.ipynb) is the first test of cluster lenses
    + [](./Cluster/Testing.ipynb) tests machine learning on the cluster lenses

## Work in progress

+ [](RouletteML01.ipynb) demonstrates resimulation from roulette parameters.
