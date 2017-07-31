
Circle circle = new Circle();

void draw() {
  background(200);
 
  circle.display();
}

class Circle {
 
  float x;
  float y;
  
  void display() {
    ellipse(x, y, 30, 30);
  }
}