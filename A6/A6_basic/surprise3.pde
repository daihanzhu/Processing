void surprise3(int numLines) {
  
  for (int i = 0; i < numLines; i++) {   
    stroke(255); // white stoke
    strokeWeight(1); // self explanatory
    line(0, h - i, w, h - i); // Line increases from bottom 
    i++;
  }
}