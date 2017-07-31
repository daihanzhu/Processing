// Daihan Zhu
// 20643647

void setup() {
  size(600, 500);

  // Draws general background scene
  background(25, 25, 112); // sky
  fill(34, 140, 40); // green
  noStroke();
  rect(0, 200, 600, 350);

  pushMatrix();
  translate(0, 160);
  // draw fence  
  for (int i = 0; i < width; i++) {
    fence();
    translate(15, 0);
  }
  popMatrix();

  // draw stars
  pushMatrix();
  translate(30, 20);
  scale(0.2);
  star();
  scale(1.2);
  translate(520, 100);
  rotate(30);
  star();
  scale(0.7);
  translate(70, 650);
  rotate(90);
  star();
  popMatrix();

  pushMatrix();
  scale(1.4);
  translate(-50, -70);
  cat();
  popMatrix();
  moon();
}

void fence() {
  noStroke();
  fill(255);
  rect(0, 0, 10, 40);
  triangle(0, 0, 5, -10, 10, 0);
  rect(10, 10, 5, 5);
}

void star() {
  // draw star
  fill(250, 250, 210);
  beginShape();
  for ( int idx = 0; idx < 5; ++idx ) {
    vertex( 50*cos(TWO_PI*0.4*idx), 50*sin(TWO_PI*0.4*idx) );
  }
  endShape();
}

void cat() {
  //shadow
  fill(0);
  ellipse(210, 340, 100, 30);
  //head
  fill(40);
  ellipse(200, 300, 50, 45);
  //body
  noStroke();
  ellipse(220, 320, 80, 55);
  //eyes
  stroke(255);
  noFill();
  arc(188, 296, 10, 10, 0 + QUARTER_PI, PI - QUARTER_PI);
  arc(210, 296, 10, 10, 0 + QUARTER_PI, PI - QUARTER_PI);
  //ear 
  line(182, 290, 188, 280);
  line(188, 280, 194, 290);
  line(203, 290, 210, 280);
  line(210, 280, 216, 290);
  //nose
  fill(255, 188, 201);
  noStroke();
  ellipse(199, 305, 7, 5); 
}

void moon() {
  //moon
  noStroke();
  fill(250, 250, 210);
  ellipse(500, 50, 40, 40);
  fill(25, 25, 112);
  ellipse(490, 45, 40, 40);
}