import processing.svg.*;
import controlP5.*;

int radius1 = 100;
int diameter1 = 100;
int division1 = 30;
int thickness1 = 1;
int rotate1 = 0;

int radius2 = 100;
int diameter2 = 100;
int division2 = 30;
int thickness2 = 0;
int rotate2 = 0;

int radius3 = 100;
int diameter3 = 100;
int division3 = 30;
int thickness3 = 0;
int rotate3 = 0;

boolean hasChangedValue = false;

boolean needToSavePNG = false;
boolean needToSaveSVG = false;
String outFilename = "";

PGraphics outPNG;

ControlP5 cp5;
Textlabel lblStatus;
boolean clearLabel = false;
long startMillis;
int clearInterval = 5000;

void setup() {
  size(1400,800,P2D);
  
  // COOL THING ALERT!!
  // If you have a HiDPI monitor (MacBook Pro Retina, Surface Book, etc)
  // you can make extra hi-res images by uncommenting the following line.
  // BUT!!!!!! 
  // You also need to change the maximum memory in Processing Preferences
  // to 512MB
  // -----------------------------------
  //pixelDensity(displayDensity()); // <-- uncomment for HiDPI screens
  // -----------------------------------

  cp5 = new ControlP5(this);
  
  background(200);
  smooth(4);
  
  outPNG = createGraphics(2400,2400,P2D);
  outPNG.beginDraw();
  outPNG.background(255);
  outPNG.smooth(4);
  outPNG.endDraw();
  
  cp5.addSlider("division1").setPosition(40,120).setSize(300,20).setValue(30).setRange(2,100).setColorCaptionLabel(#000000);
  cp5.addSlider("radius1").setPosition(40,60).setSize(300,20).setValue(100).setRange(10,300).setColorCaptionLabel(#000000);
  cp5.addSlider("diameter1").setPosition(40,90).setSize(300,20).setValue(100).setRange(10,200).setColorCaptionLabel(#000000);
  cp5.addSlider("thickness1").setPosition(40,30).setSize(300,20).setValue(1).setRange(0,10).setColorCaptionLabel(#000000);
  cp5.addSlider("rotate1").setPosition(40,150).setSize(300,20).setValue(0).setRange(0,180).setColorCaptionLabel(#000000);
  
  cp5.addSlider("division2").setPosition(40,320).setSize(300,20).setValue(30).setRange(2,100).setColorCaptionLabel(#000000);
  cp5.addSlider("radius2").setPosition(40,260).setSize(300,20).setValue(100).setRange(10,300).setColorCaptionLabel(#000000);
  cp5.addSlider("diameter2").setPosition(40,290).setSize(300,20).setValue(100).setRange(10,200).setColorCaptionLabel(#000000);
  cp5.addSlider("thickness2").setPosition(40,230).setSize(300,20).setValue(0).setRange(0,10).setColorCaptionLabel(#000000);
  cp5.addSlider("rotate2").setPosition(40,350).setSize(300,20).setValue(0).setRange(0,180).setColorCaptionLabel(#000000);
  
  cp5.addSlider("division3").setPosition(40,520).setSize(300,20).setValue(30).setRange(2,100).setColorCaptionLabel(#000000);
  cp5.addSlider("radius3").setPosition(40,460).setSize(300,20).setValue(100).setRange(10,300).setColorCaptionLabel(#000000);
  cp5.addSlider("diameter3").setPosition(40,490).setSize(300,20).setValue(100).setRange(10,200).setColorCaptionLabel(#000000);
  cp5.addSlider("thickness3").setPosition(40,430).setSize(300,20).setValue(0).setRange(0,10).setColorCaptionLabel(#000000);
  cp5.addSlider("rotate3").setPosition(40,550).setSize(300,20).setValue(0).setRange(0,180).setColorCaptionLabel(#000000);

  cp5.addButton("savePNG").setPosition(40,630).setSize(140,30).setCaptionLabel("Save PNG");
  cp5.addButton("saveSVG").setPosition(200,630).setSize(140,30).setCaptionLabel("Save SVG");
  
  lblStatus = cp5.addTextlabel("lblStatus").setPosition(40,670).setText("").setColorValue(#000000);

}

void generateImage() {
  background(255);

  outPNG.beginDraw();
  outPNG.clear();
  outPNG.stroke(0);
  outPNG.noFill();
  outPNG.ellipseMode(RADIUS);
  outPNG.endDraw();
  
  if (thickness1 > 0) {
    outPNG.beginDraw();
    outPNG.strokeWeight(thickness1);
    for (float i=0;i<TWO_PI;i+=TWO_PI/division1) {
      outPNG.pushMatrix();
      outPNG.translate(outPNG.width/2,outPNG.height/2);
      outPNG.scale(2.0);
      outPNG.rotate(radians(rotate1));
      outPNG.ellipse(sin(i)*diameter1, cos(i) * diameter1, radius1, radius1);
      outPNG.popMatrix();
    }
    outPNG.endDraw();
  }
  if (thickness2 > 0) {
    outPNG.beginDraw();
    outPNG.strokeWeight(thickness2);
    for (float i=0;i<TWO_PI;i+=TWO_PI/division2) {
      outPNG.pushMatrix();
      outPNG.translate(outPNG.width/2,outPNG.height/2);
      outPNG.scale(2.0);
      outPNG.rotate(radians(rotate2));
      outPNG.ellipse(sin(i)*diameter2, cos(i) * diameter2, radius2, radius2);
      outPNG.popMatrix();
    }
    outPNG.endDraw();
  }
  if (thickness3 > 0) {
    outPNG.beginDraw();
    outPNG.strokeWeight(thickness3);
    for (float i=0;i<TWO_PI;i+=TWO_PI/division3) {
      outPNG.pushMatrix();
      outPNG.translate(outPNG.width/2,outPNG.height/2);
      outPNG.scale(2.0);
      outPNG.rotate(radians(rotate3));
      outPNG.ellipse(sin(i)*diameter3, cos(i) * diameter3, radius3, radius3);
      outPNG.popMatrix();
    }
    outPNG.endDraw();
  }
  
}

void savePNG() {
  selectOutput("Select a name and location to save PNG","saveAsPng");
}

void saveAsPng(File saveLocation) {
  if (saveLocation != null) {
    String path = saveLocation.getAbsolutePath();
    String filename = saveLocation.getName();
    if (filename.indexOf(".png") < 0) {
      path += ".png";
    }
    outFilename = path;
    needToSavePNG = true;
  }
}

void saveSVG() {
  selectOutput("Select a name and location to save SVG","saveAsSvg");
}

void saveAsSvg(File saveLocation) {
  if (saveLocation != null) {
    String path = saveLocation.getAbsolutePath();
    String filename = saveLocation.getName();
    if (filename.indexOf(".svg") < 0) {
      path += ".svg";
    }
    outFilename = path;
    needToSaveSVG = true;
  }
}


void draw() {
  if (hasChangedValue) {
    // only regenerate if we've changed a value
    generateImage();
    hasChangedValue = false;
  }
  
  // draw the generated image
  background(255);
  image(outPNG,350,-200,1200,1200);

  // handle saving PNG or SVG
  if (needToSavePNG) {
    if (outFilename != "") {
      // we can just save our off-screen canvas
      outPNG.save(outFilename);
      lblStatus.setText("Saved PNG as " + outFilename);
      startMillis = millis();
      clearLabel = true;
    }
    needToSavePNG = false;
  }
  if (needToSaveSVG) {
    // we need to re-render into a SVG canvas
    renderSVG();
  }
  
  if (clearLabel) {
    if (millis() - startMillis > clearInterval) {
      lblStatus.setText("");
      clearLabel = false;
    }
  }
}

public void controlEvent(ControlEvent theEvent) {
  hasChangedValue = true;
}


void renderSVG() {
  lblStatus.setText("Saving...");
  PGraphics s = createGraphics(2400,2400,SVG,outFilename);
  s.beginDraw();
  s.stroke(0);
  s.noFill();
  s.ellipseMode(RADIUS);
  
  if (thickness1 > 0) {
    s.strokeWeight(thickness1);
    for (float i=0;i<TWO_PI;i+=TWO_PI/division1) {
      s.pushMatrix();
      s.translate(s.width/2,s.height/2);
      s.scale(2.0);
      s.rotate(rotate1);
      s.ellipse(sin(i)*diameter1, cos(i) * diameter1, radius1, radius1);
      s.popMatrix();
    }
  }
  if (thickness2 > 0) {
    s.strokeWeight(thickness2);
    for (float i=0;i<TWO_PI;i+=TWO_PI/division2) {
      s.pushMatrix();
      s.translate(s.width/2,s.height/2);
      s.scale(2.0);
      s.rotate(rotate2);
      s.ellipse(sin(i)*diameter2, cos(i) * diameter2, radius2, radius2);
      s.popMatrix();
    }
  }
  if (thickness3 > 0) {
    s.strokeWeight(thickness3);
    for (float i=0;i<TWO_PI;i+=TWO_PI/division3) {
      s.pushMatrix();
      s.translate(s.width/2,s.height/2);
      s.scale(2.0);
      s.rotate(rotate3);
      s.ellipse(sin(i)*diameter3, cos(i) * diameter3, radius3, radius3);
      s.popMatrix();
    }
  }
  s.dispose();
  s.endDraw();
  needToSaveSVG = false;
  lblStatus.setText("Saved SVG as " + outFilename);
  startMillis = millis();
  clearLabel = true;
}