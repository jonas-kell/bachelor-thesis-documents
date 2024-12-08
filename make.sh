#!/bin/bash

if [ ! -f /.dockerenv ]; then
  echo "This script must be run with the provided docker-compose infrastructure"
  exit 1
fi

# Ensure this code runs on script exit
trap 'echo "Setting ownership of the files in this folder back to executing user"; cleanup_function' EXIT
cleanup_function() {
  sudo chown -R $(id -u):$(id -g) .
}

# Change the working directory to the script's directory
cd "$(dirname "$0")"

echo "Generating Gnuplots"

plotfiles=(
              "./thesis-latex/experiments/ground-state-search/differences-phase-diagram/performance-across-phase/performance-across-phase.gp"
              "./thesis-latex/experiments/ground-state-search/differences-phase-diagram/phase-transition/phase-transition.gp"
              "./thesis-latex/experiments/ground-state-search/comparison-established/architecture-comparison/architecture-comparison.gp"
              "./thesis-latex/experiments/ground-state-search/resiliency-encoding/encoding-comparison/encoding-comparison.gp"
              "./thesis-latex/experiments/ground-state-search/ansatz/hyperparameter-matrix/hyperparameter-matrix.gp"
              "./thesis-latex/experiments/image-classification/positional-encoding/pe-comparison/pe-comparison.gp"
              "./thesis-latex/experiments/image-classification/training-settings/optimizer/optimizer.gp"
              "./thesis-latex/experiments/image-classification/training-settings/metrics/metrics.gp"
              "./thesis-latex/experiments/image-classification/comparison-token-mixers/overall-comp/overall-comp.gp"
              "./thesis-latex/experiments/image-classification/comparison-token-mixers/graph-conv/graph-conv.gp"
)

for plotfile in "${plotfiles[@]}"; do
    (
        # Get the directory and filename
        dir=$(dirname "$plotfile")
        file=$(basename "$plotfile")

        # Change to the directory of the file
        cd "$dir" || exit

        # Run gnuplot on the filename
        gnuplot "$file"
    )
done

# echo "Compiling Main Thesis"
(cd thesis-latex; sudo --preserve-env=PATH env latexmk --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=. bachelor-thesis-jonas-kell.tex)
