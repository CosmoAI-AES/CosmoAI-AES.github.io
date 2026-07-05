---
title: CosmoSim Workflows in github
---

# CosmoSim Workflows in github

CosmoSim is currently made to build and deploy as python
packages to be installed via pip.  Other build methods
work on some architectures, but python packaging is the
only one maintained for cross-platform use.

The following workflows are defined
+ `pypideploy.yml` deploys on the PyPI server
+ `pypitest.yml` deploys on the PyPI *test* server
+ `wheels.yml` build the python library (wheel)
+ `release.yml` (Make Release) calls `dist.yml`, creates a release,
  and uploads all the assets.
+ `regressiontest.yml` (Regression Test (Modular))
    + triggered on release (`v*` tag)
	+ output should be checked to validate the function on every platform
	+ triggered on branch feature/regressiontests
	+ can be triggered manually


