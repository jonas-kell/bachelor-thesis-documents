set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 11cm       # sets output format, font and plotsize
set samples 500                                                                         # sets count for the amount of sampled points

set output "phase-transition.pdf"          # name of the output pdf


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

# axes and label
set xrange [-3.7:-0.2] 
set xtics 0.2
set mxtics 4
set xlabel "Ising Parameter h"

set ylabel "avg. variance"
set yrange [0.00000000001:2] 
set format y "10^{%L}";
set logscale y 10
set ytics log

plot \
     "extracted.csv" using 1:2 notitle       pointtype 16 pointsize 1.2 linecolor rgb markerblue
