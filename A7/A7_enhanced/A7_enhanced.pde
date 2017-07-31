// This game is called sneaky dots.
// Your goal is to get at least 7 dots up in the purple area by clicking it while
// it is inside the purple area to stop it from moving and stay inside the area.
//
// But watchout! The dots don't always like to stay there and
// they like to escape, Hint: especially that first dot on the left,
// when it really does escape, you lose and no more dots are moving.
//
// press space bar to reset

float[] x = new float[16]; // x position
boolean[] up = new boolean[16]; // when up is true dot moves up, otherwise it moves down
float [] y = new float[16]; // y position
float [] s = new float [16]; // speed
boolean circleHitTest = false; // circle hit test
boolean over = false; // For when game is running, false for when its over
float xPosition; // x position of circle
float yPosition; // y position of circle
int specialDot; // Special moving dot
int i; // array holder
float direction = random(0, 101); // determins which direction its going

void setup() {
  size(800, 200);
  newGame();
}

void draw() {
  background(240, 248, 255); //light blue

  noStroke();
  fill(230, 230, 250);
  rect(0, 0, 800, 55);

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
      // dedermins which one is the special dot and randomlize speed
      if (position == specialDot) { 
        fill(255, 105, 180); // colour
        //to adjust the y position
        if (up[position] == true) {
          y[position] -= s[position];
        } else {
          y[position] += s[position];
        }
        // draw the other dota
        drawDot(x[position], y[position]);
        //white
        fill(255);
        // constrains the dots
      } else {
        if (up[position] == true) {
          y[position] -= s[position];
        } else {
          y[position] += s[position];
        }
        drawDot(x[position], y[position]);
      }
    }
  } else {
    fill(150);
    for (int position = 0; position < 16; position ++) {
      // special dot
      if (position == specialDot) {
        fill(255, 105, 180); // colour dot
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

        // if goin up is true, set it to false
        if (up[position] == true) {
          y[position] -= s[position];
        } else {
          y[position] += s[position];
        } 
        //blue dot
      } else if ( position != specialDot) {
        fill(150);
        drawDot(x[position], y[position]);
      }
    }
  }
  //enhanced, all dot starts in the middle
  if (specialDot >= position) {
    over = true;
  }
  // count number of circle that is up on top
  int winningCount = 0;
  for (int i = 0; i < 16; i++) {
    // if middle of circle is above 60
    if (y[i] < 60) {
      winningCount++;
    }
  }
  // if you get 7 or more circle up to the top, you win
  if (winningCount >= 7) {
    over = true;
    fill(0); // black
    textSize(30);
    text("You win! Hit space to RESTART.", width - 650, height - 30);
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
  if ( circleHitTest(mouseX, mouseY, x[specialDot], y[specialDot], 20)) {
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