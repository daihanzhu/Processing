float[] x = new float[16]; // x position
boolean[] up = new boolean[16]; // when up is true dot moves up, otherwise it moves down
float [] y = new float[16]; // y position
float [] s = new float [16]; // speed
boolean circleHitTest = false; // circle hit test
boolean over = false; // For when game is running, false for when its over
float xPosition; // x position of circle
float yPosition; // y position of circle
int specialDot; // Special red dot
int i; // array holder
float direction = random(0, 101); // determins which direction its going

void setup() {
  size(800, 200);
  newGame();
  noStroke();
}

void draw() {
  background(0);
  // Draw dot for when game is going
  if (over == false) {

    // for when the dots are going up or down
    for (int position = 0; position < 16; position ++) {
      if ((y[position] - 20) <= 0 && up[position] == true) {
        up[position] = false;
        s[position] = random(0.3, 2.1);
      }
      // if dots are going down, it goes up again
      else if ((y[position] + 20) >= height && up[position] == false) {
        up[position] = true;
        s[position] = random(0.3, 2.1);
      } 
      // dedermins which one is the special dot
      if (position == specialDot) { 
        fill(255, 0, 0); // red
        //to adjust the y position
        if (up[position] == true) {
          y[position] -= s[position];
        } else {
          y[position] += s[position];
        }
        // draw the red dot
        drawDot(x[position], y[position]);
       
        // constrains the dots
        } else {
        //white
        fill(255);
        if (up[position] == true) {
          y[position] -= s[position];
        } else {
          y[position] += s[position];
        }
        drawDot(x[position], y[position]);
      }
    }
  }
  // gray dots
  else {
    fill(150);
    for (int position = 0; position < 16; position ++) {
      // red dot
      
      if (position == specialDot) {
        fill(255, 0, 0);
        drawDot(x[position], y[position]);

        // draw dot again to constain height
        if ((y[position] - 20) <= 0 && up[position] == true) {
          up[position] = false;
          s[position] = random(0.3, 2.1);
        } else if ((y[position] + 20) >= height && up[position] == false) {
          up[position] = true;
          s[position] = random(0.3, 2.1);
        }

        // directional constrain up or down
        if (direction > 50) {
          up[i] = true;
        } else {
          up[i] = false;
        }      

        // set direction to which it is going
        if (up[position] == true) {
          y[position] -= s[position];
        } else {
          y[position] += s[position];
        } 
        //if not red dot, then it is grey dot
        } else if ( position != specialDot) {
          fill(150);
          drawDot(x[position], y[position]);
      }
    }
  }
}

//For circle hit test
boolean circleHitTest(float pX, float pY, float cX, float cY, float radius) {
  float d = dist(pX, pY, cX, cY);
  if (d < radius) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() { 
  // for circle hit test for hitting the red dot
  if (circleHitTest(mouseX, mouseY, x[specialDot], y[specialDot], 20) && over == false) {
    specialDot = int(random(0, 16));
  } else {
    over = true;
  }
}

void keyPressed() {
  // reset new game
  if (key == ' ') {
    newGame();
    over = false;
  }
}