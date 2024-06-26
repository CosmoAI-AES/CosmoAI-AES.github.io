---
title: CosmoSim Release Process
---

# CosmoSim Release Process

This process is crude, but sufficient for a single developer.
It should be reconsidered if a team is formed.

+ Branches
    + develop is the main development branch
    + release/X.Y should be made for each minor release
        + new features and bug fixes are merged into each appropriate release
	  branch when they are approved.
    + master should always be aligned with the last stable release
+ Tags
    + vX.Y.Z tag is made for each release
    + test-release-* can be made to make a test or draft release
        + the workflow for ordinary and test releases is the same, except that the latter is tagged as draft

When a tag prefixed by v is pushed to github, a workflow is triggered to make the release.
This will build the system for linux and windows and create downloadable assets.

