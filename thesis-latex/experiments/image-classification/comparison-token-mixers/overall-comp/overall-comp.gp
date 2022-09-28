set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 25cm, 18cm       # sets output format, font and plotsize
set samples 500                                                                         # sets count for the amount of sampled points


set output "overall-comp.pdf"          # name of the output pdf

# axes and label
unset xlabel
set ylabel "accuracy (%)"

set xtics 20
set mxtics 4
set x2tics 20
set mx2tics 4

set ytics 5
set mytics 5
set y2tics 5
set my2tics 5

set xrange [0:470] 
set x2range [0:470] 
set yrange [15:55] 
set y2range [15:55] 

set format x '';
set format y  '  %.f';
set format y2 '  %.f';

# legend
set key Left                                                            # key text justify left
set key right bottom                                                    # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1                                                       # vertical spacing of entries                                                   
set key maxrows 6                                                   

# colors 
tf="#fe3030"
tfnn="#b70f0f"
tfnnn="#6c0000"

pf="#3fff3f"
pfnn="#0f980f"
pfnnn="#053f05"

dcf="#6868ff"
dcfnn="#2525c1"
dcfnnn="#161657"

gdcfnn="#a207a5"
gdcfnnn="#671069"

cf="#f527fa"

# plot
set datafile separator ','
set multiplot layout 2,1 rowsfirst


plot \
     NaN with points pt 5 lc rgb tf           title " TF", \
     NaN with points pt 5 lc rgb tfnn         title " GTF-NN", \
     NaN with points pt 5 lc rgb tfnnn        title " GTF-NNN", \
     NaN with points pt 5 lc rgb pf           title " PF", \
     NaN with points pt 5 lc rgb pfnn         title " PF-NN", \
     NaN with points pt 5 lc rgb pfnnn        title " PF-NNN", \
     NaN with points pt 5 lc rgb dcf          title " DCF", \
     NaN with points pt 5 lc rgb dcfnn        title " SDCF-NN", \
     NaN with points pt 5 lc rgb dcfnnn       title " SDCF-NNN", \
     NaN with points pt 5 lc rgb cf           title " CF", \
     NaN with points pt 5 lc rgb gdcfnn       title " SGDCF-NN", \
     NaN with points pt 5 lc rgb gdcfnnn      title " SGDCF-NNN", \
     "accuracy-TF.csv"              using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb tf, \
     "accuracy-GTF_NN_ALT.csv"      using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb tfnn, \
     "accuracy-GTF_NNN_ALT.csv"     using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb tfnnn, \
     "accuracy-PF.csv"              using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb pf, \
     "accuracy-GPF_NN.csv"          using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb pfnn, \
     "accuracy-GPF_NNN.csv"         using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb pfnnn, \
     "accuracy-DCF.csv"             using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb dcf, \
     "accuracy-SDCF_NN.csv"         using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb dcfnn, \
     "accuracy-SDCF_NNN.csv"        using 2:3 notitle                  pointtype  2 pointsize 0.6 lc rgb dcfnnn, \
     "accuracy-SGDCF_NN.csv"        using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb gdcfnn, \
     "accuracy-SGDCF_NNN.csv"       using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb gdcfnnn, \
     "accuracy-CF.csv"              using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb cf, \

set format x '%.f';
set format x2 '';
set format y  '%.2f';
set format y2 '%.2f';

set xlabel "number of epochs"
set ylabel "loss"
set yrange  [1.9:4] 
set y2range [1.9:4] 

set ytics 0.25
set mytics 5
set y2tics 0.25
set my2tics 5
unset key

plot \
     "loss-TF.csv"              using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb tf, \
     "loss-GTF_NN_ALT.csv"      using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb tfnn, \
     "loss-GTF_NNN_ALT.csv"     using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb tfnnn, \
     "loss-PF.csv"              using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb pf, \
     "loss-GPF_NN.csv"          using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb pfnn, \
     "loss-GPF_NNN.csv"         using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb pfnnn, \
     "loss-DCF.csv"             using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb dcf, \
     "loss-SDCF_NN.csv"         using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb dcfnn, \
     "loss-SDCF_NNN.csv"        using 2:3 notitle                  pointtype  2 pointsize 0.6 lc rgb dcfnnn, \
     "loss-SGDCF_NN.csv"        using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb gdcfnn, \
     "loss-SGDCF_NNN.csv"       using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb gdcfnnn, \
     "loss-CF.csv"              using 2:3 notitle                  pointtype 16 pointsize 0.6 lc rgb cf, \
