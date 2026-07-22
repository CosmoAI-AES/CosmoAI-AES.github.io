---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.19.4
kernelspec:
  name: python3
  display_name: Python 3 (ipykernel)
  language: python
---

(ml-pipeline)=
# Machine Learning Pipeline

The purpose of the CosmoSim project is to use machine learning
[Machine Learning](/user/MachineLearning.md) to do lens mass reconstruction
from images of lensed objects..

The `droulette` packages provides the tools for a pipeline for experiments
using `CosmoSim` data.  The codebase has not been made public yet.

::: {note} Requirement
This demo assumes droulette v0.2 which in turn requires CosmoSim v3.2.4.
```
pip install droulette==0.2
```
:::

The main principle for the pipeline is to use a TOML file for each
step, to define the data and parameters used.
The following pipeline trains and compares machine learning
models on the roulette amplitudes.  It can be adapted to
train for prediction of lens parameters.

## Training and testing a single model

**Step 1.** Generate a dataset
This is discussed in detail in [](Dataset.ipynb).

A typical command looks like this:
```sh
time python -m CosmoSim --toml dataset.toml --rnd \
         --csvfile dataset.csv --outfile roulette.csv  \
         --directory images 
```
This is the sample data dataset configuration: [dataset.toml](./dataset.toml).

The images are written to the directory specified.
Two CSV files are produced.
+ dataset.csv gives lens and source parameters
+ roulette.csv gives roulette parameters

**See also** discussion of
[Parameter ranges](../Dataset).

**Step 2.** Prepare the dataset for machine learning.

For machine learning, we need separate datasets for training, validation, and
testing, which are split from the base dataset.  We may also need roulette
simulations to use a ground truth for validation.  We generate these datasets
with the `droulette` package.
```sh
python -m droulette.split problem.toml
```
The sample file is [problem.toml](./problem.toml). We can have a look at it:

```{code-cell} ipython3
import json, tomllib as tl
with open( "problem.toml", 'rb') as f:
            toml = tl.load(f)
print( json.dumps( toml, indent=4 ) )
```

Observe that file and directory names are specified in the config file.

::: {note} Optional: Download models.
It is possible, but not required to pre-download the torch models to be used.
```sh
python -m droulette.predownload
```
This may be excessive when we only want to train one model.
:::

**Step 3.** Train models.
Finally we can train the models.

The default format trains the model in a subdirectory, to allow multiple models
of the same data.  Here we assume a subdirectory `experiment001`, containing
a configuration file [ml.toml](experiment001/ml.toml).  The file may look like this:

```{code-cell} ipython3
import tomllib as tl
with open( "experiment001/ml.toml", 'rb') as f:
            ml = tl.load(f)
print( json.dumps( ml, indent=4 ) )
```

To train the model, we run the command:
```sh
python -m droulette.model --config experiment001/ml.toml
```

All the results will be placed in this subdirectory.

**Step 4.**
Evaluation of these results is discussed further in 
[](experiment001/Testing.ipynb).

## Batch training

The droulette package also has support for batch traning multiple models
and comparing them.

**Step 2bis.** Generate machine learning configurations.

When the problem has been configured (Step 2), we can generate a batch
of different model configurations.
A sample master configuration is in [experimentbatch.toml](experimentbatch.toml).

The following command will generate subdirectories with individual TOML files 
from the given master configuration.
```sh
python -m droulette.batch experimentbatch.toml
```
Following this `droulette.model` (Step 3) can be run for each subdirectory,
e.g.
```sh
python -m droulette.batch Test/experimentbatch.toml
for cfg in _test/experiment???/ml.toml
do
   python -m droulette.model --config $cfg
done
```

**Step 3bis.** When all the models have been trained and tested,
we can make a joint evaluation with the following command.
```sh
time python -m droulette.eval -o eval.csv experiment??? 
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
