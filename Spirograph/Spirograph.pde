// Daihan Zhu
// 20643647

// A Spirograph (https://en.wikipedia.org/wiki/Spirograph) is a
// plastic toy that lets you draw fancy curves by moving a gear
// inside or around another gear.

// Global variables that control the Spirograph
// Number of teeth in the big gear
int big_teeth = 108;
// Number of teeth in the little gear
int little_teeth = 28;
// Whether the little gear moves around the inside or
// outside of the big gear
boolean inside = true;
// The radius of the big gear
float radius = 200.0;
// How far the drawing pen is from the centre of the little
// gear; a number between 0 and 1, where 0 means "right at 
// the centre" and 1 means "right on the edge".
float l = 0.75;

// import library
import controlP5.*;

ControlP5 ui;

// How many points to use when drawing the spirograph
// curve.  More points gives a more accurate drawing,
// but takes longer to draw.
int num_points = 10000;

// A small mathematical utility function -- compute the
// Greatest Common Divisor between two numbers.  You
// don't need to understand this function.
int gcd( int a, int b )
{
  while ( b != 0 ) {
    int tmp = a % b;
    a = b;
    b = tmp;
  }
  return a;
}

// Draw the spirograph curve, based on the values of the
// global variables defined above.
void drawSpirograph()
{
  // This is a big pile of math adapted from the Wikipedia
  // entry for Spirographs.  It uses a lot of trigonometry.
  // You don't have to understand it -- you only need to
  // be able to call this function to get your spirograph
  // drawing.

  float R = radius;
  float k = float(little_teeth)/float(big_teeth);

  float max_t =
    TWO_PI * little_teeth / gcd( big_teeth, little_teeth );
  float inc = max_t / num_points;

  float k1 = (1.0-k);
  float s = 1.0;
  if ( !inside ) {
    k1 = 1.0 + k;
    s = -1.0;
  }

  beginShape();
  float t = 0.0;
  for ( int idx = 0; idx < num_points; ++idx ) {
    float xt = R * (k1*cos(t)+s*l*k*cos(k1/k*t));
    float yt = R * (k1*sin(t)-s*l*k*sin(k1/k*t));

    vertex( width/2 + xt, height/2 + yt );
    t = t + inc;
  }
  endShape();
}

void setup()
{
  size( 600, 600 );


  ui = new ControlP5(this);
  // big teeth slider
  Slider bigSlide = ui.addSlider("big_teeth");
  bigSlide.setSize(120, 20);
  bigSlide.setPosition(20, 20);
  bigSlide.setDecimalPrecision(0);
  bigSlide.setRange(20, 120);

  // little teeth slider
  Slider smalSlide = ui.addSlider("little_teeth");
  smalSlide.setSize(120, 20);
  smalSlide.setPosition(20, 50);
  smalSlide.setDecimalPrecision(0);
  smalSlide.setRange(10, 60);
  
  // l slider
  Slider l = ui.addSlider("l");
  l.setSize(120, 20);
  l.setPosition(20, 80);
  l.setRange(0, 1);
  
  // radius slider
  Slider radi = ui.addSlider("radius");
  radi.setSize(120, 20);
  radi.setPosition(20, 110);
  radi.setRange(50, 250);
  
  // toggle
  Toggle tog = ui.addToggle("inside");
  tog.setSize(40, 20);
  tog.setPosition(20, 140);
  
}

void draw()
{
  background( 80 );
  stroke( 255 );
  noFill();

  drawSpirograph();
}