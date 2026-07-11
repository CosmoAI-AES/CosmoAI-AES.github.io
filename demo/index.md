# CosmoSim demos

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
        + [](ResimulationTemplate.ipynb) gives a simplified template
          for reuse, removing most of the discussion.
+ Lens models.  These demos will primarily test that the different
  simulation models and implementations of the same lens give consistent results.
    + [](Pointmass.ipynb) 
    + [](SIS.ipynb) 
    + [](SIE.ipynb) 
+ [](ML/index.md) covers the generation of datasets and training and testing
  of machine learning models.
+ [](Cluster/Cluster01.ipynb) discusses cluster lenses
+ [](amplitudes/AmplitudeFile.md)
+ [](RouletteStatistics.ipynb)
+ [Experiments 2026](http://cosmoai-aes.github.io/experiment2026july/).
  Showcase of a series of experiments, including both tutorial demonstrations
  and reports on the results.

