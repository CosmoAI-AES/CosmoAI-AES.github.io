#!/bin/sh
find demo -name "*.md" -print | grep -v index.md | grep -v README | grep -v checkpoints | xargs jupytext --sync --execute
