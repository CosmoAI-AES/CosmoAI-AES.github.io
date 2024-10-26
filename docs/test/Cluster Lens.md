---
title: Cluster Lens Tests
permalink: /docs/test/Cluster Lens
usemathjax: true
date: 2024-10-16
---

# Model Validation

+ **Directory** Tests/Cluster
+ **Purpose** validate cluster lenses by testing singleton clusters

```
cd Tests/Cluster
sh tutti.sh
```

This creates the montage directory (among others) comparing
singleton clusters with equivalent individual lenses.

# Exploration

```
cd Tests/Cluster
sh cluster.sh
```

This creates a few samples of clusters in the Cluster directory
as examples.  It is not yet clear how to evaluate these
