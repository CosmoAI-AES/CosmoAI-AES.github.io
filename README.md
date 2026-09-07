# CosmoSim Web Site


# Subtrees

```
git remote add testrepo git@github.com:CosmoAI-AES/cosmosim-test
git subtree add --prefix demo testrepo main
```

```
git subtree pull --prefix demo testrepo main
git subtree push --prefix=demo testrepo main

```

## PDF reports

PDF builds do not work properly.  Jupyter Book inserts a page break for
each file, disrupting the flow and wasting space.

Additionally there is a problem with inkscape, which is used for image
conversion, but this is circumventing by the following command.
```sh
export INKSCAPE_NO_DBUS=1
jupyter book build --pdf
```
