set term postscript enhanced eps color solid font "Helvetica,16"

set style line 1 lt rgb "black" lw 3
set style line 2 lt rgb "red" lw 3
set style line 3 lt rgb "orange" lw 3
set style line 4 lt rgb "yellow" lw 3
set style line 5 lt rgb "green" lw 3
set style line 6 lt rgb "cyan" lw 3
set style line 7 lt rgb "blue" lw 3
set style line 8 lt rgb "violet" lw 3

set xrange [0:20]
set logscale y;

set grid x
set grid y

unset key

set output "SUM_GRAPH.eps"
set multiplot layout 2,2

set xlabel "E"
set ylabel "dN/dE"

set title "Waist: 2"
plot  "tnsa-w2/Prpout01_Espec" u (($1+$2)/2):3  w l ls 1,"tnsa-w2/Prpout02_Espec" u (($1+$2)/2):3  w l ls 2,"tnsa-w2/Prpout03_Espec" u (($1+$2)/2):3  w l ls 3,"tnsa-w2/Prpout04_Espec" u (($1+$2)/2):3  w l ls 4,"tnsa-w2/Prpout05_Espec" u (($1+$2)/2):3  w l ls 5,"tnsa-w2/Prpout06_Espec" u (($1+$2)/2):3  w l ls 6,"tnsa-w2/Prpout07_Espec" u (($1+$2)/2):3  w l ls 7,"tnsa-w2/Prpout08_Espec" u (($1+$2)/2):3  w l ls 8

set title "Waist: 4"
plot  "tnsa-w4/Prpout01_Espec" u (($1+$2)/2):3  w l ls 1,"tnsa-w4/Prpout02_Espec" u (($1+$2)/2):3  w l ls 2,"tnsa-w4/Prpout03_Espec" u (($1+$2)/2):3  w l ls 3,"tnsa-w4/Prpout04_Espec" u (($1+$2)/2):3  w l ls 4,"tnsa-w4/Prpout05_Espec" u (($1+$2)/2):3  w l ls 5,"tnsa-w4/Prpout06_Espec" u (($1+$2)/2):3  w l ls 6,"tnsa-w4/Prpout07_Espec" u (($1+$2)/2):3  w l ls 7,"tnsa-w4/Prpout08_Espec" u (($1+$2)/2):3  w l ls 8

set title "Waist: 6"
plot  "tnsa-w6/Prpout01_Espec" u (($1+$2)/2):3  w l ls 1,"tnsa-w6/Prpout02_Espec" u (($1+$2)/2):3  w l ls 2,"tnsa-w6/Prpout03_Espec" u (($1+$2)/2):3  w l ls 3,"tnsa-w6/Prpout04_Espec" u (($1+$2)/2):3  w l ls 4,"tnsa-w6/Prpout05_Espec" u (($1+$2)/2):3  w l ls 5,"tnsa-w6/Prpout06_Espec" u (($1+$2)/2):3  w l ls 6,"tnsa-w6/Prpout07_Espec" u (($1+$2)/2):3  w l ls 7,"tnsa-w6/Prpout08_Espec" u (($1+$2)/2):3  w l ls 8

set title "Waist: 8"
plot  "tnsa-w8/Prpout01_Espec" u (($1+$2)/2):3  w l ls 1,"tnsa-w8/Prpout02_Espec" u (($1+$2)/2):3  w l ls 2,"tnsa-w8/Prpout03_Espec" u (($1+$2)/2):3  w l ls 3,"tnsa-w8/Prpout04_Espec" u (($1+$2)/2):3  w l ls 4,"tnsa-w8/Prpout05_Espec" u (($1+$2)/2):3  w l ls 5,"tnsa-w8/Prpout06_Espec" u (($1+$2)/2):3  w l ls 6,"tnsa-w8/Prpout07_Espec" u (($1+$2)/2):3  w l ls 7,"tnsa-w8/Prpout08_Espec" u (($1+$2)/2):3  w l ls 8

unset multiplot
