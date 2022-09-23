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

# legend
set key Left                                                            # key text justify left
set key left top                                                        # moves legend top left
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1                                                       # vertical spacing of entries                                                   

# set xrange [0:50] 
set yrange [0:115] 

set datafile separator ','
plot \
     NaN with points pt 5 lc rgb "#EEEE00" title " Loss (arbitrary scale)", \
     NaN with points pt 5 lc rgb "#AA0000" title " Top 1 accuracy", \
     NaN with points pt 5 lc rgb "#0000AA" title " Top 3 accuracy", \
     NaN with points pt 5 lc rgb "#00AA00" title " Top 5 accuracy", \
     "loss-train.csv" using ($2/197960*199):($3/9*100) notitle                           smooth unique pointsize 0.5 linecolor rgb "#FFFF22", \
     "loss-test.csv" using 2:($3/9*100) notitle                                    pointtype 2 pointsize 0.6 linecolor rgb "#EEEE00", \
     "accuracy-top5-train.csv" using ($2/197960*199):3 notitle                  smooth unique pointsize 0.5 linecolor rgb "#AAFFAA", \
     "accuracy-top5-test.csv" using 2:3 notitle                           pointtype 16 pointsize 0.6 linecolor rgb "#00AA00", \
     "accuracy-top3-train.csv" using ($2/197960*199):3 notitle                  smooth unique pointsize 0.5 linecolor rgb "#AAAAFF", \
     "accuracy-top3-test.csv" using 2:3 notitle                           pointtype 16 pointsize 0.6 linecolor rgb "#0000AA", \
     "accuracy-top1-train.csv" using ($2/197960*199):3 notitle                  smooth unique pointsize 0.5 linecolor rgb "#FFAAAA", \
     "accuracy-top1-test.csv" using 2:3 notitle                           pointtype 16 pointsize 0.6 linecolor rgb "#AA0000"