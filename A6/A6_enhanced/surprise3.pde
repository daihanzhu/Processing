// THis is meant to look like a thermostat, I wanted to make it look like how the temperaturn rises and 
// falls

float p = 710;

void surprise3(int numLines) {
  
  fill(255);
  textSize(70); // Size of number
  textAlign(CENTER); // align to center
  text(int(counter), 80, 70); // position of the number
  textSize(50); // return size of bottom number 
  
  for (int i = 0; i < numLines; i++) {   
    
    stroke(255); // white stroke
    strokeWeight(1); // self explanatory
    ellipse(80, h - 10 - i, 5, 5); // line middle
    ellipse(40, h - i, 5, 5); // line on the right
    ellipse(120, h - i, 5, 5); // line on the left
    
    line(0, h - i, w, h - i); // Line increases from bottom 
    i++;
    
  }
}