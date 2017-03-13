# Spiroh

Processing app to create guilloche-like images&mdash;similar to a spirograph&mdash;using three layers of repeating circles, with controls over each layer. 

The app starts with a single layer. Adjust the sliders at the top-left to change different paramaters including size, thickness, number of repeats, and even rotation angle. The design will update in real-time with your changes. Setting a thickness value to 0 (zero) will turn off a layer, while any other value will turn on that layer.

After creating a design you like, you can export either a PNG or SVG of your design. You can use PNGs to raster engrave with a laser cutter, or the SVG to send to a CNC or pen-plotter (e.g.: AxiDraw)

To run this app you will need Processing (processing.org) and the ControlP5 library (Sketch->Import Library...->Add Library...)

Here are a few examples, including the interface:

<img width="1400" alt="spiroh_05f" src="https://cloud.githubusercontent.com/assets/2564583/23840290/541ff34c-0761-11e7-84c3-044b918b254f.png">

![spiroh_5294199](https://cloud.githubusercontent.com/assets/2564583/23840282/482de9b8-0761-11e7-84e5-319aba74f0d8.png)

<img width="371" alt="spiroh_02" src="https://cloud.githubusercontent.com/assets/2564583/23840479/d21bf830-0762-11e7-977c-ef3cd741846b.png">

<img width="800" alt="spiroh_04" src="https://cloud.githubusercontent.com/assets/2564583/23840480/d2233d84-0762-11e7-998b-9df77d247a42.png">

NOTE: In-app images may go outside the bounds of the screen, but the saved PNGs and SVGs are NOT cut off! I wouldn't do that to you! :-)
