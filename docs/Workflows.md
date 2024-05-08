---
title: CosmoSim Workflows in github
---


# CosmoSim Workflows in github

The following workflows are defined

+ On push to develop or master: `trial-run.yml`
    + This builds the system for Windows and Linux, using one configuration for each.
    + It also verifies that the CLI tool runs without parameters.
+ The release workflow: `release.yml`
    + This is run on a push to a tag prefixed by `v`; e.g. `git push origin v0.1.1`
    + It creates all artifacts and uploads them to the release.
+ Manually triggered workflows 
    + `build-all.yml` builds on several configurations on Linux and Windows
    + `darwin.yml` builds for MacOS but does not presently work.
    + `regressiontest.yml` (Regression Test (Modular))
        + triggered on release (`v*` tag)
	    + output should be checked to validate the function on every platform
	+ triggered on branch feature/regressiontests
	+ can be triggered manually
+ Deprecated workflows
    + `test.yml` is a simple test used when learning workflows.  Not to be used.
    + `comprehensive-test.yml` runs the regression test on several builds.
        + It currently works on Linux.
        + It fails on Windows because Sobel is not defined in simaux.cpp
	+ **superseded** by `regressiontest.yml`

# The Trial Build

The following configurations are currently tested by the
Trial Build.

| Python        | 3.9  | 3.10 | 3.11 | 3.12 |
| :-            | :-   | :-   | :-   | :-   |
| Windows-2022  | -    | OK   | OK   | Fails |
| Ubuntu 20.04  | (OK) | -    | -    | OK   |
| Ubuntu 22.04  | (OK) | OK   | OK   | OK   |
| MacOS 12      | -    | OK   | OK+App| Fails |
| MacOS 14      | -    | Fails | OK+App | Fails |

+ OK:   *works and tested in the Stable Trial Build*
+ OK+App:   *also builds app; Stable Trial Build*
+ (OK): *used to work, but it is no longer validated*
+ TBC: *successful test, but not yet added to the trial build*
+ Fails: *failed and currently no solution*
+ -: *not documented*

Note that MacOS-12 used compiler.version 14 and MacOS-15 uses 15.
In thw workflow, conan is configured to be compatible with other
defaults, so it could probably be changed, but not trivially.
