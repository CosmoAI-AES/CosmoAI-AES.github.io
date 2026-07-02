# Training and testing a single model.

It is possible to run machine learning through Jupyter Notebook,
but I would not recommend it.  It takes a long time, and it is
generally better to run it in the background, from the command line.
here, I will outline the process as I have used it.

**Step 1.** Generate a dataset
This is discussed in detail in [](Dataset.ipynb).

A typical command looks like this:
```sh
time python -m CosmoSim --toml dataset.toml --rnd \
         --csvfile dataset.csv --outfile roulette.csv  \
         --directory images 
```
This is the sample data dataset configuration: [dataset.toml](./dataset.toml).

**Step 2.** Split the dataset.
We have to split the dataset into separate sets and also create the roulette
amplitudes for which we train the model.
This is the command:
```sh
python -m droulette.split problem.toml
```
The sample file is [problem.toml](./problem.toml). We can have a look at it:
```{code-cell} ipython3
import tomllib as tl
with open( "problem.toml", 'rb') as f:
            toml = tl.load(f)
print( json.dumps( toml, indent=4 ) )
```

**Step 3.** Download models.
It is generally a good idea to pre-download the neural networks to be trained.
```sh
python -m droulette.predownload
```

**Step 4.** Train models.
Finally we can train the models.
The configuration for machine learning should be placed in a subdirectory
and called `ml.toml`.  This could look like this

```{code-cell} ipython3
import tomllib as tl
with open( "experiment001/ml.toml", 'rb') as f:
            ml = tl.load(f)
print( json.dumps( ml, indent=4 ) )
```

To run the training in subdirectory `experiment001`, we run
the command:
```sh
python -m droulette.model --config experiment001
```

All the results will be placed in this subdirectory.
Evaluation of these results is discussed further in [](experiment/Testing.ipynb).

::: {tip}
The droulette package also has support for batch traning multiple models
and comparing them.

This command will generate subdirectories with individual TOML files from
the given master configuration.
```sh
python -m droulette.batch experimentbatch.toml
```
Following this `droulette.model` can be run for each subdirectory.

To evaluate all the models and compare them, this command does the job:
```sh
time python -m droulette.eval -o eval.csv experiment??? 
```

This will be better documented in the future.
:::
