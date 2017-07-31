// Daihan Zhu  D48ZHU

float t = 30; // ellipse height & width

int number = 0; // number counter: user defined global variables

float a = random(15, 435); // ellipse x position
float b = random(15, 385); // ellipse y position

boolean over = false;

int duration = 1800; // count down timer
int timer = duration; // timer duration

void setup() {
  size(450, 400);
}

void draw() {

  background(255);

  // draw the special dot
  fill(180, 180, 210);
  ellipse(a, b, t, t); //Drawing shapes and using drawing attributes

  // back ground dots that creates distraction
  if (number >= 5) {
    for (int i = 0; i < 5; i++) {    
      strokeWeight(1); // stroke weight
      fill(255, 215, 0); // gold
    }
    if (number >= 5 && number < 10) {
      delay(500);
    }
    if (number >= 10 ) {
      fill(mouseX, mouseY, 200);
    }
    dot(random(0, width), random(0, height)); // background dot 1
    dot(random(0, width), random(0, height)); // background dot 2
    dot(random(0, width), random(0, height)); // background dot 3
  }

  // image processing 
  if (number >= 10) {
    loadPixels();
    // loops
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {

        int i = x + y * width;
        color pixelColour = pixels[i];

        float r = red(pixelColour);
        float g = green(pixelColour);
        float b = blue(pixelColour);

        // black spot light following the mouse
        float d = dist(mouseX, mouseY, x, y);
        float f = map(d, 0, 80, 1.0, 0); // mapping
        pixels[i] = color(r * f, g * f, b * f);
      }
    }
    updatePixels();
  }

  // score display
  textSize(30);
  fill(200); // grey
  text(number, 30, 50); // upper left corner

  // count down display
  textSize(30);
  fill(200);
  text(timer, 355, 50);

  // once you hit 20 dots within the set time, you win
  if (number >= 20) {
    over = true;
    fill(0);
    rect(0, 0, 450, 400);
    fill(255);
    text("YOU WIN!", 155, 205);
  } 

  timer--;
  // if timer runs out of time, you lose 
  if (timer < 0) {
    over = true;
    fill(0);
    rect(0, 0, 450, 400);
    fill(255);
    text("YOU LOST", 155, 205);
  } else {
    over = false;
  }

  // special dot appears in random location 
  // Conditionals
  if (t <= 0 && t <= 0) {
    // random dot location
    a = random(15, 435); 
    b = random(15, 385);
  }
}

// circle hit test 
boolean circleHitTest(float pX, float pY, float cX, float cY, float radius) {
  // calculate distance from pX, pY  to centre of circle
  float d = myDist(pX, pY, cX, cY);

  // if it's less than radius, there will be a hit
  if (d < radius) {
    return true;
  } else {
    return false;
  }
} 

// circle hit test
float myDist(float pX, float pY, float qX, float qY) {
  float a = pX - qX;
  float b = pY - qY;
  float d = sqrt((a * a) + (b * b));  
  return d;
}

// event functions
void mousePressed() {

  // when mouse pressed, the special dot will appear in a new location
  if (circleHitTest(mouseX, mouseY, a, b, t / 2)) {
    a = random(15, 435); 
    b = random(15, 385);

    // score count will increase by 1
    number = number + 1;
  }
}
// user defined functions
void dot(float xPosition, float yPosition) {
  // draw dot
  ellipse(xPosition, yPosition, 30, 30);
}