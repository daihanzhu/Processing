Circle circle = new Circle();

void setup() {
  colorMode(HSB, 360, 100, 100);
  float hue = 100;
  fill(hue, 80, 100);
}

void draw() {
  background(200);
 
  circle.display();
}

class Circle {
 
  float x = 50;
  float y = 50;
  
  float s = 50;
  
  void display() {
    ellipse(x, y, s, s);
  }
}