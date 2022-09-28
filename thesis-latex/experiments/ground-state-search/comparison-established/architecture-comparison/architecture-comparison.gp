set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 17cm       # sets output format, font and plotsize
set samples 500                                                                         # sets count for the amount of sampled points

set output "architecture-comparison.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key right top                                                       # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1                                                       # vertical spacing of entries

# colors 
tf="#fe3030"
gtfnn="#b70f0f"
gtfnnn="#6c0000"

gpfnn="#3fff3f"
gpfnnn="#0f980f"

gdcfnn="#6868ff"
gdcfnnn="#2525c1"

cnn="#f527fa"
rbm="#a207a5"

# plot
set datafile separator ','

set multiplot layout 1,2 rowsfirst

# axes and label
set xrange [0:220] 
set xtics 50
set mxtics 5
set format x "%.f";
set xlabel "steps"

set ylabel "E/L"
set yrange [-3.1:-0.7] 
set ytics 0.5
set mytics 5

plot \
    NaN with points pt 5 pointsize 0.6 lc rgb cnn       title " CNN", \
    NaN with points pt 5 pointsize 0.6 lc rgb rbm       title " RBM", \
    NaN with points pt 5 pointsize 0.6 lc rgb tf        title " TF", \
    NaN with points pt 5 pointsize 0.6 lc rgb gtfnn     title " GTF-NN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gtfnnn    title " GTF-NNN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gpfnn     title " GPF-NN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gpfnnn    title " GPF-NNN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gdcfnn    title " SGDCF-NN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gdcfnnn   title " SGDCF-NNN", \
     "energy-CNN.csv" using 2:3 notitle             pointtype 16 pointsize 0.4 linecolor rgb cnn, \
     "energy-RBM.csv" using 2:3 notitle             pointtype 16 pointsize 0.4 linecolor rgb rbm, \
     "energy-TF.csv" using 2:3 notitle              pointtype 16 pointsize 0.4 linecolor rgb tf, \
     "energy-GTF_NN.csv" using 2:3 notitle          pointtype 16 pointsize 0.4 linecolor rgb gtfnn, \
     "energy-GTF_NNN.csv" using 2:3 notitle         pointtype 16 pointsize 0.4 linecolor rgb gtfnnn, \
     "energy-GPF_NN.csv" using 2:3 notitle          pointtype 16 pointsize 0.4 linecolor rgb gpfnn, \
     "energy-GPF_NNN.csv" using 2:3 notitle         pointtype 16 pointsize 0.4 linecolor rgb gpfnnn, \
     "energy-SGDCF_NN.csv" using 2:3 notitle        pointtype 16 pointsize 0.4 linecolor rgb gdcfnn, \
     "energy-SGDCF_NNN.csv" using 2:3 notitle       pointtype 16 pointsize 0.4 linecolor rgb gdcfnnn

set xrange [0:800] 
set xtics 100
set mxtics 5

set logscale y 10
unset ylabel
set yrange [0.0005:10] 
set format y "";
set ytics log

set y2label "Var(E)/L"
set logscale y2 10
set y2range [0.0005:10] 
set format y2 "10^{%L}";
set y2tics log

# !! the csv files with the averaged data need to be compiled with the "average.py" python script before rendering the pdf
plot \
    NaN with points pt 5 pointsize 0.6 lc rgb cnn       title " CNN", \
    NaN with points pt 5 pointsize 0.6 lc rgb rbm       title " RBM", \
    NaN with points pt 5 pointsize 0.6 lc rgb tf        title " TF", \
    NaN with points pt 5 pointsize 0.6 lc rgb gtfnn     title " GTF-NN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gtfnnn    title " GTF-NNN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gpfnn     title " GPF-NN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gpfnnn    title " GPF-NNN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gdcfnn    title " SGDCF-NN", \
    NaN with points pt 5 pointsize 0.6 lc rgb gdcfnnn   title " SGDCF-NNN", \
     "avg-variance-CNN.csv" using 1:2 notitle             with lines pointsize 0.6 linecolor rgb cnn, \
     "avg-variance-RBM.csv" using 1:2 notitle             with lines pointsize 0.6 linecolor rgb rbm, \
     "avg-variance-TF.csv" using 1:2 notitle              with lines pointsize 0.6 linecolor rgb tf, \
     "avg-variance-GTF_NN.csv" using 1:2 notitle          with lines pointsize 0.6 linecolor rgb gtfnn, \
     "avg-variance-GTF_NNN.csv" using 1:2 notitle         with lines pointsize 0.6 linecolor rgb gtfnnn, \
     "avg-variance-GPF_NN.csv" using 1:2 notitle          with lines pointsize 0.6 linecolor rgb gpfnn, \
     "avg-variance-GPF_NNN.csv" using 1:2 notitle         with lines pointsize 0.6 linecolor rgb gpfnnn, \
     "avg-variance-SGDCF_NN.csv" using 1:2 notitle        with lines pointsize 0.6 linecolor rgb gdcfnn, \
     "avg-variance-SGDCF_NNN.csv" using 1:2 notitle       with lines pointsize 0.6 linecolor rgb gdcfnnn

