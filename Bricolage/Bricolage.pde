// Daihan Zhu
// 20643647

PImage water;
PShape star;

import processing.pdf.*; // import PDF

void setup() {
  size(500, 400);
  water = loadImage("water1.jpg");
  star = loadShape("starbucks_logo.svg");

  image(water, 0, 0, width, height); // background
}

void draw() {

  for ( int i = 0; i < width; i++) {
    noStroke();
    ellipse(i, 50, 20, 20); // circles
    ellipse(i + 30, 350, 20, 20);
    i = i + 60;
  }
  shape(star, 90, 90, width / 1.6, height / 2); //Starbucks
}

void keyPressed() {
  if ( key == 'r') {
    save("output.png");
  }
  if ( key == 'v') {
    //Once key pressed, record as PDF
    beginRecord( PDF, "output.pdf");
    image(water, 0, 0, width, height); // background
   
    for ( int i = 0; i < width; i++) {
      noStroke();
      ellipse(i, 50, 20, 20); // circles
      ellipse(i + 30, 350, 20, 20);
      i = i + 60;
    }
    shape(star, 90, 90, width / 1.6, height / 2); // starbucks

    endRecord();
  }
}