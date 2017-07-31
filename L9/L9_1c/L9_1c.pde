Circle circle = new Circle();

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