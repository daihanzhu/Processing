Circle circle = new Circle();

void draw() {
  background(200);
 
  circle.display();
}

class Circle {
 
  float x = 50;
  float y = 50;
  
  void display() {
    ellipse(x, y, 30, 30);
  }
}