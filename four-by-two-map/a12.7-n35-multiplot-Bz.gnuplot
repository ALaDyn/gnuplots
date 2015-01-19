#!/gnuplot

FILE_OUT='a12.7-n35-multiplot-Bz.eps'
set terminal postscript enhanced eps color "Helvetica" 14
set output FILE_OUT

unset key

set tics scale 0.5


set ylabel 'y [{/Symbol m}m]' 
set xrange [0:60]
set yrange [-15:15]
#set logscale cb
set cbrange [0:10]
set cbtics 10
#set format cb "%L10^{%L}"
set xtics 20
set ytics 10
#set size 2, 1
set size ratio -1
set label 1 at screen 0.12, 0.85 'B_z absolute value [Tesla]     a_0=12.7 {/Symbol z}=13.7'
set label 2 at screen 0.02, 0.65 rotate center 'Circular Polarisation'
set label 3 at screen 0.02, 0.35 rotate center 'Linear Polarisation'
#set grid front
lightspeed=2.99792458
# Enable the use of macros
set macros
load "/home/sgatto/SORGENTI/gnuplots/palettes.pt"

MARGIN1 = "set tmargin at screen 0.75; set bmargin at screen 0.55; set lmargin at screen 0.12; set rmargin at screen 0.32"
MARGIN2 = "set tmargin at screen 0.75; set bmargin at screen 0.55; set lmargin at screen 0.32; set rmargin at screen 0.52"
MARGIN3 = "set tmargin at screen 0.75; set bmargin at screen 0.55; set lmargin at screen 0.52; set rmargin at screen 0.72"
MARGIN4 = "set tmargin at screen 0.75; set bmargin at screen 0.55; set lmargin at screen 0.72; set rmargin at screen 0.92"
MARGIN5 = "set tmargin at screen 0.45; set bmargin at screen 0.25; set lmargin at screen 0.12; set rmargin at screen 0.32"
MARGIN6 = "set tmargin at screen 0.45; set bmargin at screen 0.25; set lmargin at screen 0.32; set rmargin at screen 0.52"
MARGIN7 = "set tmargin at screen 0.45; set bmargin at screen 0.25; set lmargin at screen 0.52; set rmargin at screen 0.72"
MARGIN8 = "set tmargin at screen 0.45; set bmargin at screen 0.25; set lmargin at screen 0.72; set rmargin at screen 0.92"
XRANGE1 = "set xrange [20:60]"
XRANGE2 = "set xrange [25:65]"
XRANGE3 = "set xrange [30:70]"
XRANGE4 = "set xrange [40:80]"

#LMARGIN = "set lmargin at screen 0.15;"
#RMARGIN = "set lmargin at screen 0.4;" 
TITLE1  = "set title 't=33fs' "
TITLE2  = "set title 't=66fs' "
TITLE3  = "set title 't=100fs' "
TITLE4  = "set title 't=133s' "
TITLE5  = "set title '' "
TITLE6  = "set title '' "
TITLE7  = "set title '' "
TITLE8  = "set title '' "
# x- and ytics for each row resp. column
NOXTICS = "set format x '' ; unset xlabel"
XTICS = "set format x '%.0f'; set xtics rotate ; set xlabel 'x [{/Symbol m}m]' "
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'y [{/Symbol m}m]'"

set multiplot layout 2,4
#-----------PLOT 1,1-------------------
@MARGIN1
@TITLE1
@NOXTICS
@YTICS;
@XRANGE1
unset colorbox
@PHEATMAP_WBLACK
plot "a12.7-w3-n035-CP/Bzfout01.txt" u 1:2:3 w image t ''

#----------PLOT 1,2 --------------------
@MARGIN2
@TITLE2
@NOXTICS
@NOYTICS
@XRANGE2
unset colorbox
@PHEATMAP_WBLACK
plot "a12.7-w3-n035-CP/Bzfout02.txt" u 1:2:3 w image t ''


#===========  ================

#-----------PLOT 1,3-------------------
@MARGIN3
@TITLE3
@NOXTICS
@NOYTICS
@XRANGE3
unset colorbox
@PHEATMAP_WBLACK
plot "a12.7-w3-n035-CP/Bzfout03.txt" u 1:2:3 w image t ''

#----------PLOT 1,4 --------------------
@MARGIN4
@TITLE4
@NOXTICS
@NOYTICS
@XRANGE4

@PHEATMAP_WBLACK
set colorbox user origin 0.92, 0.55 size 0.02, 0.2
plot "a12.7-w3-n035-CP/Bzfout04.txt" u 1:2:3 w image t ''

#===========  ================
#===========  ================
#===========  ================
set cbrange [0:14]
set cbtics 7



#-----------PLOT 2,1-------------------
@MARGIN5
@TITLE5
@XTICS
@YTICS;
@XRANGE1
unset colorbox
@PHEATMAP_WBLACK
plot "a12.7-w3-n035-LP/Bzfout01.txt" u 1:2:3 w image t ''

#----------PLOT 2,2 --------------------
@MARGIN6
@TITLE6
@XTICS
@NOYTICS
@XRANGE2
unset colorbox
@PHEATMAP_WBLACK
plot "a12.7-w3-n035-LP/Bzfout02.txt" u 1:2:3 w image t ''


#===========  ================

#-----------PLOT 2,3-------------------
@MARGIN7
@TITLE7
@XTICS
@NOYTICS
@XRANGE3
unset colorbox
@PHEATMAP_WBLACK
plot "a12.7-w3-n035-LP/Bzfout03.txt" u 1:2:3 w image t ''

#----------PLOT 2,4 --------------------
@MARGIN8
@TITLE8
@XTICS
@NOYTICS
@XRANGE4

@PHEATMAP_WBLACK
set colorbox user origin 0.92, 0.25 size 0.02, 0.2
plot "a12.7-w3-n035-LP/Bzfout04.txt" u 1:2:3 w image t ''

unset multiplot
