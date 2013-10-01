#!/gnuplot

FILE_OUT='plain-and-foam.eps'
set terminal postscript enhanced eps color "Helvetica" 20
set output FILE_OUT

unset key

set tics scale 0.5


set ylabel 'y [{/Symbol l}_0]' 
set xrange [-20:20]
#set format cb "%L10^{%L}"
set xtics 10
set ytics 10
#set size 1.5,1
set size ratio -1
set size 0.96,0.8
#set grid front
set label 1 at screen 0.12, 0.67 left 'n_e' font "Helvetica,16" front
set label 2 at screen 0.81, 0.67 right 'n_e' font ",16" front
set label 3 at screen 0.12, 0.23 left 'E_x' font ",16" front
set label 4 at screen 0.81, 0.23 right 'E_x' font ",16" front
set label 5 at screen 0.92, 0.7 center '[e/cm^3]' font ",16" front
set label 6 at screen 0.92, 0.17 center '[V/m]' font ",16" front

# Enable the use of macros
set macros
load "~/SORGENTI/gnuplots/palettes.pt"

TMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.45"
BMARGIN = "set tmargin at screen 0.45; set bmargin at screen 0.40"
LMARGIN = "set lmargin at screen 0.10; set rmargin at screen 0.45"
RMARGIN = "set lmargin at screen 0.48; set rmargin at screen 0.83"
#LMARGIN = "set lmargin at screen 0.15;"
#RMARGIN = "set lmargin at screen 0.4;" 
TLTITLE  = "set title 'bare solid target' "
BLTITLE  = "set title ''"
TRTITLE  = "set title 'foam-attached target' "
BRTITLE  = "set title '' "
# x- and ytics for each row resp. column
NOXTICS = "set format x '' ; unset xlabel"
XTICS = "set format x '%.0f'; set xtics rotate ; set xlabel 'x [{/Symbol m}m]' "
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'y [{/Symbol m}m]'"

set multiplot layout 2,2
#-----------PLOT elettroni-------------------
unset colorbox #set colorbox user origin .75, .55 size 0.02, 0.3
unset yrange
set yrange [0:20]
set logscale cb
set cbrange [1e18:1e23]
set cblabel 'n_e  [e/cm^3]'
@TMARGIN; @LMARGIN
@NOXTICS; @YTICS
@TLTITLE
#set tmargin at screen 0.90; set bmargin at screen 0.55
#@PMATLAB
#@PHEATMAP
#@PWHOT
@PMATLAB_WWHITE
#@PMATLAB_WBLACK
plot "./n0.33-l0-a1.0-w12/SLICE_all_e_30_ZX" u 2:1:(abs($3)) w image t ''

#----------PLOT campo E --------------------
unset colorbox #set colorbox user origin .75, .2 size 0.02, 0.3
@BMARGIN; @LMARGIN
@XTICS; @YTICS
@BLTITLE
unset logscale cb
set cbrange [-1e12:1e12]
set tmargin at screen 0.55; set bmargin at screen 0.20
set yrange [20:0]
set cblabel 'E_x [V/m]'
@PLUCAII
#@PWCOLD
#@PCOLDBHOT
#@PBLUERED2
plot "./n0.33-l0-a1.0-w12/ump_field_30.0000_Ex_Ez_By" u 2:1:3 w image t ''


#=========== second column ================
unset xrange
set xrange [-20:20]


#-----------PLOT elettroni-------------------
@TRTITLE
set colorbox user origin .83, .475 size 0.02, 0.2
unset yrange
set yrange [0:20]
set logscale cb
set cbrange [1e18:1e23]
set cbtics 100
#set cblabel 'n_e [e/cm^3]'
set cblabel ''
@TMARGIN; @RMARGIN
@NOXTICS; @NOYTICS
#set tmargin at screen 0.90; set bmargin at screen 0.55
@PMATLAB
#PHEATMAP
#@PWHOT
@PMATLAB_WWHITE
plot "./n0.66-l8-a1.0-w12/SLICE_all_e_30_ZX" u 2:1:(abs($3)) w image t ''

#----------PLOT E  --------------------
@BRTITLE
set colorbox user origin .83, .225 size 0.02, 0.2
@BMARGIN; @RMARGIN
@XTICS; @NOYTICS
unset logscale cb
set cbrange [-1e12:1e12]
set cbtics 5e11
set tmargin at screen 0.55; set bmargin at screen 0.20
set yrange [20:0]
#set cblabel 'E [V/m]'
set cblabel ''
@PLUCAII
#@PCOLDBHOT
##PWCOLD
#@PBLUERED2
plot "./n0.66-l8-a1.0-w12/ump_field_30.0000_Ex" u 2:1:3 w image t ''


unset multiplot
