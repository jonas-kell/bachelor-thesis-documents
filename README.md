# Bachelor-Thesis: Investigation of transformer architectures for geometrical graph structures and their application to two dimensional spin systems

The work for my Bachelors-Thesis is split into multiple repositories (links for quick access, it may be possible that the repo is private).

-   [Main Latex Document and Markdown Notes](https://github.com/jonas-kell/bachelor-thesis-documents)
-   [Experimental Code, Tests and Library-Setup](https://github.com/jonas-kell/bachelor-thesis-experiments)
-   [Final Code/Scripts/Results](https://github.com/jonas-kell/bachelor-thesis-code)

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

You need [Python](https://www.python.org/) (best is Python 3, use lower two commands) and [Minted](https://ctan.org/pkg/minted?lang=de)

```cmd
python --version
pip install Pygments

python3 --version
pip3 install Pygments
```
