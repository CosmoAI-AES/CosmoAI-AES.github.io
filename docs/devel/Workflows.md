---
title: CosmoSim Workflows in github
---


# CosmoSim Workflows in github

The following workflows are defined


## Production pipeline

The following configurations are currently tested and released.

| Python        | 3.9  | 3.10 | 3.11 | 3.12 |
| :-            | :-   | :-   | :-   | :-   |
| Windows-2022  | -    | OK   | OK   | OK |
| Ubuntu 20.04  | (OK) | -    | -    | OK   |
| Ubuntu 22.04  | (OK) | OK   | OK   | OK   |
| MacOS 12/x86  | -    | OK      | App[^mac12]  | (OK) |
| MacOS 14/arm64 | -    | Fails | OK+App | OK |

+ OK:   *works and tested*
+ App:   *desktop app*
+ (OK): *used to work, but it is no longer validated*
+ TBC: *successful test, but not yet added to build*
+ Fails: *failed and currently no solution*
+ -: *not documented*

[^mac12]:
    It is possible to build the library for MacOS 12 and x86, 
    but the file name is the same as for MacOS 14/arm64 so they
    cannot be distributed in the same asset.

Note that MacOS-12 used compiler.version 14 and MacOS-15 uses 15.
In thw workflow, conan is configured to be compatible with other
defaults, so it could probably be changed, but not trivially.

The workflow pipline consists of the following workflows.
+ `pypideploy.yml` deployes on the PyPI server
+ `pypitest.yml` deployes on the PyPI *test* server
+ `wheels.yml` build the python library (wheel)
+ `release.yml` (Make Release) calls `dist.yml`, creates a release,
  and uploads all the assets.


## Workflows for testing

+ `regressiontest.yml` (Regression Test (Modular))
    + triggered on release (`v*` tag)
	+ output should be checked to validate the function on every platform
	+ triggered on branch feature/regressiontests
	+ can be triggered manually

