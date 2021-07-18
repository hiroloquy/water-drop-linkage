# Water Drop Linkage
"water-drop-linkage" is a simulator of a linkage mechanism  with gnuplot.
To create this simulator, I referenced the following tweet.

**<blockquote class="twitter-tweet"><p lang="und" dir="ltr"><a href="https://t.co/wW6MiVxrWs">pic.twitter.com/wW6MiVxrWs</a></p>&mdash; 上木 敬士郎 Keishiro Ueki (@ChocoLinkage) <a href="https://twitter.com/ChocoLinkage/status/1399198044122271746?ref_src=twsrc%5Etfw">May 31, 2021</a></blockquote>**

## Demo
<img src="demo.gif" width="450" alt="demo.gif" title="demo.gif">

## Modeling
<img src="modeling.png" width="450" alt="modeling.png" title="modeling.png">

### Coordinate of <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\mathrm{A}" title="\LARGE \mathrm{A}" /> and <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\mathrm{C}" title="\LARGE \mathrm{C}" />
<img src="https://latex.codecogs.com/gif.latex?\overrightarrow{\mathrm{OA}}=\begin{bmatrix}&space;-a\sin\theta&space;\\&space;a\cos\theta&space;\end{bmatrix}\&space;,\&space;\&space;\overrightarrow{\mathrm{OC}}=\begin{bmatrix}&space;0&space;\\&space;-2a&space;\end{bmatrix}" title="\overrightarrow{\mathrm{O_1 A}}=\begin{bmatrix}&space;-a\sin\theta&space;\\&space;a\cos\theta&space;\end{bmatrix}\&space;,\&space;\&space;\overrightarrow{\mathrm{OC}}=\begin{bmatrix}&space;0&space;\\&space;-2a&space;\end{bmatrix}" />

### Length <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;l" title="\LARGE l" /> and angle <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\alpha" title="\LARGE \alpha" />
<img src="https://latex.codecogs.com/gif.latex?l=a\sqrt{5&plus;4\cos\theta}\&space;\&space;(\because&space;\mathrm{Law\&space;of&space;\&space;cosines})" title="l=a\sqrt{5+4\cos\theta}\ \ (\because \mathrm{Law\ of \ cosines})" /> ,

<img src="https://latex.codecogs.com/gif.latex?\cos\alpha&space;=&space;\frac{l^2&plus;3a^2}{4al}\&space;,&space;\&space;\sin\alpha&space;=&space;\begin{cases}&space;\&space;\&space;\sqrt{1-\cos\alpha}&space;&&space;\left(0^{\circ}\leq&space;\theta\leq&space;180^{\circ}&space;\right&space;)\\&space;-\sqrt{1-\cos\alpha}&space;&&space;\left(180^{\circ}<\theta<&space;360^{\circ}&space;\right&space;)&space;\end{cases}" title="\cos\alpha = \frac{l^2+3a^2}{4al}\ , \ \sin\alpha = \begin{cases} \ \ \sqrt{1-\cos\alpha} & \left(0^{\circ}\leq \theta\leq 180^{\circ} \right )\\ -\sqrt{1-\cos\alpha} & \left(180^{\circ}<\theta< 360^{\circ} \right ) \end{cases}" />

### Coordinate of <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\mathrm{B}" title="\LARGE \mathrm{B}" /> and <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\mathrm{P}" title="\LARGE \mathrm{P}" />

<img src="https://latex.codecogs.com/gif.latex?\begin{align*}&space;\overrightarrow{\mathrm{OB}}&=\overrightarrow{\mathrm{OC}}&plus;\overrightarrow{\mathrm{CB}}\\&space;&=&space;\begin{bmatrix}&space;0\\-2a&space;\end{bmatrix}&space;&plus;&space;\begin{bmatrix}&space;-2a\sin2\alpha\\-2a\cos&space;2\alpha&space;\end{bmatrix}=&space;\begin{bmatrix}&space;-4a\cos\alpha&space;\sin&space;\alpha&space;\\&space;-4a\cos^2\alpha&space;\end{bmatrix}&space;\end{align*}" title="\begin{align*} \overrightarrow{\mathrm{OB}}&=\overrightarrow{\mathrm{OC}}+\overrightarrow{\mathrm{CB}}\\ &= \begin{bmatrix} 0\\-2a \end{bmatrix} + \begin{bmatrix} -2a\sin2\alpha\\-2a\cos 2\alpha \end{bmatrix}= \begin{bmatrix} -4a\cos\alpha \sin \alpha \\ -4a\cos^2\alpha \end{bmatrix} \end{align*}" />

<img src="https://latex.codecogs.com/gif.latex?\overrightarrow{\mathrm{OP}}=\overrightarrow{\mathrm{OA}}&plus;\overrightarrow{\mathrm{AP}}=\overrightarrow{\mathrm{OA}}&plus;3\overrightarrow{\mathrm{BA}}=4\overrightarrow{\mathrm{OA}}-3\overrightarrow{\mathrm{OB}}" title="\overrightarrow{\mathrm{OP}}=\overrightarrow{\mathrm{OA}}+\overrightarrow{\mathrm{AP}}=\overrightarrow{\mathrm{OA}}+3\overrightarrow{\mathrm{BA}}=4\overrightarrow{\mathrm{OA}}-3\overrightarrow{\mathrm{OB}}" />

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

### Blog 
This article is written in detail and in Japanese. You can translate it in your language.  
https://hiroloquy.com/2021/07/05/water-drop-linkage-explanation/

### YouTube
http://www.youtube.com/watch?v=rSbgDpycorc  
[![Water Drop Linkage: Modeling and Simulation Using Gnuplot](http://img.youtube.com/vi/rSbgDpycorc/0.jpg)](http://www.youtube.com/watch?v=rSbgDpycorc "Water Drop Linkage: Modeling and Simulation Using Gnuplot")

## License
"water-drop-linkage" is under [Hiroloquy](https://hiroloquy.com/).
 
