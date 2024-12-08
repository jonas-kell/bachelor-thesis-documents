# Bachelor-Thesis: Investigation of transformer architectures for geometrical graph structures and their application to two-dimensional spin systems

The work for my Bachelors-Thesis is split into multiple repositories (links for quick access, it may be possible that the repo is private).

-   [Main Latex Document and Markdown Notes](https://github.com/jonas-kell/bachelor-thesis-documents)
-   [Experimental Code, Tests and Library-Setup](https://github.com/jonas-kell/bachelor-thesis-experiments)
-   [Final Code/Scripts/Results](https://github.com/jonas-kell/bachelor-thesis-code)

## Pre-compiled Document

The precompiled version of the thesis is available [HERE](./Investigation%20of%20transformer%20architectures%20for%20geometrical%20graph%20structures%20-%20Bachelor%20Thesis%20Jonas%20Kell.pdf).

## Submodules

The code that gets referenced in the thesis is managed via git-submodules and needed for building the document. Make sure to initialize the submodules before building

```cmd
git submodule init
git pull --recurse-submodules
```

## Compiling

To compile the documents, run

```shell
PUID=`id -u` PGID=`id -g` docker compose up
```
