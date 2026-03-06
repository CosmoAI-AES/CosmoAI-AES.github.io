---
title: Machine Learning Pipeline 
usemathjax: true
---

# Machine Learning Pipeline

The purpose of the CosmoSim project is to use machine learning
[Machine Learning](MachineLearning) to do lens mass reconstruction
from images of lensed objects..

The `droulette` packages provides the tools for a pipeline for experiments
using `CosmoSim` data.  The codebase has not been made public yet.

The main principle for the pipeline is to use a TOML file for each
step, to define the data and parameters used.


The following pipeline trains and compares machine learning
models on the roulette amplitudes.  It can be adapted to
train for prediction of lens parameters.

## (1) Installation

The `droulette` package must be installed from source.
See README in the source package.
Installation of droulette implies CosmoSim as a dependency.


## (2) Dataset generation

The dataset is randomly generated from a TOML file describing
the distribution.  This is done using CosmoSim as follows:
```sh
python3 -m CosmoSim.datagen --toml dataset.toml --csvfile dataset.csv \
        --outfile roulette.csv --directory images -C
```

Sample TOML files are found in the source code.
If machine learning is to be applied to the lens parameters,
only one lens model should be used.
The same applies to source parameters.
If machine learning is to be applied to roulette parameters,
different lens models may be included.


The images are written to the directory specified.
Two CSV files are produced.
+ dataset.csv gives lens and source parameters
+ roulette.csv gives roulette parameters

**Note**
that the `-C` flag is critical.
It centres the image to avoid leaking information
through the choice of origin.


### (3) Prepare roulette data for machine learning

The machine learning routines require dataset files with no redundant
columns, and split into training, testing, and validation sets.
This can be done with the split module.

```sh
python -m droulette.split Test/problem.toml
```

The TOML file specifies which variables to include and the filenames
and sizes for the different sets.

The `split` module also does roulete resimulation if problem$\to$settings
is defined in the TOML file.

### (4) Prepare machine learning models (optional)

To download pretrained torch models $\to$ `_test/torch_cache`

```sh
python -m droulette.predownload
```

### (5)  Batch training

It is often interesting to train many models for comparison.
It is possible to define a batch of experiments in a TOML file,
and use the `droulette.batch` module to generate the individual
TOML files for each configuration.  One can then use one SLURM
array job to train all the models.

The following example generates experiments from a batch and
trains the first model only.
```sh
python -m droulette.batch Test/experimentbatch.toml
for cfg in _test/experiment???/ml.toml
do
   python -m droulette.model --config $cfg
done
```

### (6)  Comparison

Comparison presumes a batch run, and can be done using
```sh
python -m droulette.eval -o test.csv _test/experiment???
```
This collects performance heuristics for the models in each of
the directories given, and writes them to the given CSV file.

Currently, the statistics computed are
+ Loss function (MSE on scaled data)
+ $R^2$
+ MAE, averaged over the images

Additionally other files are created in each indivual directory.
+ the loss function is evaluated for each item and
  written to separate files in each experiment directory.
+ A plot file `training.svg` plots the loss as a function of epoch,
  as derived from `training_log.csv`.
+ MAE (mean average error) between the resimulated and original images

For MAE calculation, all the images are resimulated in the roulette
formalism, and the resulting images are stored in the resimulation
subdirectory.

