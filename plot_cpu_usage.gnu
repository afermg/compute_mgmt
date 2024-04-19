set datafile separator ","

# Aesthetics
# set grid
unset logscale

# Time
set xdata time
set timefmt "%d-%m %H:%M:%S"
reformat(time) = strftime("%m/%d", time)

# Plot details
ndays=7
set grid y
set tics scale 0
fontsize = "Helvetica,20"
set tics font fontsize
set xlabel "Time (weekly date)" font fontsize
set ylabel "Smoothed mean usage" font fontsize
set title "Server CPU usage (80 cores)" font fontsize
set yrange [0:100]
set tics nomirror
set ylabel "Mean usage" font fontsize
plot 'systemstats.csv' using 1:(100-$4):xtic(((int($0)+144) % (ndays*24))==0?reformat(timecolumn(1)):"") notitle with filledcurves above y=0 lc rgb 'skyblue' lw 1.3 fs transparent solid 0.5
