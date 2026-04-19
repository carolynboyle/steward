# pyproject.toml

**Path:** pyproject.toml
**Syntax:** toml
**Generated:** 2026-04-19 15:48:51

```toml
[build-system]
requires = ["setuptools>=68", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "steward"
version = "0.1.0"
description = "Database stewardship tools — schema management and init scripts"
authors = [
    { name = "Carolyn Boyle" }
]
readme = "README.md"
requires-python = ">=3.11"
dependencies = [
    "paramiko>=3.0",
    "pyyaml>=6.0",
]

[tool.setuptools.packages.find]
where = ["."]
include = ["steward*"]
```
