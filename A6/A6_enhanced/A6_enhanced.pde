// A6 Surprise enhanced Version

// WARNING: It is an academic offence to share, reproduce, 
// or disseminate any lab, assignment, or exam solutions.


// usage:
// 'a', 's', 'd', 'f' to select which surprise to show

// keep scale at 1.0
float scale = 1.0;

// only use w and h to refer to width and height!
int w;
int h;

float x;
float cSize = random(1, 100);

boolean mousePressed = true;
float counter; // osculation variable 

int y = h; // lines for surprise3

// global variable state selector
int selected; // Key variable to select 

boolean increase = true; // osculation variable

void setup() {
  // don't change these next 5 lines
  size(160, 720);
  w = width;
  h = height;
  surface.setResizable(true);
  surface.setSize(int(160 * scale), int(720 * scale));

  // if you need setup code, put it below this comment
}

void draw() {
  // don't change this scale statement
  scale(scale);

  // your code starts here
  background(0);
  
  if (selected > 0) {
  textAlign(CENTER);
  text(selected, 80, 700);
  textSize(50);
  }
  
  // Each key selected link to a new surprise
  if (selected == 1) {
     surprise1();
  } else if (selected == 2) {
    surprise2(int(counter));
  } else if (selected == 3) {
    surprise3(int(counter));
  } else if (selected == 4) {
    surprise4(counter);
  }

  // Osculation, when the line reach 500, it decreases, and increase again when hit 0
   if (counter >= 500) {
     increase = false;
   } else if (counter <= 0) {
     increase = true;
   } else if (counter == 255 && selected == 4) {
     increase = false;
   }
   
   // allow the counter to decrease or increase
   if (increase == false) {
     counter = counter - 1;
   } else {
   counter = counter + 1;
   }
}

void keyPressed() {
  // assign each variable to a key and surprise
    if (key == 'a') {
    selected = 1;
  } else if (key == 's') {
    selected = 2;
  } else if (key == 'd') {
    selected = 3;
  } else if (key == 'f') {
    selected = 4;
  } else {
    selected = 0;
  }
}

void mousePressed() {
  // Mouse press and mapping for colour and number
   if (mousePressed == true && selected == 2) {
    counter = map(mouseY, 0, 720, 500, 0);  
   } else if(mousePressed == true && selected == 4) {
    counter = map(mouseY, 0, 500, 255, 0);
   } 
  }
  
  
  
  
  
  
  
  
  
  