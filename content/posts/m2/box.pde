import processing.svg.*;

float s = 3;
float f_w = 4 * s;
float f_h = 1.9 * s;
float n = 10;
float f_s = f_w*n*2;

void male() {
  for (int x = 0; x < n; x++) {
    line(0, 0, f_w, 0);
    line(f_w, 0, f_w, f_h);
    line(f_w, f_h, f_w*2, f_h);
    line(f_w*2, f_h, f_w*2, 0);
    translate(f_w*2, 0);
  }
}

void female() {
  for (int x = 0; x < n; x++) {
    line(0, f_h, f_w, f_h);
    line(f_w, f_h, f_w, 0);
    line(f_w, 0, f_w*2, 0);
    line(f_w*2, f_h, f_w*2, 0);
    translate(f_w*2, 0);
  }
}

int MALE = 0;
int FEMALE = 1;

void face(int top, int right, int bottom, int left) {
  int[] edges = {top, right, bottom, left};
  for (int i = 0; i < 4; i++) {
    pushMatrix();
    rotate(i*PI/2);
    translate(-f_s/2, -f_s/2);
    if (edges[i] == MALE) male();
    if (edges[i] == FEMALE) female();
    popMatrix();
  }
}

void side() {
  face(MALE, FEMALE, MALE, MALE);
}

void top() {
  face(MALE, MALE, MALE, MALE);
}

void bottom() {
  face(FEMALE, FEMALE, FEMALE, FEMALE);
}

void setup() {
  size(800, 500);
  boolean save = true;
  if (save) beginRecord(SVG, "proc_box.svg");
  
  pushMatrix();
  noFill();
  
  pushMatrix();
  translate(f_s/2, f_s/2);
  side();
  translate(f_s + 1*s, 0);
  side();
  translate(f_s + 1*s, 0);
  side();
  translate(-2*(f_s + 1*s), f_s + 1*s);
  side();
  translate(f_s + 1*s, 0);
  top();
  translate(f_s + 1*s, 0);
  bottom();
  popMatrix();

  popMatrix();
  
  if (save) endRecord();
}
