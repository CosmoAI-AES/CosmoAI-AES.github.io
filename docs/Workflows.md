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
+ `build-production.yml` (Build for Release)
  builds the software according to the table above.
+ `dist.yml` (Make Python Distribution) calls
  `build-production.yml` and packs up the python code with
  all the compiled libraries.
+ `release.yml` (Make Release) calls `dist.yml`, creates a release,
  and uploads all the assets.
+ `release-test.yml` (Test Release) is identical to `release.yml`
  except that it marks the release
  as draft and is triggered by other tags.

## Workflows for testing

+ On push to develop or master: `trial-run.yml`
    + This builds only on Linux, as a simple validation
    + It also verifies that the CLI tool runs without parameters.
+ Manually triggered workflows 
    + `regressiontest.yml` (Regression Test (Modular))
        + triggered on release (`v*` tag)
	    + output should be checked to validate the function on every platform
	+ triggered on branch feature/regressiontests
	+ can be triggered manually
+ `python312.yml` to debug build with Python 3.12 on Windows and MacOS.

## Deprecated workflows

+ `test.yml` is a simple test used when learning workflows.  Not to be used.
+ `comprehensive-test.yml` runs the regression test on several builds.
    + It currently works on Linux.
    + It fails on Windows because Sobel is not defined in simaux.cpp
    + superseded by `regressiontest.yml`
+ `darwin.yml` used to debug the build for MacOS
+ `build-all.yml` builds on several configurations on Linux and Windows
    + superseded by `build-production.yml`
