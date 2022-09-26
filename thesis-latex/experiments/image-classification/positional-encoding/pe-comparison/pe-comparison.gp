set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 12cm       # sets output format, font and plotsize
set samples 500                                                                         # sets count for the amount of sampled points


set output "pe-comparison.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key right bottom                                                    # moves legend
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

set multiplot layout 2,3 rowsfirst

# axes and label
set xrange [0:100] 
set x2range [0:100] 
set xlabel ""
set xtics 25
set mxtics 5
set x2tics 25
set mx2tics 5
set format x ''

set ylabel "accuracy (%)"
set yrange [0:60] 
set y2range [0:60] 
set ytics 10
set mytics 5
set y2tics 10
set my2tics 5
set format y '%.f';
set format y2 '';

set tmargin at screen 0.95; set bmargin at screen 0.55
set lmargin at screen 0.08; set rmargin at screen 0.35

# plot 1,1
set label 1 "TF" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen
# end plot 1,1

unset ylabel
set format y '  ';
set format y2 '  ';

set lmargin at screen 0.36; set rmargin at screen 0.62

# ! plot 1,2
set label 1 "GTF-NN" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen
# ! end plot 1,2

set format y '  ';
set format y2 '%.f';

set lmargin at screen 0.63; set rmargin at screen 0.90

# plot 1,3
set label 1 "GTF-NNN" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen
# end plot 1,3

set xlabel " "
set ylabel "loss"
set format x '%.f';
set format x2 '';
set format y '%.f';
set format y2 '';

set tmargin at screen 0.50; set bmargin at screen 0.13
set lmargin at screen 0.08; set rmargin at screen 0.35

# ! plot 2,1
set label 1 "TF" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen
# ! end plot 2,1

set xlabel "number of epochs"
unset ylabel
set format y '  ';
set format y2 '  ';

set lmargin at screen 0.36; set rmargin at screen 0.62

# plot 2,2
set label 1 "GTF-NNN" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen
# end plot 2,2

set xlabel " "
set format y '  ';
set format y2 '%.f';

set lmargin at screen 0.63; set rmargin at screen 0.90

# ! plot 2,3
set label 1 "GTF-NNN" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen
# ! end plot 2,3

    #  NaN with points pt 5 lc rgb markeryellow title " adamw", \
    #  NaN with points pt 5 lc rgb markerred title " sgd, momentum=0", \
    #  NaN with points pt 5 lc rgb markerblue title " sgd, momentum=0.1", \
    #  NaN with points pt 5 lc rgb markergreen title " sgd, momentum=0.9", \
    #  "DINOtiny-adamw.csv"     using 2:3 notitle                  smooth acsplines pointsize 0.3 linecolor rgb lineyellow, \
    #  "DINOtiny-adamw.csv"     using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markeryellow, \
    #  "DINOtiny-sgd-mom00.csv" using 2:3 notitle                  smooth acsplines pointsize 0.3 linecolor rgb linered, \
    #  "DINOtiny-sgd-mom00.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markerred, \
    #  "DINOtiny-sgd-mom01.csv" using 2:3 notitle                  smooth acsplines pointsize 0.3 linecolor rgb lineblue, \
    #  "DINOtiny-sgd-mom01.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markerblue, \
    #  "DINOtiny-sgd-mom09.csv" using 2:3 notitle                  smooth acsplines pointsize 0.3 linecolor rgb linegreen, \