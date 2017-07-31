// String[] s = splitTokens(points);
float[] x;
float[] y;


void setup() {
  size(400, 400);
  background(0);

  //style
  fill(255);
  stroke(255);
  strokeWeight(2);
  strokeCap(ROUND);

  // load the points
  String x[] = loadStrings("design.txt");
  String y[] = loadStrings("design.txt");

  // Plot points
  beginShape(POINTS);
  for (int i = 0; i < x.length - 1; i++) {   
    for (int a = 0; a < y.length - 1; a++) {
      vertex(float(x[i + 1]), float(y[a + 1]));
    }
  }
  endShape(CLOSE);
}