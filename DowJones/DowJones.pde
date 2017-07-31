String dows[];

void setup() {
  size(800, 600);

  background(255);
  noFill();

  String dows[] = loadStrings("dowjones.txt"); // load text

  beginShape();

  fill(255, 0, 0, 20);
  noStroke();
  // draw the low 
  for ( int j = 0; j < dows.length; j++ ) {
    String show[] = splitTokens(dows[j]);    

    float xLow = map(j, 0, dows.length - 1, 0, width); 
    float yLow = map(float(show[1]), 17850, 20150, height, 0);

    vertex(xLow, yLow);
  }
  
  // draw the high, literates backwards
  for ( int t = dows.length - 1; t >= 0; t-- ) {
    String showNow[] = splitTokens(dows[t]);    

    float xHigh = map(t, 0, dows.length - 1, 0, width); 
    float yHigh = map(float(showNow[2]), 17850, 20150, height, 0);

    vertex(xHigh, yHigh);
  }  
  endShape();

  // draws close value, no fill
  beginShape(); 
  noFill();
  stroke(0);
  // draw close value line
  for ( int i = 0; i < dows.length; i++) {
    String showUp[] = splitTokens(dows[i]);

    float x = map(i, 0, dows.length - 1, 0, width);
    float y = map(float(showUp[3]), 17850, 20150, height, 0);

    vertex(x, y);
  }
  endShape();
}