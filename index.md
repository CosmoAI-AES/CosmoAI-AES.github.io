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

+ [CosmoSim](https://github.com/CosmoAI-AES/CosmoSim) is a simulator of 
  gravitational lensing, supporting both an interactive and graphical 
  user interface, and a command line interface for bulk generation of images.
+ [droulette](https://github.com/CosmoAI-AES/droulette) is not publicly
  available as of March 2026, but will be made public in the future.
  It provides the plumbing code to apply machine learning to 
  images from CosmoSim.

**Warning!** These pages are under construction, and there will be
errors and inconsistencies.

## Using CosmoSim 

+ **Installation**  CosmoSim is a 
  [Python Package](https://pypi.org/project/CosmoSim)
  and can be installed with `pip install CosmoSim`.
+ [CosmoSim GUI](/docs/scripts/GUI),
  which is run as `python -m CosmoSim.GUI`.
+ [Machine Learning Pipeline](/docs/ML/Pipeline) with `droulette`
    + other details on [droulette](docs/droulette)
+ [User Tools](/docs/scripts/) for command line operation.

To understand the software, it will be necessary to have at least
a superficial understanding of the [](math/math).


## Publications

If you build on our work, please cite one of our  [](docs/Publications):

1. Hans Georg Schaathun, Ben David Normann, and Kenny Solevåg-Hoti. 
    [Om å kartleggja mørk materie med maskinlæring](https://www.ntnu.no/ojs/index.php/nikt/article/view/5666). 
    In *Norsk IKT-konferanse for forskning og utdanning*, number 1, 2023. 
2. Hans Georg Schaathun, Ben David Normann, Einar Leite Austnes, Simon Ingebrigtsen, Sondre Westbø Remøy, and Simon Nedreberg Runde. 
    [On the simulation of gravitational lensing](https://www.scs-europe.net/dlib/2023/2023-0141.html). 
    In Enrico Vicario, Romeo Bandinelli, Virginia Fani, and Michele Mastroianni, editors, 
    *Proceedings of the 30th European Conference on Modelling and Simulation*.
    ECMS - European Council for Modelling and Simulation, 2023. Florence, Italy, 21-23 June 2023. 
