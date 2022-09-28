set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 12cm       # sets output format, font and plotsize
set samples 500                                                                         # sets count for the amount of sampled points

set output "hyperparameter-matrix.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key right top                                                       # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 0.8                                                       # vertical spacing of entries
set key maxrows 7       
set key font ",9"
                                  
# colors 
marker1="#AA0000"
marker2="#00AA00"
marker3="#0000AA"
marker4="#FF8E00"
marker5="#db10e9"
marker6="#1fc6a1"
marker7="#0f0d0f"

# plot
set datafile separator ','

# axes and label
set xlabel "steps"
set xrange [0:325] 
set xtics 25
set mxtics 5

set ylabel "E/L"
# set yrange [] 
set ytics 0.1
set mytics 5

plot \
     "energy-sr-dp_1-ed_16.csv"  using 2:3 title "sr d:1 e:16"        with lines dt 1 linewidth 1.2 linecolor rgb marker1, \
     "energy-sr-dp_1-ed_8.csv"   using 2:3 title "sr d:1 e:8"        with lines dt 1 linewidth 1.2 linecolor rgb marker2, \
     "energy-sr-dp_2-ed_8.csv"   using 2:3 title "sr d:2 e:8"        with lines dt 1 linewidth 1.2 linecolor rgb marker3, \
     "energy-sr-dp_3-ed_4.csv"   using 2:3 title "sr d:3 e:4"        with lines dt 1 linewidth 1.2 linecolor rgb marker4, \
     "energy-sr-dp_3-ed_8.csv"   using 2:3 title "sr d:3 e:8"        with lines dt 1 linewidth 1.2 linecolor rgb marker5, \
     "energy-sr-dp_4-ed_4.csv"   using 2:3 title "sr d:4 e:4"        with lines dt 1 linewidth 1.2 linecolor rgb marker6, \
     "energy-sr-dp_5-ed_4.csv"   using 2:3 title "sr d:5 e:4"        with lines dt 1 linewidth 1.2 linecolor rgb marker7, \
     "energy-tr-dp_1-ed_16.csv"  using 2:3 title "tr d:1 e:16"        with lines dt 2 linewidth 1.5 linecolor rgb marker1, \
     "energy-tr-dp_1-ed_8.csv"   using 2:3 title "tr d:1 e:8"        with lines dt 2 linewidth 1.5 linecolor rgb marker2, \
     "energy-tr-dp_2-ed_8.csv"   using 2:3 title "tr d:2 e:8"        with lines dt 2 linewidth 1.5 linecolor rgb marker3, \
     "energy-tr-dp_3-ed_4.csv"   using 2:3 title "tr d:3 e:4"        with lines dt 2 linewidth 1.5 linecolor rgb marker4, \
     "energy-tr-dp_3-ed_8.csv"   using 2:3 title "tr d:3 e:8"        with lines dt 2 linewidth 1.5 linecolor rgb marker5, \
     "energy-tr-dp_4-ed_4.csv"   using 2:3 title "tr d:4 e:4"        with lines dt 2 linewidth 1.5 linecolor rgb marker6, \
     "energy-tr-dp_5-ed_4.csv"   using 2:3 title "tr d:5 e:4"        with lines dt 2 linewidth 1.5 linecolor rgb marker7, \
     "energy-spc-dp_1-ed_16.csv" using 2:3 title "spc d:1 e:16"        with lines dt 3 linewidth 2.6 linecolor rgb marker1, \
     "energy-spc-dp_1-ed_8.csv"  using 2:3 title "spc d:1 e:8"        with lines dt 3 linewidth 2.6 linecolor rgb marker2, \
     "energy-spc-dp_2-ed_8.csv"  using 2:3 title "spc d:2 e:8"        with lines dt 3 linewidth 2.6 linecolor rgb marker3, \
     "energy-spc-dp_3-ed_4.csv"  using 2:3 title "spc d:3 e:4"        with lines dt 3 linewidth 2.6 linecolor rgb marker4, \
     "energy-spc-dp_3-ed_8.csv"  using 2:3 title "spc d:3 e:8"        with lines dt 3 linewidth 2.6 linecolor rgb marker5, \
     "energy-spc-dp_4-ed_4.csv"  using 2:3 title "spc d:4 e:4"        with lines dt 3 linewidth 2.6 linecolor rgb marker6, \
     "energy-spc-dp_5-ed_4.csv"  using 2:3 title "spc d:5 e:4"        with lines dt 3 linewidth 2.6 linecolor rgb marker7, \
