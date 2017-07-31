// Daihan Zhu
// 20643647

PShape car; 

// ratio variables for the mountains
int dx = 1; 
int dx2 = 2;
int dx3 = 3;

void setup() {
  size(500, 400);
  // car image
  car = loadShape("rover.svg");
}

// Background mountain
float newRange(float x) {
  float a = noise(x);
  return map(a, 0, 1, 600, 1500);
}

// Foreground mountain
float newRange1(float x) {
  float a = noise(x);
  return map(a, 0, 1, 1900, 2400);
}

// Flat terrain
float newRange2(float x) {
  float a = noise(x);
  return map(a, 0, 1, 3000, 3300);
}

void draw() {
  background(252, 110, 110); // Salmon colour

  noFill();

  //Background Mountain
  beginShape();
  fill(0);
  noStroke();
  for (int i = 0; i < 600; i++) {
    float v = (i - dx) *0.05;
    vertex(i, newRange(v)/10.0);
  }
  vertex(width, 200);
  vertex(width, height + 10);
  vertex(0, height + 10);
  endShape(CLOSE);

  //Foreground Mountain 
  beginShape();
  fill(100);
  noStroke();
  for (int i = 0; i < 600; i++) {
    float v = (i - dx2) *0.05;
    vertex(i, newRange1(v)/10.0);
  }
  vertex(width, 200);
  vertex(width, height + 10);
  vertex(0, height + 10);
  endShape(CLOSE);

  //Flat terrain
  beginShape();
  fill(222, 216, 192);
  noStroke();
  for (int i = 0; i < 600; i++) {
    float v = (i - dx3) *0.01;
    fill(222, 216, 192);
    vertex(i, newRange2(v)/10.0);
  }
  vertex(width, 200);
  vertex(width, height + 10);
  vertex(0, height + 10);
  endShape(CLOSE);

  // Car 
  shape(car, 90, 220);
  fill(0);
  // Wheels 
  float v = (120 - dx3) *0.01;
  ellipse(120, (newRange2(v)/10.0) -10, 20, 20);
  float w = (140 - dx3) *0.01;
  ellipse(150, (newRange2(w)/10.0) -10, 20, 20);
  float x = (210 - dx3) *0.01;
  ellipse(210, (newRange2(x)/10.0) -10, 20, 20);
  float y = (230 - dx3) *0.01;
  ellipse(240, (newRange2(y)/10.0) -10, 20, 20);

  // animated movements 
  dx--; // Background mountain
  dx2-=2; // foreground Mountain
  dx3-=3; // flat ground
}