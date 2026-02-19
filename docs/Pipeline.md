---
title: Machine Learning Pipeline 
---

# Machine Learning Pipeline

The `droulette` project aims to define a pipeline for experiments
using `CosmoSim` data.  The codebase has not been made public yet.

The min principle for the pipeline is to use a TOML file for each
step, to define the data and parameters used.

See also older notes on [Machine Learning Examples](scripts/MachineLearningExamples).

## Dataset generation

Dataset is generated using
```sh
python3 -m CosmoSim.datagen --toml dataset.toml --csvfile dataset.csv \
        --outfile roulette.csv --directory images -C
```

The TOML file specifies the probability distribution of the generated
lens/source systems.
The following example illustrates the idea.
For complete and up-to-date examples, one should look in the
`CosmoSim` distribution.

```toml
[simulator]
configs = [ "raysie", "rs" ]
size = 1000
nterms = 5

[lens]
chi = 50
einstein-min = 10
einstein-max = 50

[source]
mode = "e"
sigma-min = 1
sigma-max = 60
sigma2-min = 1
sigma2-max = 40
theta-min = 0
theta-max = 179
position = "polar"

[position]
phi-min = 0
phi-max = 359
r-min = "einsteinR"
r-max = 100
```

Note
+ the `-C` flag is important.  It centres the image to avoid leaking information
  through the choice of origin.
+ `-Z n` can be added to choose image size $n\times n$

## Dataset formatting

**TODO**

```toml
[problem]
filename = "_test/dataset.csv"
variables = [ "sigma", "xiX", "xiY" ]
nterms = 5

[dataset.training]
filename = "_test/training.csv"
size = 0.7

[dataset.validation]
filename = "_test/validation.csv"
size = 0.15

[dataset.testing]
filename = "_test/testing.csv"
```

## Machine Learning

A machine learning model can be trained and tested using this command.
```sh
python -m droulette.model --config Test/experiment01.toml
```

The TOML file specifies the ANN model and hyperparameters.

```toml
[settings]
device = "cuda"
model = "wide_resnet50_2"

[hyperparameters]
learning-rate = 1e-4
batch-size = 96
weight-decay = 1e-4

[training]
num-epochs = 1000
patience = 10
out-parameters = 23

[dataset]
directory = "_test/images"
training.filename = "_test/train.csv"
testing.filename = "_test/test.csv"
validation.filename = "_test/validation.csv"
```
