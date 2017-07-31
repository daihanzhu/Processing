// Your name and Student ID
// Daihan Zhu
// 20643647

// Note that the function 
// 
//  String formatParagraph( String text, float linewidth )
//
// is provided for you in the "Paragraph" tab.  You don't need
// to understand how that function works, but you need to be
// able to use it.

String[] black; // question string
String[] white; // answer string

PFont font; // font

PImage table; // background picture

void setup() {

  size(430, 510);
  
  table = loadImage("table.jpg"); // background image
  
  textFont(createFont("Helvetica-Bold", 18));   

  black = loadStrings("questions_clean.txt"); //question string
  white = loadStrings("answers_clean.txt"); //answer string
} 

void draw() {
  
  image(table, 0, 0); // background image

  fill(0); // black card
  rect(30, 30, 200, 300, 11);
  fill(255); // white card
  rect(200, 180, 200, 300, 11);

  int i = int(random(black.length)); // random variable for black card
  int a = int(random(white.length)); // random variable for white card

  String formatIt = formatParagraph(white[a], 120); // format for answer cards
  String formatIt2 = formatParagraph(black[i], 120); // format for black cards

  text(formatIt2, 50, 70); // questions
  fill(0); // black
  text(formatIt, 220, 220); // answers

  noLoop(); // does not loop
}

void keyPressed() {

  if ( key == ' ') {
    loop(); // only loops when key pressed
  }
}