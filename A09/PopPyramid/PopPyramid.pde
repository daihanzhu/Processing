// Daihan Zhu
// 20643647

// The number of bars in the graph -- 20 age ranges from 0 to 100
// in steps of 5, and a final "100+" slice.
int num_bars = 21;

// The largest population in any bar for any year.  (Actually a bit
// larger than the real max, but at least no bar will end up 
// off-screen.)
int largest_bar = 1500000;

// Some constants to control the rendering of the
// bar graphs
float margin = 30.0;
float top_margin = 50.0;
float max_bar_width = 275;
float bar_height = (400-margin-top_margin)/num_bars;
float chart_height = num_bars * bar_height;

// A table to hold all population data.
Table pop;

// A helpful Dictionary that maps the name of an age range
// (e.g., "15 to 19 years") to the y location in the sketch
// window where the bar should be drawn.
FloatDict age_range_map;

// The year we're currently rendering
int current_year = 2000;

// import background image
PImage img;


void setup()
{
  img = loadImage("alberta.jpg");
  size( 600, 400 );
  pop = loadTable( "00510001-eng.csv", "header" );



  // Build a mapping from the age ranges we care about,
  // as they appear in the provided CSV file (e.g., "15 to 19 years")
  // to their corresponding y locations in the bar charts we're drawing.
  // This is much nicer than having to "parse" one of these age ranges
  // every time we see it.
  age_range_map = new FloatDict();

  for ( int idx = 0; idx < 20; ++idx ) {
    age_range_map.set( "" + (idx*5) + " to " + (idx*5+4) + " years", 
      chart_height - (idx+1)*bar_height );
  }
  age_range_map.set( "100 years and over", 
    chart_height - 21*bar_height );
}

// A helper function to draw one of the graphs.  Use
// geometric contexts so that we can call this twice:
// once with the male data, once with female.  Pass in
// "Males" or "Females" as the argument, to match up 
// with the contents of the "SEX" field in the table.
void drawChart( String sex )
{
  for (int row = 0; row < pop.getRowCount(); row ++) {
    String gender = pop.getString(row, "SEX");
    String country = pop.getString(row, "GEO");
    int current = pop.getInt(row, "Ref_Date");

    if (gender.contains(sex)) {
      if (country.contains("Canada")) {
        if (current == current_year) {
          if (age_range_map.hasKey(pop.getString(row, 3))) {
            int val = pop.getInt(row, "Value");
            float mapp = map (val, 0, largest_bar, 0, max_bar_width);
            rect(30, age_range_map.get(pop.getString(row, 3)) + 35, mapp, bar_height);
          }
        }
      }
    }
  }
}

void draw()
{
  background( 240 );
  image(img, 0, 0, width, height);
  textAlign( CENTER );
  fill( 0 );

  // Write the current year at the top of the sketch.
  // TODO
  textSize(24);
  text(current_year, 300, 30);
  textSize(8);
  text("Population of Canada from 1971 to 2016 based on information from StatsCan data", 300, 380);

  // Write all the age range labels between the bar graphs
  // TODO
  textSize(11);
  text("100+", 300, 50);
  text("95 - 99", 300, 65);
  text("90 - 94", 300, 80);
  text("85 - 89", 300, 95);
  text("80 - 84", 300, 110);
  text("75 - 79", 300, 125);
  text("70 - 74", 300, 140);
  text("65 - 69", 300, 155);
  text("60 - 64", 300, 170);
  text("55 - 59", 300, 185);
  text("50 - 54", 300, 200);
  text("45 - 49", 300, 215);
  text("40 - 44", 300, 230);
  text("35 - 39", 300, 245);
  text("30 - 34", 300, 260);
  text("25 - 29", 300, 275);
  text("20 - 24", 300, 290);
  text("15 - 19", 300, 305);
  text("10 - 14", 300, 320);
  text("5 - 9", 300, 335);
  text("0 - 4", 300, 350);

  // Draw the female bar graph.
  pushMatrix();
  fill(255, 113, 180); // Pink
  translate(345, 0);
  drawChart("Females");
  popMatrix();
  // Draw the male bar graph.
  pushMatrix();
  fill(107, 167, 214); // blue
  translate(250, 0);
  scale(-1, 1);
  drawChart("Males");
  popMatrix();
}

void keyPressed() {
  if ( keyCode == LEFT ) {
    current_year = max( current_year - 1, 1971 );
  } else if ( keyCode == RIGHT ) {
    current_year = min( current_year + 1, 2016 );
  }
}