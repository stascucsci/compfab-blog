import processing.svg.*;

void setup() {
  size(2728/4, 3410/4);
  PImage img = loadImage("photo.jpg");
  img.filter(GRAY);
  noStroke();
  background(255);
  
  boolean save = true;
  
  if (save) beginRecord(SVG, "out.svg");
  
  int step = 10;
  for (int y = step/2; y < height; y += step) {
    for (int x = step/2; x < width; x += step) {
      color c = img.get((int)(x/(float)width * img.width), (int)(y/(float)height * img.height));      
      fill(0);
      float v = 1-brightness(c)/255.0f;
      v = pow(v, 1.3);
      float s = 20*v;
      if (s > 1)
        circle(x, y, s);
    }
  }
  
  if (save) endRecord();
}
