# set terminal pngcairo transparent enhanced font "arial,10" fontscale 1.0 size 800, 640
# set output 'pm3d.png'
set border 4095 front lt black linewidth 1.000 dashtype solid
set sample 25, 25
set isosample 20, 20
unset surface
set style data lines
set xyplane relative 0
set title "Holder table function"
set xlabel "x"
set xrange [-10.0000 : 10.0000] noreverse nowriteback
set ylabel "y"
set yrange [-10.0000 : 10.0000] noreverse nowriteback
set zrange [-20.0000 : -0.00000] noreverse nowriteback
set cblabel "coloutr gradient"
set samples 750
set pm3d
splot -abs(sin(x)*cos(y)*exp(abs(1-sqrt(x**2+y**2)/pi)));