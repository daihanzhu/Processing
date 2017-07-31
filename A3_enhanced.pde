void setup() {
  
  size(500, 300);
  background(202, 255, 244);
  
}


float X = 0;
float h = 100;
float t = 30;
float e = 1;

void draw() {
  
  background(202, 255, 244);
  
  // bubbles
  
  fill(12, 10, 200, 70);
  noStroke();
  
  ellipse(X +50, 50, 60, 60);
  
  ellipse(X -150, 100, 30, 30);
  
  ellipse(X -90, 170, 50, 50);
  
  fill(12, 10, 200, t);
  
  ellipse(X -250, 190, 40, 40);
  
  ellipse(X +150, 280, 60, 60);
  
  ellipse(X -400, 280, 80, 80);
  
  // bubble speed
  
  X = X + 3;
  X = X % width;
  
  
  strokeWeight(1);
  fill(255, 160, 122);

  // fish
  
  triangle(mouseX, mouseY, mouseX +50, mouseY +25, mouseX +50, mouseY -25);
  ellipse(mouseX, mouseY, 60, 40);
  
  // eyes
  
  fill(0, 0, 0, e);
  ellipse(mouseX -12, mouseY, 5, 5);
  
  // more bubbles

  noStroke();
  fill(12, 10, 200, 70);
  
  ellipse(X, 150, 140, 140);
  
  ellipse(X +90, 280, 60, 60);
  
  ellipse(X -450, 120, 30, 30);
  
  fill(12, 10, 200, t);
  
  ellipse(X -50, 220, 50, 50);
  
  ellipse(X -350, 160, 40, 40);
  
  ellipse(X +400, 20, 60, 60);
  
  ellipse(X -300, 200, 80, 80);
 
}

void keyPressed() {
  
  // darken bubble
  
  t = t - 30;
  
  
}

void keyReleased() {
  
  // hold to lighten the bubbles
  
  t = t + 50;
  
}

void mousePressed() {
  
  // fish blinks 
  
  e = e + 100;
  
}
  
void mouseReleased() {
  
  // fish blinks
  
  e = e - 100;
  
}
  
  