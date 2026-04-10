---
title: Machine Learning Pipeline 
usemathjax: true
---


# The droulette package

The main use cases are documentet as the
[Machine Learning Pipeline](ML/Pipeline).
This page documents a few additional features.

## Training of individual models

Make a config TOML file, specifying the model and the hyperparamers.
An example is provided as Test/experiment01.toml

```sh
python -m droulette.model --config Test/experiment01.toml
```

+ Data is generated  in the directory specified in the TOML file.
+ In particular, the trained model is stored (model.pth) to be able
  to make additional analyses

## Plot training development

To plot the development of the loss function over epochs, the following
module can be used.  In batch, it creates a plot file `training.svg`
from the `training_log.csv` files in each directory.

```sh
python -m droulette.diagnostic --alldirs _test/experiment???
```

It can also be run on individual log files, without the `--alldirs` option.

