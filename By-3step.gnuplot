#!/gnuplot

FILE_OUT='By-3step.eps'
set terminal postscript enhanced eps color "Helvetica" 16
set output FILE_OUT

unset key

set tics scale 0.5


#set logscale cb
set cbrange [-20:20]
set cbtics 10
set cblabel "kTesla"
set xtics 10
set ytics 10
set size ratio -1
set xrange [-30:10]
set yrange [-15:5]
set grid front

set label 1 at screen 0.12, 0.88 left 't=20T' font "Helvetica,16" front
set label 2 at screen 0.12, 0.63 left 't=30T' font ",16" front
set label 3 at screen 0.12, 0.38 left 't=40T' font ",16" front

# Enable the use of macros
set macros
load "/tamino/sgatto/SORGENTI/gnuplots/palettes.pt"
@PBLUERED2

# Margins for each row resp. column
TMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.65"
MMARGIN = "set tmargin at screen 0.65; set bmargin at screen 0.40"
BMARGIN = "set tmargin at screen 0.40; set bmargin at screen 0.15"
LMARGIN = "set lmargin at screen 0.25; set rmargin at screen 0.65"

TTITLE  = "set title 'B_y' "
MTITLE  = "set title ''"
BTITLE  = "set title ''"
# x- and ytics for each row resp. column
NOXTICS = "set format x '' ; unset xlabel"
#XTICS = "set format x '%.0f'; set xtics rotate ; set xlabel 'x [{/Symbol l}_0]' "
XTICS = "set format x '%.0f'; set xlabel 'x [{/Symbol m}m]' "
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'y [{/Symbol m}m]'"

set multiplot layout 3,1
#-----------PLOT 20-------------------
unset colorbox #set colorbox user origin .75, .55 size 0.02, 0.3
@TMARGIN; @LMARGIN
@NOXTICS; @YTICS
@TTITLE
plot "ump_field_20.0000_By" u (-$1):2:($3/1000.0) w image t 't=20T'

#-----------PLOT 30-------------------
set colorbox user origin .65, .40 size 0.02, 0.25
@MMARGIN; @LMARGIN
@NOXTICS; @YTICS
@MTITLE
plot "ump_field_30.0000_By" u (-$1):2:($3/1000.0) w image t 't=30T'

#-----------PLOT 40-------------------
unset colorbox #set colorbox user origin .65, .55 size 0.02, 0.3
@BMARGIN; @LMARGIN
@XTICS; @YTICS
@BTITLE
plot "ump_field_40.0000_By" u (-$1):2:($3/1000.0) w image t 't=40T'



unset multiplot
