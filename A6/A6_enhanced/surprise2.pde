// This suprise is similar to the original surprise 2 but it is an enhanced version with multiple timers and 
// it changes shade depending on what the mouse Y positions are, mapped by a variable c.

void surprise2(int number) {
  
  float c = map(mouseY, 0, 720, 0, 255);
  
  fill(c);
  textSize(70); // Size of number
  textAlign(CENTER); // align to center
  text(number, 80, 52); // position of the number
  textSize(50); // return size of bottom number 
  
  fill(c);
  textSize(70); // Size of number
  textAlign(CENTER); // align to center
  text(number, 80, 150); // position of the number
  textSize(50); // return size of bottom number 
  
  fill(c);
  textSize(70); // Size of number
  textAlign(CENTER); // align to center
  text(number, 80, 250); // position of the number
  textSize(50); // return size of bottom number 
  
  fill(c);
  textSize(70); // Size of number
  textAlign(CENTER); // align to center
  text(number, 80, 350); // position of the number
  textSize(50); // return size of bottom number 
  
  fill(c);
  textSize(70); // Size of number
  textAlign(CENTER); // align to center
  text(number, 80, 450); // position of the number
  textSize(50); // return size of bottom number 
  
  fill(c);
  textSize(70); // Size of number
  textAlign(CENTER); // align to center
  text(number, 80, 550); // position of the number
  textSize(50); // return size of bottom number  
    
  fill(c);
  textSize(70); // Size of number
  textAlign(CENTER); // align to center
  text(number, 80, 650); // position of the number
  textSize(50); // return size of bottom number 
  
  fill(255);
  
}