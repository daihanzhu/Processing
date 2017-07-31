// A4 enhanced

// In this game, titled confetti wipper, the player's goal is to detect the one confetti that always appears in a different spot, in a sea of randomly flashing confetties and several stationed
// confetties. Once all the confetti wipe has reached the maximun height, game is over, or when the player in unable to detect the one special confetti before the wiper disappears, then the 
// game is also over.
 

int h = 60; // square height
int w = 60; // square width

float t = 30; // ellipse height
float v = 30; // ellipse width

float a = random(15, 435); // ellipse x position
float b = random(15, 385); // ellipse y position

float c = random(15, 435); // ellipse x position
float d = random(15, 385); // ellipse y position

float e = random(15, 435); // ellipse x position
float f = random(15, 385); // ellipse y position

float g = random(15, 435); // ellipse x position
float i = random(15, 385); // ellipse y position

float j = random(15, 435); // ellipse x position
float k = random(15, 385); // ellipse y position

float l = random(15, 435); // ellipse x position
float m = random(15, 385); // ellipse y position

float n = random(15, 435); // ellipse x position
float o = random(15, 385); // ellipse y position

float p = random(15, 435); // ellipse x position
float q = random(15, 385); // ellipse y position

float r = random(15, 435); // ellipse x position
float s = random(15, 385); // ellipse y position



void setup() {
  
  size(450, 400);
 
}

void draw() {
  
  background(0);
  
  // ball
  fill(random(0, 255), random(255), random(255));
  noStroke();
  ellipse(a, b, t, v);
  
  fill(random(0, 255), random(255), random(255));
  ellipse(c, d, t, v);
    
  fill(random(0, 255), random(255), random(255));
  ellipse(e, f, t, v);
    
  fill(random(0, 255), random(255), random(255));    
  ellipse(g, i, t, v);
        
  fill(random(0, 255), random(255), random(255));    
  ellipse(j, k, t, v);
  
  fill(random(0, 255), random(255), random(255));
  ellipse(l, m, t, v);
    
  fill(random(0, 255), random(255), random(255));
  ellipse(n, o, t, v);
    
  fill(random(0, 255), random(255), random(255));    
  ellipse(p, q, t, v);
        
  fill(random(0, 255), random(255), random(255));    
  ellipse(r, s, t, v);
  
  //square
  rectMode(CENTER);
  strokeWeight(10); 
  stroke(255);
  fill(200);
  rect(mouseX, mouseY, h, w);
  
  // treat shrinks
  v = v - 0.3;
  t = t - 0.3;
  
  // random flashes to confuse people
  c = random(15, 435); 
  d = random(15, 385);
  
  // constrain 
  mouseX = constrain(mouseX, w / 2, width - w / 2 - 1);
  mouseY = constrain(mouseY, h / 2, height - h / 2 - 1);
  
  // treat appears in random location
  if (t <= 0 && v <= 0) {
    
    // ball location
    a = random(15, 435); 
    b = random(15, 385);
    
    // ball with and height
    t = 30;
    v = 30;
    
    // ball shrinks
    v = v - 0.3;
    t = t - 0.3;
 
    // square shrink if not touch ball
    h = h - 5;
    w = w - 5;
    
  }
  
  // game over
  
  if (h >= 400 || w >= 450) {
    
    background(0);
    fill(0);
    
  }
  
  
  if (w <= 0 && h <= 0) {
      
    background(0);
    fill(0);
    
  }

  // square detects the ball and grow by 5
  if (a + v >= mouseX - (w / 2) && a <= mouseX + (w / 2) && b + t >= mouseY - (h / 2) && b <= mouseY + (h / 2)) {
    
    a = random(15, 435); 
    b = random(15, 385);
    
    t = 30;
    v = 30;
    
    v = v - 0.3;
    t = t - 0.3;
    
    h = h + 5;
    
    w = w + 5;
     
  }

}