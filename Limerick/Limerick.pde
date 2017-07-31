String[] poem = {"There was an Old Man of Hong Kong,", 
  "Who never did anything wrong.", 
  "He lay on his back,", 
  "With his head in a sack,", 
  "That innocuous Old Man of Hong Kong."};

int count = 1;                 

void setup() {
  background(211, 250, 255);
  size(600, 300);
  textFont(createFont("Helvetica", 28));
  fill(225, 155, 100);
}

void draw() {
  noFill();
  strokeWeight(10);
  rect(20, 20, 560, 260);
}

void keyPressed() {
  key = ' ';
  for (int i = 0; i < count; i++) {
    text(poem[i], 50, 50 * i + 50);
  }
  count ++;
  count = constrain(count, 0, 5);
}