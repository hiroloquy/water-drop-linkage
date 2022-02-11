# Water Drop Linkage
"water-drop-linkage" is a simulator of a linkage mechanism  with gnuplot.
To create this simulator, I referenced the following tweet.

**<blockquote class="twitter-tweet"><p lang="und" dir="ltr"><a href="https://t.co/wW6MiVxrWs">pic.twitter.com/wW6MiVxrWs</a></p>&mdash; 上木 敬士郎 Keishiro Ueki (@ChocoLinkage) <a href="https://twitter.com/ChocoLinkage/status/1399198044122271746?ref_src=twsrc%5Etfw">May 31, 2021</a></blockquote>**

## Documents
The details of the script and comparison of the outputted samples are documented in my blog.
My blog is written in Japanese, but you can translate it in your language by GTranslate.  
- [Japanese](https://hiroloquy.com/2021/07/05/water-drop-linkage-explanation/)
- [English (auto translated)](https://hiroloquy-com.translate.goog/2021/07/05/water-drop-linkage-explanation/?_x_tr_sl=ja&_x_tr_tl=en&_x_tr_hl=ja&_x_tr_pto=wapp)

## Demo
<img src="demo.gif" width="400" alt="demo.gif" title="demo.gif">

## Modeling
<img src="modeling.png" width="400" alt="modeling.png" title="modeling.png">

### Coordinate of <img src="https://render.githubusercontent.com/render/math?math=%5CLarge+%5Cdisplaystyle+%5Cmathrm%7BA%7D" alt="\mathrm{A}"> and <img src="https://render.githubusercontent.com/render/math?math=%5CLarge+%5Cdisplaystyle+%5Cmathrm%7BC%7D" alt="\mathrm{C}">
<img src="https://render.githubusercontent.com/render/math?math=%5Clarge+%5Cdisplaystyle+%5Coverrightarrow%7B%5Cmathrm%7BOA%7D%7D%3D%5Cbegin%7Bbmatrix%7D-a%5Csin%5Ctheta%5C%5C+a%5Ccos%5Ctheta%5Cend%7Bbmatrix%7D%5C+%2C+%5C+%5Coverrightarrow%7B%5Cmathrm%7BOC%7D%7D%3D%5Cbegin%7Bbmatrix%7D+0+%5C%5C+-2a++%0A%5Cend%7Bbmatrix%7D" alt="\overrightarrow{\mathrm{OA}}=\begin{bmatrix}-a\sin\theta\\ a\cos\theta\end{bmatrix}\ , \ \overrightarrow{\mathrm{OC}}=\begin{bmatrix} 0 \\ -2a  \end{bmatrix}">

### Length <img src="https://render.githubusercontent.com/render/math?math=%5CLarge+%5Cdisplaystyle+l" alt="l"> and angle <img src="https://render.githubusercontent.com/render/math?math=%5CLarge+%5Cdisplaystyle+%5Calpha" alt="\alpha">
<img src="https://render.githubusercontent.com/render/math?math=%5Clarge+%5Cdisplaystyle+l%3Da%5Csqrt%7B5%2B4%5Ccos%5Ctheta%7D%5C+%5C+%28%5Cbecause+%5Cmathrm%7BLaw%5C+of+%5C+cosines%7D%29" alt="l=a\sqrt{5+4\cos\theta}\ \ (\because \mathrm{Law\ of \ cosines})"> ,

<img src="https://render.githubusercontent.com/render/math?math=%5Clarge+%5Cdisplaystyle+%5Ccos%5Calpha+%3D+%5Cfrac%7Bl%5E2%2B3a%5E2%7D%7B4al%7D%5C+%2C+%5C+%5Csin%5Calpha+%3D+%5Cbegin%7Bcases%7D+%5C+%5C+%5Csqrt%7B1-%5Ccos%5Calpha%7D+%26+%5Cleft%280%5E%7B%5Ccirc%7D%5Cleq+%5Ctheta%5Cleq+180%5E%7B%5Ccirc%7D+%5Cright+%29%5C%5C+-%5Csqrt%7B1-%5Ccos%5Calpha%7D+%26+%5Cleft%28180%5E%7B%5Ccirc%7D%3C%5Ctheta%3C+360%5E%7B%5Ccirc%7D+%5Cright+%29+%5Cend%7Bcases%7D" alt="\cos\alpha = \frac{l^2+3a^2}{4al}\ , \ \sin\alpha = \begin{cases} \ \ \sqrt{1-\cos\alpha} & \left(0^{\circ}\leq \theta\leq 180^{\circ} \right )\\ -\sqrt{1-\cos\alpha} & \left(180^{\circ}<\theta< 360^{\circ} \right ) \end{cases}">

### Coordinate of <img src="https://render.githubusercontent.com/render/math?math=%5CLarge+%5Cdisplaystyle+%5Cmathrm%7BB%7D" alt="\mathrm{B}"> and <img src="https://render.githubusercontent.com/render/math?math=%5CLarge+%5Cdisplaystyle+%5Cmathrm%7BP%7D" alt="\mathrm{P}">

<img src=
"https://render.githubusercontent.com/render/math?math=%5Clarge+%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D+%5Coverrightarrow%7B%5Cmathrm%7BOB%7D%7D%26%3D%5Coverrightarrow%7B%5Cmathrm%7BOC%7D%7D%2B%5Coverrightarrow%7B%5Cmathrm%7BCB%7D%7D%5C%5C%0A%26%3D+%5Cbegin%7Bbmatrix%7D+0%5C%5C-2a+%5Cend%7Bbmatrix%7D+%2B+%5Cbegin%7Bbmatrix%7D+-2a%5Csin2%5Calpha+%5C%5C+%0A-2a%5Ccos+2%5Calpha+%5Cend%7Bbmatrix%7D%3D+%5Cbegin%7Bbmatrix%7D+-4a%5Ccos%5Calpha+%5Csin+%5Calpha+%5C%5C%0A-4a%5Ccos%5E2%5Calpha+%5Cend%7Bbmatrix%7D%5C%5C%0A%5Coverrightarrow%7B%5Cmathrm%7BOP%7D%7D%26%3D%5Coverrightarrow%7B%5Cmathrm%7BOA%7D%7D%2B%5Coverrightarrow%7B%5Cmathrm%7BAP%7D%7D%3D%5Coverrightarrow%7B%5Cmathrm%7BOA%7D%7D%2B3%5Coverrightarrow%7B%5Cmathrm%7BBA%7D%7D%3D4%5Coverrightarrow%7B%5Cmathrm%7BOA%7D%7D-3%5Coverrightarrow%7B%5Cmathrm%7BOB%7D%7D%0A%5Cend%7Balign%2A%7D%0A" alt="\begin{align*} \overrightarrow{\mathrm{OB}}&=\overrightarrow{\mathrm{OC}}+\overrightarrow{\mathrm{CB}}\\&= \begin{bmatrix} 0\\-2a \end{bmatrix} + \begin{bmatrix} -2a\sin2\alpha \\ -2a\cos 2\alpha \end{bmatrix}= \begin{bmatrix} -4a\cos\alpha \sin \alpha \\-4a\cos^2\alpha\end{bmatrix}\\\overrightarrow{\mathrm{OP}}&=\overrightarrow{\mathrm{OA}}+\overrightarrow{\mathrm{AP}}=\overrightarrow{\mathrm{OA}}+3\overrightarrow{\mathrm{BA}}=4\overrightarrow{\mathrm{OA}}-3\overrightarrow{\mathrm{OB}}\end{align*}">

## Features
You enable to switch terminal type `qt` or `pngcairo` by using **`qtMode`**.
- If you select `qt` terminal (`qtMode==1`), gnuplot opens qt window and you can run this simulator.
The drawing speed of the qt window can be adjusted with the `pause` command.
```
pause 0.001     # Adjust the drawing speed
```
- On the other hand, in `pngcairo` terminal (`qtMode!=1`), you can get a lot of PNG images of the simulation.
By using the outputted images, you can make a video or an animated GIF.

<!-- # Operating environment -->
## Requirement
- macOS Big Sur 11.3.1 / Macbook Air (M1, 2020) 16GB
- gnuplot version 5.4 patchlevel 1
- VScode 1.56.2
- ffmpeg 4.4

<!-- # Installation -->
 
## Usage
```
git clone https://github.com/hiroloquy/water-drop-linkage.git
cd water-drop-linkage
gnuplot
load 'water_drop_linkage.plt'
```

## Note
I made a MP4 file (demo.mp4) and an animated GIF (demo.gif) by using **ffmpeg**.

### MP4
```
cd water-drop-linkage
ffmpeg -framerate 60 -i png/img_%04d.png -vcodec libx264 -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -r 60 demo.mp4
```

### GIF
```
cd water-drop-linkage
ffmpeg -i demo.mp4 -filter_complex "[0:v] fps=30,split [a][b];[a] palettegen [p];[b][p] paletteuse" demo.gif
```
## Author
* Hiro Shigeyoshi
* Twitter: https://twitter.com/hiroloquy

### YouTube
http://www.youtube.com/watch?v=rSbgDpycorc  
[![Water Drop Linkage: Modeling and Simulation Using Gnuplot](http://img.youtube.com/vi/rSbgDpycorc/0.jpg)](http://www.youtube.com/watch?v=rSbgDpycorc "Water Drop Linkage: Modeling and Simulation Using Gnuplot")

## License
"water-drop-linkage" is under [MIT license](https://github.com/hiroloquy/water-drop-linkage/blob/master/LICENSE).
 
