// Daihan Zhu
// 20643647

color[] col = {color(220, 100, 155), 
               color(15, 50, 166), 
               color(100, 123, 220)};

// Translation amounts for Direct Manipulation
float tx;
float ty;

// Scaling factor for density of noise
float sc = 100.0;

void setup()
{
  size( 300, 300 );
}

void draw()
{
  for ( int y = 0; y < 300; ++y ) {
    for ( int x = 0; x < 300; ++x ) {
      float v = noise(((x-tx) / sc)*30, ((y-ty) / sc)*30 );
      set( x, y, color( int(v) % 2 * 256.0 ) );
    }
  }
}

void mouseDragged()
{
  tx += mouseX - pmouseX;
  ty += mouseY - pmouseY;
}