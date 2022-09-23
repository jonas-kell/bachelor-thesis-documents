set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 9cm       # sets output format, font and plotsize
set samples 500                                                                         # sets count for the amount of sampled points


set output "metrics.pdf"          # name of the output pdf

# axes and label
set xlabel "number of epochs"
set ylabel "accuracy (%)"
set xtics 10
set ytics 10
set mxtics 10
set mytics 5

# set xrange [0:50] 
set yrange [0:115] 

# legend
set key Left                                                            # key text justify left
set key left top                                                        # moves legend top left
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
plot \
     NaN with points pt 5 lc rgb markeryellow title " Loss (arbitrary scale)", \
     NaN with points pt 5 lc rgb markerred title " Top 1 accuracy", \
     NaN with points pt 5 lc rgb markerblue title " Top 3 accuracy", \
     NaN with points pt 5 lc rgb markergreen title " Top 5 accuracy", \
     "loss-train.csv" using ($2/197960*199):($3/9*100) notitle                           smooth unique pointsize 0.5 linecolor rgb lineyellow, \
     "loss-test.csv" using 2:($3/9*100) notitle                                    pointtype 2 pointsize 0.6 linecolor rgb markeryellow, \
     "accuracy-top5-train.csv" using ($2/197960*199):3 notitle                  smooth unique pointsize 0.5 linecolor rgb linegreen, \
     "accuracy-top5-test.csv" using 2:3 notitle                           pointtype 16 pointsize 0.6 linecolor rgb markergreen, \
     "accuracy-top3-train.csv" using ($2/197960*199):3 notitle                  smooth unique pointsize 0.5 linecolor rgb lineblue, \
     "accuracy-top3-test.csv" using 2:3 notitle                           pointtype 16 pointsize 0.6 linecolor rgb markerblue, \
     "accuracy-top1-train.csv" using ($2/197960*199):3 notitle                  smooth unique pointsize 0.5 linecolor rgb linered, \
     "accuracy-top1-test.csv" using 2:3 notitle                           pointtype 16 pointsize 0.6 linecolor rgb markerred