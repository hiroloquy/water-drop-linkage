reset
set angle degrees

#=================== Parameter ====================
# Length of the linkage OA
a = 1.0

# Position of fixed joints O and C
Ox = 0.0
Oy = 0.0
Cx = 0.0
Cy = -2.0*a

# Parameters in drawing
psJoint = 1.5       # ps = point size
psDrop = 2
lwLink = 3          # lw = line width
lwTrajectory = 2
lcLink = -1
lcDrop = 6
numPNG = 0
LOOP = 3

DEG_DIV = 1.0     # Resolution of degree, increase by 1/DEG_DIV
roundNum = 2

# Select terminal type
qtMode = 0     # ==1: qt (simulator) / !=1: png (output images for making video)
print sprintf("[MODE] %s", (qtMode==1 ? 'Simulate in Qt window' :'Output PNG images'))

#=================== Function ====================
# Distance between A and C
dist(t) = a*sqrt(5.0+4.0*cos(t))
# Angle OCA
alpha(t) = acos((dist(t)**2+3.0*a**2)/(4*a*dist(t)))

cos_alpha(t) = (dist(t)**2+3.0*a**2)/(4*a*dist(t))
sin_alpha(t) = ((0<=t && t<=180)? 1.0 : -1.0) * sqrt(1.0-cos_alpha(t)**2)  # sin^2 + cos^2 = 1

# Joint A
Ax(t) = -a*sin(t)
Ay(t) = a*cos(t)
# Joint B
Bx(t) = Cx - 4*a*cos_alpha(t)*sin_alpha(t) 
By(t) = Cy + 2*a*(2*cos_alpha(t)**2-1)
# Joint P
Px(t) = 4*Ax(t) - 3*Bx(t)
Py(t) = 4*Ay(t) - 3*By(t)

# Fade the trajectory of the point P
fadeTrajectory(i) = (fadeN=int(360*DEG_DIV*0.3), (i>fadeN ? i-fadeN : 0))

# Show the value of the parameter θ
showTheta(t) = sprintf("{/:Italic θ} = %3.1f deg", t)

#=================== Setting ====================
if(qtMode==1){
    set term qt size 720, 720 font 'Times'
} else {
    set term pngcairo size 720, 720 font 'Times'
    folderName = 'png'
    system sprintf('mkdir %s', folderName)
}

unset key
set grid
set size ratio -1
set xlabel '{/:Italic x}' font ', 20'
set ylabel '{/:Italic y}' font ', 20'
set tics font ', 18'
 
# Round off to the i decimal place.
round(x, i) = 1 / (10.**(i+1)) * floor(x * (10.**(i+1)) + 0.5)
 
#=================== Calculation ====================
# Output 1: "draw_linkages.txt" is need for drawing all of linkages.
dataJointsPos = 'draw_linkages.txt'
print sprintf('Start outputting %s ...', dataJointsPos)
set print dataJointsPos

# Write items and parameters in outputfile
print '#deg / Ox Oy / Cx Cy / Ax Ay / Bx By / Px Py'
print sprintf('# DEG_DIV=%d', DEG_DIV)
 
# Calculate and output position of joints in outputfile
do for[i=0:360*DEG_DIV:1]{
    deg = i/DEG_DIV

    print sprintf("%.3f", deg)    #  theta
    print Ox, Oy
    print round(Ax(deg), roundNum), round(Ay(deg), roundNum)
    print Cx, Cy
    print round(Bx(deg), roundNum), round(By(deg), roundNum)
    print round(Ax(deg), roundNum), round(Ay(deg), roundNum)
    print round(Px(deg), roundNum), round(Py(deg), roundNum)
    print ""
}

unset print 
print sprintf('Finish!')

# Output 2: "draw_p_trajectory.txt" is need for plotting the trajectoy of the point P.
dataTrajectory = 'draw_p_trajectory.txt'
print sprintf('Start outputting %s ...', dataTrajectory)
set print dataTrajectory

print sprintf("# %s", dataTrajectory)
print '# t / Px / Py'
set yrange [*:*]    # This command enables to remove restrictions on the range of the stats command.
do for [i=0:360*DEG_DIV:1]{
    stats dataJointsPos using 1 every ::0:i:0:i nooutput
    p_deg = STATS_max
    stats dataJointsPos using 1 every ::6:i:6:i nooutput
    p_pos_x = STATS_max
    stats dataJointsPos using 2 every ::6:i:6:i nooutput
    p_pos_y = STATS_max
    print p_deg, p_pos_x, p_pos_y
}

unset print 
print sprintf('Finish!')

#=================== Plot ====================
if(qtMode == 1) {
    print "Start simulation"
} else {
    print sprintf('Start outputting %d images ...', 2+360*DEG_DIV*LOOP)
}
plotRange = (4.0+2.0)*a
end(loop, i) =  (loop>0) ? 360*DEG_DIV : i

do for [n=0:LOOP-1:1]{
    do for [i=0:360*DEG_DIV:1]{
        if(qtMode != 1) {
            set output sprintf("%s/img_%04d.png", folderName, numPNG)
            numPNG = numPNG + 1
        }

        # Get the value of time from either of txt files
        set yrange [*:*]    # This command enables to remove restrictions on the range of the stats command.
        stats dataJointsPos using 1 every ::0:i:0:i nooutput
        theta = STATS_max
        set title showTheta(theta) left offset screen -0.07, -0.01 font ', 20'

        plot[-plotRange:plotRange][-plotRange:plotRange] \
            dataJointsPos using 1:2 every ::1:i:2:i with linespoints pt 7 ps psJoint lw lwLink lc lcLink, \
            dataJointsPos using 1:2 every ::3:i:6:i with linespoints pt 7 ps psJoint lw lwLink lc lcLink, \
            dataJointsPos using 1:2 every ::6:i:6:i with points pt 7 ps psDrop lc lcDrop, \
            dataTrajectory using 2:3 every ::0::end(n, i) with line lw lwTrajectory lc lcDrop
            # dataTrajectory using 2:3 every ::fadeTrajectory(i)::i with line lw lwTrajectory lc 6

        if(qtMode == 1) {    
            if(i==0) {pause 2}
            pause 0.001     # Adjust the drawing speed
        } else {
            set out # terminal pngcairo
        }
    }
}
    
if(qtMode == 1){ pause 2 }   # Wait a few seconds

# Output the trajectory of the point P
set term pngcairo size 720, 720 font 'Times'
set output "trajectory_plot.png"
plot[-plotRange:plotRange][-plotRange:plotRange] \
    dataTrajectory using 2:3 every ::0::360*DEG_DIV with line lw lwTrajectory lc lcDrop
set out
print sprintf('Finish this program')
