PImage[] img = new PImage[4];

// x and y position of image
float[] xImg = new float[4];
float[] yImg = new float[4];

// image selection 
int selected = -1;

// x and y position of image used for moving 
float[] xPos = new float[4];
float[] yPos = new float[4];

// size of image
float[] xSize = new float[4];
float[] ySize = new float[4];

// used to scale image
float[] scale = new float[4];

void setup() {
  size(500, 500);

  //Load image
  img [0] = loadImage("pheasant.jpg");
  img [1] = loadImage("cow.jpg");
  img [2] = loadImage("goose.jpg");
  img [3] = loadImage("mandrill.jpg");

  for ( int i = 0; i < 4; i++) {
    // x and y posiion of image
    xImg[i] = 40 * i;
    yImg[i] = 40 * i;

    scale[i] = 0.5;
  }
}

void draw() {
  background(mouseX / 2, mouseY / 2, 0); // tracks along with mouse position

  for ( int i = 0; i < 4; i++) {

    // constrains that the images doesn't go off the board
    xImg[i] = constrain(xImg[i], 1, 500 - img[i].width * scale[i] - 2);
    yImg[i] = constrain(yImg[i], 1, 500 - img[i].height * scale[i] - 2);

    //scale image 
    image(img[i], xImg[i], yImg[i], img[i].width * scale[i], img[i].height * scale[i]);

    // red border
    if (selected == i) {
      noFill();
      rect(xImg[i], yImg[i], img[i].width * scale[i], img[i].height * scale[i]);
      stroke(255);
      strokeWeight(5);
    }

    // suppost to move image
    if (selected == i && mousePressed == true) {

      xImg[i] = mouseX + xPos[i];
      yImg[i] = mouseY + yPos[i];
    }
  }
}

// hit test
boolean hitTest(float x, float y, float rx, float ry, float rw, float rh) {
  if (x >= rx && x <= rx + rw && y >= ry && y <= ry + rh) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {

  selected = -1;

  //hit test 
  for ( int i = 0; i < 4; i++) {
    // square hittest
    if (hitTest(mouseX, mouseY, xImg[i], yImg[i], img[i].width / 2, 
      img[i].height / 2)) {

      selected = i;

      // help to off set the jump
      xPos[i] = xImg[i] - mouseX;
      yPos[i] = yImg[i] - mouseY;
    }
  }
}

void keyPressed() {

  for ( int i = 0; i < 4; i++ ) {

    // key press to increase and decrease size of the squares
    if (key == ']' && selected == i) {
      scale[i] += 0.01;
    } else if (key == '[' && selected == i) {
      scale[i] -= 0.01;
    } else if (key == 'r') {
      scale[i] = random(0.3, 0.6);
    } 
  }
}