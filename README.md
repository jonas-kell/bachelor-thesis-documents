# Bachelor-Thesis: Investigation of transformer architectures for geometrical graph structures and their application to two-dimensional spin systems

The work for my Bachelors-Thesis is split into multiple repositories (links for quick access, it may be possible that the repo is private).

-   [Main Latex Document and Markdown Notes](https://github.com/jonas-kell/bachelor-thesis-documents)
-   [Experimental Code, Tests and Library-Setup](https://github.com/jonas-kell/bachelor-thesis-experiments)
-   [Final Code/Scripts/Results](https://github.com/jonas-kell/bachelor-thesis-code)

# Pre-compiled Document

The precompiled version of the thesis is available [Here](./Investigation%20of%20transformer%20architectures%20for%20geometrical%20graph%20structures%20-%20Bachelor%20Thesis%20Jonas%20Kell.pdf)

# Submodules

The code that gets referenced in the thesis is managed via git-submodules and needed for building the document. Make sure to initialize the submodules before building

```cmd
git submodule init
git pull --recurse-submodules
```

# Compiling

To compile the document, run

```cmd
cd thesis-latex/
pdflatex --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error bachelor-thesis-jonas-kell.tex
biber bachelor-thesis-jonas-kell
pdflatex --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error bachelor-thesis-jonas-kell.tex
pdflatex --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error bachelor-thesis-jonas-kell.tex
```

You need a working LaTeX-installation. (Best **texlive-full**, because lots of packages are used)

The libertinus font family need to be available on the system. ([GitHub](https://github.com/alerque/libertinus))

You need [Python](https://www.python.org/) (best is Python 3, use lower two commands) and [Minted](https://ctan.org/pkg/minted?lang=de)

```cmd
python --version
pip install Pygments

python3 --version
pip3 install Pygments
```

# Gnuplot

The graphs in the experiments section are compiled with [gnuplot](http://www.gnuplot.info/).

Compilation:

```cmd
gnuplot <filename>.gp
```
