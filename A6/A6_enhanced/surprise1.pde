// In this enhanced code it creates a drawing of different sizes in a curved line that flashes slowly in differnet
// colours.

int t = 0;

void surprise1() {  
  
  noStroke();
  fill(255, 165, 0, t + 30); // coral
  ellipse(55, 120, 50, 50);
  ellipse(60, 660, 30, 30);
  ellipse(100, 280, 50, 50);
  fill(255, 127, 80, t); // orange
  ellipse(70, 500, 50, 50);
  ellipse(80, 40, 30, 30);
  ellipse(120, 10, 50, 50);
  fill(144, 238, 144, t + 10); //green
  ellipse(40, 600, 30, 30);
  fill(124, 252, 0, t); // light green
  ellipse(120, 350, 50, 50);
  fill(32, 178, 170, t + 70); // Blue
  ellipse(70, 430, 30, 30);
  ellipse(80, 200, 50, 50);
  
  if (t <= 255) {
    t = t + 1;
  } else {
    t = 0;
  }
  
  fill(255); // gets the number at bottom back to the white colour.
  //int x = 0;
  
 // while(x < 500) {
 // float cSize<= random(0, 70); //random size
 //  
//  noStroke();
//  fill(255, 255, 255, random(0, 30)); // semi transparency
//  ellipse(random(30, 130), random(30, 690), cSize, cSize); //random position and size    
//  x = x + 1; //number of circles
 // fill(255); //back to fill of the numbers
  
//  }
}