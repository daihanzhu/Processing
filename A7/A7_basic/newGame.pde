int space; // x spaces between dots
float position; // the important variable for where it is positioned at

void newGame() {
  over = false;
  // Set new game and boolean for random speed 
  for (int i= 0; i < 16; i++) {
    y[i] = height / 2;
    x[i] = (i + 1) * (width / 17);
    float direction = random(0, 101); // if direction is bigger than 50, dot moves up
    if (direction > 50) {
      up[i] = true;
    } else {
      up[i] = false;
    }
    // speed is set to random each time
    s[i] = random(0.3, 2.1);
}
   // fill for the red and white dots for new game
   fill(255, 0, 0);
   specialDot = int(random(0, 16));
   fill(255); // fill other dots white
}