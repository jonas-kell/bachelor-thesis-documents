set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 12cm       # sets output format, font and plotsize
set samples 500                                                                         # sets count for the amount of sampled points

set output "encoding-comparison.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key right top                                                       # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1                                                       # vertical spacing of entries

# colors 
markerred="#AA0000"
markergreen="#00AA00"
markerblue="#0000AA"
markeryellow="#EEBE00"
linered="#FF9999"
linegreen="#77FF77"
lineblue="#9999FF"
lineyellow="#F6D140"

# plot
set datafile separator ','

set multiplot layout 2,1 rowsfirst

# axes and label
set xrange [0:500] 
set xtics 100
set mxtics 10
set format x "";

set x2range [0:500] 
set x2tics 100
set mx2tics 10
set x2label "steps"

set ylabel "E/L"
set yrange [-1.15:-0.65] 
set ytics 0.1
set mytics 5

set logscale y2 10
set y2label "Var(E)/L"
set y2range [0.0001:] 
set format y2 "10^{%L}";
set y2tics 10
set my2tics 10
set y2tics log

# plot 1,1
set label 1 "CNN" at graph 0.47,0.93
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " E, canonical", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred title " E, random", \
     NaN with points pt 5 pointsize 0.6 lc rgb linegreen title " Var(E), canonical", \
     NaN with points pt 5 pointsize 0.6 lc rgb linered title " Var(E), random", \
     "variance-CNN-random.csv" using 2:3 notitle      axis x1y2 pointtype 16 pointsize 0.4 linecolor rgb linered, \
     "variance-CNN-canonical.csv" using 2:3 notitle   axis x1y2 pointtype 16 pointsize 0.4 linecolor rgb linegreen, \
     "energy-CNN-random.csv" using 2:3 notitle        axis x1y1 pointtype 16 pointsize 0.4 linecolor rgb markerred, \
     "energy-CNN-canonical.csv" using 2:3 notitle     axis x1y1 pointtype 16 pointsize 0.4 linecolor rgb markergreen
# end plot 1,1

unset x2label
set format x2 "";
set xlabel "steps"
set format x "%.f";

# plot 1,2
set label 1 "SGDCF-NNN" at graph 0.42,0.93
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " E, canonical", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred title " E, random", \
     NaN with points pt 5 pointsize 0.6 lc rgb linegreen title " Var(E), canonical", \
     NaN with points pt 5 pointsize 0.6 lc rgb linered title " Var(E), random", \
     "variance-SGDCF_NNN-random.csv" using 2:3 notitle      axis x1y2 pointtype 16 pointsize 0.4 linecolor rgb linered, \
     "variance-SGDCF_NNN-canonical.csv" using 2:3 notitle   axis x1y2 pointtype 16 pointsize 0.4 linecolor rgb linegreen, \
     "energy-SGDCF_NNN-random.csv" using 2:3 notitle                  pointtype 16 pointsize 0.4 linecolor rgb markerred, \
     "energy-SGDCF_NNN-canonical.csv" using 2:3 notitle               pointtype 16 pointsize 0.4 linecolor rgb markergreen
# end plot 1,2

