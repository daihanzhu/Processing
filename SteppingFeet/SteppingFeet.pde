// Daihan Zhu
// 20643647

float x = 0;
float i = 0;

void setup() {
 size(600, 300);
}

void draw() {
  
  background(255);
  
  // black stripes
  for(int x = 0; x < width; x += 40){
    fill(0);
    rect(x, 0, 20, height);  
    
  }
  
  // dark foot
  fill(190, 249, 250);
  noStroke();
  rect(i, 100, 40, 20);
 
  // light foot
  fill(100);
  rect(i, 200, 40, 20);
  
  // Speed
   i = i + 2;
   
  // Reset to left
   if (i > 640){
     i = 0;
   }
}