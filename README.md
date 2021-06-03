# Water Drop Linkage
"water-drop-linkage" is a simulator of a linkage mechanism  with gnuplot.
To create this simulator, I referenced the following tweet.

**<blockquote class="twitter-tweet"><p lang="und" dir="ltr"><a href="https://t.co/wW6MiVxrWs">pic.twitter.com/wW6MiVxrWs</a></p>&mdash; 上木 敬士郎 Keishiro Ueki (@ChocoLinkage) <a href="https://twitter.com/ChocoLinkage/status/1399198044122271746?ref_src=twsrc%5Etfw">May 31, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>**

# Demo
![demo_2x.gif](demo_2x.gif)

# Modeling
<img src="modeling.png" width="600">

## Coordinate of <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\mathrm{A}" title="\LARGE \mathrm{A}" /> and <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\mathrm{C}" title="\LARGE \mathrm{C}" />
<img src="https://latex.codecogs.com/gif.latex?\overrightarrow{\mathrm{OA}}=\begin{bmatrix}&space;-a\sin\theta&space;\\&space;a\cos\theta&space;\end{bmatrix}\&space;,\&space;\&space;\overrightarrow{\mathrm{OC}}=\begin{bmatrix}&space;0&space;\\&space;-2a&space;\end{bmatrix}" title="\overrightarrow{\mathrm{O_1 A}}=\begin{bmatrix}&space;-a\sin\theta&space;\\&space;a\cos\theta&space;\end{bmatrix}\&space;,\&space;\&space;\overrightarrow{\mathrm{OC}}=\begin{bmatrix}&space;0&space;\\&space;-2a&space;\end{bmatrix}" />

## Length <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;l" title="\LARGE l" /> and angle <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\alpha" title="\LARGE \alpha" />
<img src="https://latex.codecogs.com/gif.latex?l=a\sqrt{5&plus;4\cos\alpha}\&space;\&space;(\because&space;\mathrm{Law\&space;of&space;\&space;cosines})" title="l=a\sqrt{5+4\cos\alpha}\ \ (\because \mathrm{Law\ of \ cosines})" /> ,

<img src="https://latex.codecogs.com/gif.latex?\cos\alpha&space;=&space;\frac{l^2&plus;3a^2}{4al}\&space;,&space;\&space;\sin\alpha&space;=&space;\begin{cases}&space;\&space;\&space;\sqrt{1-\cos\alpha}&space;&&space;(0\leq\alpha\leq\pi)\\&space;-\sqrt{1-\cos\alpha}&space;&&space;(\pi\leq\alpha<2\pi)&space;\end{cases}" title="\cos\alpha = \frac{l^2+3a^2}{4al}\ , \ \sin\alpha = \begin{cases} \ \ \sqrt{1-\cos\alpha} & (0\leq\alpha\leq\pi)\\ -\sqrt{1-\cos\alpha} & (\pi\leq\alpha<2\pi) \end{cases}" />

## Coordinate of <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\mathrm{B}" title="\LARGE \mathrm{B}" /> and <img src="https://latex.codecogs.com/gif.latex?\inline&space;\LARGE&space;\mathrm{P}" title="\LARGE \mathrm{P}" />

<img src="https://latex.codecogs.com/gif.latex?\begin{align*}&space;\overrightarrow{\mathrm{OB}}&=\overrightarrow{\mathrm{OC}}&plus;\overrightarrow{\mathrm{CB}}\\&space;&=&space;\begin{bmatrix}&space;0\\-2a&space;\end{bmatrix}&space;&plus;&space;\begin{bmatrix}&space;-2a\sin2\alpha\\-2a\cos&space;2\alpha&space;\end{bmatrix}=&space;\begin{bmatrix}&space;-4a\cos\alpha&space;\sin&space;\alpha&space;\\&space;-4a\cos^2\alpha&space;\end{bmatrix}&space;\end{align*}" title="\begin{align*} \overrightarrow{\mathrm{OB}}&=\overrightarrow{\mathrm{OC}}+\overrightarrow{\mathrm{CB}}\\ &= \begin{bmatrix} 0\\-2a \end{bmatrix} + \begin{bmatrix} -2a\sin2\alpha\\-2a\cos 2\alpha \end{bmatrix}= \begin{bmatrix} -4a\cos\alpha \sin \alpha \\ -4a\cos^2\alpha \end{bmatrix} \end{align*}" />

<img src="https://latex.codecogs.com/gif.latex?\overrightarrow{\mathrm{OP}}=\overrightarrow{\mathrm{OA}}&plus;\overrightarrow{\mathrm{AP}}=\overrightarrow{\mathrm{OA}}&plus;3\overrightarrow{\mathrm{BA}}=4\overrightarrow{\mathrm{OA}}-3\overrightarrow{\mathrm{OB}}" title="\overrightarrow{\mathrm{OP}}=\overrightarrow{\mathrm{OA}}+\overrightarrow{\mathrm{AP}}=\overrightarrow{\mathrm{OA}}+3\overrightarrow{\mathrm{BA}}=4\overrightarrow{\mathrm{OA}}-3\overrightarrow{\mathrm{OB}}" />

# Features
You enable to switch terminal type `qt` or `pngcairo` by using **`qtMode`**.
- If you select `qt` terminal (`qtMode==1`), gnuplot opens qt window and you can run this simulator.

- On the other hand, in `pngcairo` terminal (`qtMode!=1`), you can get a lot of PNG images of the simulation.
By using the outputted images, you can make a video or an animated GIF.

# Operating environment
<!-- # Requirement -->
- macOS Big Sur 11.3.1 / Macbook Air (M1, 2020) 16GB
- gnuplot version 5.4 patchlevel 1
- VScode 1.56.2

<!-- # Installation -->
 
# Usage
```
git clone https://github.com/hiroloquy/water-drop-linkage.git
cd water-drop-linkage
gnuplot
load 'water_drop_linkage.plt'
```

# Note
I made a MP4 file (demo.mp4) by using **ffmpeg**.

```
cd water-drop-linkage
ffmpeg -framerate 60 -i png/img_%04d.png -vcodec libx264 -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -r 60 demo.mp4
```
 
# Author
* Hiro Shigeyoshi
* Twitter: https://twitter.com/Sm_pgmf
 
# License
"water-drop-linkage" is under [Hiroloquy](https://hiroloquy.com/).
 