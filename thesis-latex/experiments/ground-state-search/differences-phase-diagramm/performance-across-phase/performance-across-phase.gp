set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 16cm       # sets output format, font and plotsize
set samples 500                                                                         # sets count for the amount of sampled points

# !! numbers of x axes need to be deleted manually
set output "performance-across-phase.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key right top                                                       # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1                                                       # vertical spacing of entries
set key maxrows 2
set key font ",11"

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

set multiplot layout 1,3 rowsfirst

# axes and label
set xrange [0:150] 
set xlabel "steps"
set xtics 25
set mxtics 5
set format x '%.f'

set ylabel "E/L"
set yrange [-4.2:-1.5] 
set ytics 0.5
set mytics 5
set format y '%.1f';

set tmargin at screen 0.95; set bmargin at screen 0.60
set lmargin at screen 0.10; set rmargin at screen 0.94

# plot 1,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb linegreen     title " h=1.8, CNN", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen   title " h=1.8, SGDCF-NNN", \
     NaN with points pt 5 pointsize 0.6 lc rgb linered       title " h=2.6, CNN", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred     title " h=2.6, SGDCF-NNN", \
     NaN with points pt 5 pointsize 0.6 lc rgb lineblue      title " h=3.4, CNN", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue    title " h=3.4, SGDCF-NNN", \
     "energy-CNN-1.8.csv" using 2:3 notitle                           pointtype 16 pointsize 0.6 linecolor rgb linegreen, \
     "energy-CNN-2.6.csv" using 2:3 notitle                           pointtype 16 pointsize 0.6 linecolor rgb linered, \
     "energy-CNN-3.4.csv" using 2:3 notitle                           pointtype 16 pointsize 0.6 linecolor rgb lineblue, \
     "energy-SGDCF_NNN-1.8.csv" using 2:3 notitle                     pointtype 16 pointsize 0.6 linecolor rgb markergreen, \
     "energy-SGDCF_NNN-2.6.csv" using 2:3 notitle                     pointtype 16 pointsize 0.6 linecolor rgb markerred, \
     "energy-SGDCF_NNN-3.4.csv" using 2:3 notitle                     pointtype 16 pointsize 0.6 linecolor rgb markerblue
# end plot 1,1

unset key # only key in first graph needed

# !!! start row 2

set tmargin at screen 0.50; set bmargin at screen 0.13
set lmargin at screen 0.10; set rmargin at screen 0.37

set xlabel " "
set xrange [0:700]
set xtics 100
set mxtics 4
set format x '%.f';
set format x2 '';

set ylabel "Var(E)/L"
set yrange  [0.01:10]
set y2range [0.01:10]
set logscale y 10
set logscale y2 10
set ytics 10
set y2tics 10
set mytics 0
set my2tics 0
set ytics log
set y2tics log

set format y '10^{%L}';
set format y2 '   ';

# ! plot 2,1
set label 1 "h=1.8" at graph 0.45,0.93
plot \
     "variance-CNN-1.8.csv" using 2:3 notitle                   pointtype 16 pointsize 0.4 linecolor rgb linegreen, \
     "variance-SGDCF_NNN-1.8.csv" using 2:3 notitle             pointtype 16 pointsize 0.4 linecolor rgb markergreen
# ! end plot 2,1

set xrange [1:700] # hide overlapping number 
set xlabel "steps"
unset ylabel
set format y '   ';
set format y2 '   ';

set lmargin at screen 0.38; set rmargin at screen 0.66

# plot 2,2
set label 1 "h=2.6" at graph 0.45,0.93
plot \
     "variance-CNN-2.6.csv" using 2:3 notitle                   pointtype 16 pointsize 0.4 linecolor rgb linered, \
     "variance-SGDCF_NNN-2.6.csv" using 2:3 notitle             pointtype 16 pointsize 0.4 linecolor rgb markerred
# end plot 2,2

set xlabel " "
set format y '   ';
set format y2 '10^{%L}';

set lmargin at screen 0.67; set rmargin at screen 0.94

# ! plot 2,3
set label 1 "h=3.4" at graph 0.45,0.93
plot \
     "variance-CNN-3.4.csv" using 2:3 notitle                   pointtype 16 pointsize 0.4 linecolor rgb lineblue, \
     "variance-SGDCF_NNN-3.4.csv" using 2:3 notitle             pointtype 16 pointsize 0.4 linecolor rgb markerblue
# ! end plot 2,3
