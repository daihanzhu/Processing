void surprise1() {
  
  int x = 0;
  
  while(x < 500) {
  float cSize = random(0, 70); //random size
   
  noStroke();
  fill(255, 255, 255, random(0, 30)); // semi transparency
  ellipse(random(30, 130), random(30, 690), cSize, cSize); //random position and size    
  x = x + 1; //number of circles
  fill(255); //back to fill of the numbers
  }
}