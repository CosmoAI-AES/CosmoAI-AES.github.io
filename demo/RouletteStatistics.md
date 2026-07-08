---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.19.3
kernelspec:
  name: python3
  display_name: Python 3 (ipykernel)
  language: python
---

# Roulette Statistics

This demo will show the distribution of roulette amplitudes.
Higher-order amplitudes are always small, and other analyses may have to take this into account.

We will only need pandas and submodule to parse roulette amplitudes from `CosmoSim`.

```{code-cell} ipython3
import pandas as pd
from CosmoSim.RouletteAmplitudes import RouletteAmplitudes 
```

We will look at the roulette amplitudes already produced for the machine learning demo, so we simply load the dataset as a pandas *DataFrame*.

```{code-cell} ipython3
filename = "ML/roulette.csv"
dataset = pd.read_csv( filename )
ramp = RouletteAmplitudes( dataset.columns )
```

The `RouletteAmplitudes` class gives us a method to check the number of roulette amplitudes, that is the maximum order $m$.

```{code-cell} ipython3
print( ramp.getNterms() )
```

This is a bit rich, so we set our own limit, say 5.
Feel free to change it.

```{code-cell} ipython3
maxm = 5
```

Now we can run through $m$ and $s$ to compute the mean and standard deviation for each amplitude, as follows.

```{code-cell} ipython3
ls = []
for m in range(maxm+1):
    for s in range((m+1)%2,m+2,2):
        avg = dataset[f"alpha[{m}][{s}]"].mean()
        sd = dataset[f"alpha[{m}][{s}]"].std()
        s = pd.Series( { "$m$" : m
                       , "$s$" : s
                       , "$\\bar\\alpha$" : avg
                       , "$s_\\alpha$" : sd
                       , "$\\bar\\beta$" : dataset[f"beta[{m}][{s}]"].mean()
                       , "$s_\\beta$" : dataset[f"beta[{m}][{s}]"].std()
                       } )
        ls.append( s )
df = pd.DataFrame( ls )
df["$m$"] = df["$m$"].astype(int)
df["$s$"] = df["$s$"].astype(int)
display( df )
```

We will leave the analysis for others; just observe that $\beta_0^m=0$ for all $m$, which can be shown theoretically too.
