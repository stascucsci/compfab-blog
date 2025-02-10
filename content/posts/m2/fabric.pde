import processing.svg.*;

float s = 20;
int n = 25;
float rs = (n/2+1)*s*2.5;

void pattern_1_4() {
  line(0, 0, s, 0);
  line(s, 0, s, s);
  line(s, s, s/2, s);
  line(s/2, s, s/2, s/2);
}

void pattern() {
  pushMatrix();
  pattern_1_4();
  rotate(PI/2);
  pattern_1_4();
  rotate(PI/2);
  pattern_1_4();
  rotate(PI/2);
  pattern_1_4();
  popMatrix();
}


void setup() {
  size(700, 700);
  boolean save = true;
  if (save) beginRecord(SVG, "proc_fabric.svg");
  
  pushMatrix();
  translate(width/2, height/2);
  
  noFill();
  rect(-rs/2, -rs/2, rs, rs);

  // Draw main pattern
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n/2+1 - y%2; x++) {
      pushMatrix();
      translate(((2*x-n/2)+y%2)*s*1.25, (y-n/2)*s*1.25);
      pattern();
      popMatrix();
    }
  }
  
  // Fill in edges
  for (int side = 0; side < 4; side++) {
    rotate(PI/2);
    for (int x = 0; x < n/2+1; x++) {
      pushMatrix();
      translate((2*x-n/2-1)*s*1.25, (-n/2-1)*s*1.25);
      pattern_1_4();
      rotate(PI/2);
      if (x != 0)
        pattern_1_4();
      popMatrix();
    }
  }
  
  popMatrix();
  if (save) endRecord();
}
