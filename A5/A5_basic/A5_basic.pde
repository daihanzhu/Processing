float time = 12; // which circle should be drawn with a thicker stroke
float currentTime = 12.0000; // where the fill goes up to
boolean countDown = false; // whether or not the timer (currentTime) is running

void setup() { 
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(182, 0, 50);

  int diameter = 50;
  int count = 1; 
  //draws the circles
  for (int y = 50; y <= height - 50; y += 50) {
    for (int x = 50; x <= width - 50; x += 50) {
      
      //gradian
      float brightness = map(count, 1, currentTime, 100, 30);
         if (count <= currentTime) {
          fill(127, 100, brightness);
      }
      //fill the circle 
      if (countDown) {
        fill(127, 100, brightness);
        stroke(127, 100, 100);
      } else {
        strokeWeight(6);
        noFill();
        stroke(127, 100, 0);
      }
      // fills the circle
      if (count <= currentTime) {
        fill(127, 100, brightness);
      } else {
        noFill();
      }
      // tracks the stroke
      if (count == time) {
        strokeWeight(6);
      } else {
        strokeWeight(2);
      }
      //wether true or no for key pressed
      if (currentTime <= 0 && countDown == true) {
        fill(115, 90, random(60, 100));
      }
      //circle draw
      ellipse(x, y, diameter, diameter);      
      count++;
    }
  }
  // timmer running
  if (countDown == true) {
  currentTime = currentTime - 0.0166667;
  }
}

void keyPressed() {
  
  //starts countdown
  if (key == 'a') {
    if (countDown == true) {
      countDown = false;
    } else {
      countDown = true;
      noFill();
      stroke(0);
    }
  }
  
// d and s moves the selection of the circle 
  if (key == 'd' && countDown == false) {
    time++ ;   
  }
  if (key == 's' && countDown == false) {
    time-- ;
  }
  time = constrain(time, 1, 25);

// pressing f moves the filled circle up or down to the point 
  if (key == 'f') {
    currentTime = time;
    countDown = false;
  }
}