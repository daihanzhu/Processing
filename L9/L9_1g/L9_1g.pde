Circle circle = new Circle();
Circle circle1 = new Circle();
Circle circle2 = new Circle();

void setup() {
  colorMode(HSB, 360, 100, 100);
  
//  circle.x = 50;
//  circle.y = 50; 
//  circle.s = 50;
//  circle.hue = 100;

}

void draw() {
  
  circle.display();
  circle.update();
  
  circle.display();
  circle.update();

  circle1.display();
  circle1.update();

  circle2.display();
  circle2.update();
}

class Circle {
 
  float x;
  float y; 
  float s;
  float hue;
  
  Circle() {
    x = random(20, 80);
    y = random(20, 80);
    s = random(10, 50);
    hue = random(0, 100);
  }
  
  void display() {
    fill(hue, 100, 100);
    ellipse(x, y, s, s);
  }
  
  void update() {
    x += random(-2, 2);
    y += random(-2, 2);
  }
}