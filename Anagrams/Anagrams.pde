// Daihan Zhu
// 20643647

import controlP5.*;

// The ControlP5 factory and two UI elements: a text field where you
// can enter a word to search for, and a scrollable text area to show
// all of its anagrams.
ControlP5 ui;
Textfield field;
Textarea area;

// Store an array of all English words.
String[] words;

void setup()
{
  size( 400, 400 );

  // Get the dictionary
  words = loadStrings( "words.txt" );

  // Set up the user interface
  ui = new ControlP5( this );

  field = ui.addTextfield( "" )
    .setPosition( 5, 5 )
    .setSize( 390, 40 )
    .setFont( createFont( "arial", 24 ) )
    .setColor( color( 255, 255, 255 ) )
    .setAutoClear( false );

  area = ui.addTextarea( "Words" )
    .setPosition( 5, 50 )
    .setSize( 390, 345 )
    .setFont( createFont( "arial", 24 ) )
    .setColor( color( 255, 255, 255 ) );
}

void draw()
{
  background( 50 );
}

void controlEvent( ControlEvent ce )
{
  if ( ce.isFrom( field ) ) {
    String txt = field.getText();
    String[] results = {};

    for (int idx = 0; idx < words.length; idx++) {
      for (int i = 0; i < words[idx].length()-1; i++) {
        if (txt.length() == words.length) {
          
          results = append( results, txt );
        }
      }
    }
    // These next three lines are just here as a demonstration.
    // You should remove these three lines, and replace them with
    // code that finds all of the anagrams of the String txt
    // and places them in the array.

    // Put the contents of the array into the text area so
    // the user can see them.
    area.setText( join( results, "\n" ) );
  }
}