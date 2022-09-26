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
set xlabel ""
set ylabel "accuracy (%)"
set xtics 25
set ytics 10
set mxtics 10
set mytics 5
# set xrange [0:50] 
set yrange [0:60] 

set label 1 "TF" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen

set ylabel ""

set label 1 "GTF-NN" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen

set label 1 "GTF-NNN" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen

set xlabel "number of epochs"
set ylabel "loss"
set label 1 "TF" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen

set ylabel ""

set label 1 "GTF-NNN" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen

set label 1 "GTF-NNN" at graph 0.4,0.93
plot \
     "accuracy-tf-no.csv" using 2:3 notitle                  pointtype 16 pointsize 0.6 linecolor rgb markergreen


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