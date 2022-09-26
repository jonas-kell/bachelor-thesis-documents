set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 24cm, 10cm       # sets output format, font and plotsize
set samples 500                                                                         # sets count for the amount of sampled points


set output "graph-conv.pdf"          # name of the output pdf

# axes and label
set xlabel "number of epochs"
set ylabel "accuracy (%)"
set xtics 40
set ytics 10
set mxtics 4
set mytics 5

# set xrange [0:50] 
set yrange [0:55] 

# legend
set key Left                                                            # key text justify left
set key right bottom                                                    # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1                                                       # vertical spacing of entries                                                   

set multiplot layout 1,2 rowsfirst


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
plot \
     NaN with points pt 5 lc rgb markeryellow title " SDCF-NN", \
     NaN with points pt 5 lc rgb markerred title " SGDCF-NN", \
     NaN with points pt 5 lc rgb "#FFFFFF" title " ", \
     NaN with points pt 5 lc rgb markerblue title " SDCF-NNN", \
     NaN with points pt 5 lc rgb markergreen title " SGDCF-NNN", \
     "accuracy-SDCF_NN.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markeryellow, \
     "accuracy-SGDCF_NN.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markerred, \
     "accuracy-SDCF_NNN.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markerblue, \
     "accuracy-SGDCF_NNN.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen
    

set key Left                                                            # key text justify left
set key right top                                                       # moves legend
set yrange [2:4] 
set y2range [2:4] 
set ytics 0.5
set mytics 5
set y2tics 0.5
set my2tics 5
unset ylabel
set y2label "loss"
set format y '';
set format y2 '%.1f';

    
plot \
     NaN with points pt 5 lc rgb markeryellow title " SDCF-NN", \
     NaN with points pt 5 lc rgb markerred title " SGDCF-NN", \
     NaN with points pt 5 lc rgb "#FFFFFF" title " ", \
     NaN with points pt 5 lc rgb markerblue title " SDCF-NNN", \
     NaN with points pt 5 lc rgb markergreen title " SGDCF-NNN", \
     "loss-SDCF_NN.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markeryellow, \
     "loss-SGDCF_NN.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markerred, \
     "loss-SDCF_NNN.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markerblue, \
     "loss-SGDCF_NNN.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen