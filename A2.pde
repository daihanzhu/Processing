// A2 Starter Code

// setup
// don't change anything from HERE ...
size(160, 720);
int scale = 10;
PGraphics h = createGraphics(width * scale, height * scale, JAVA2D);
beginRecord(h);
h.scale(scale); 
background(0);
// ... to HERE

// VERY IMPORTANT: put *your* uwaterloo username inside the quotes
String uwid = "D48ZHU";

// now write code to draw your body ...

// Incase you can't tell, its a milk bottle with a cow' head. 

// Ears
stroke(0);
fill(255);
bezier(30, 70, 40, 50, 75, 80, 70, 100);
bezier(30, 70, 50, 50, 65, 120, 70, 100);

bezier(130, 70, 120, 50, 85, 80, 90, 100);
bezier(130, 70, 130, 50, 75, 120, 90, 100);

// neck
fill(230);
rect(49, 200, 61, 40);

// Head
stroke(0);
fill(255);
ellipse(80, 130, 100, 120);

// Mouth 
fill(254, 225, 255);
ellipse(80, 190, 110, 50);

fill(0);
ellipse(70, 180, 10, 10);
ellipse(90, 180, 10, 10);

noFill();
bezier(65, 200, 65, 210, 95, 210, 95, 200);

// eyes
fill(0);
ellipse(60, 120, 15, 20);
ellipse(100, 120, 15, 20);

fill(255);
ellipse(62, 118, 6, 6);
ellipse(102, 118, 6, 6);

// body
noStroke();
bezier(51, 245, 20, 375, 20, 450, 20, 475);
bezier(109, 245, 140, 375, 140, 450, 140, 475);
quad(50, 245, 20, 475, 140, 475, 110, 245);

// Milk Lable
fill(14, 53, 100, 50);
stroke(14, 53, 100);
strokeWeight(5);
strokeJoin(BEVEL);
rect(40, 370, 80, 40);
fill(205, 0, 0);
rect(52, 343, 10, 20);
triangle(40, 370, 80, 345, 120, 370);

// letter m

strokeWeight(3);
strokeCap(ROUND);
line(65, 380, 65, 400);
line(95, 380, 95, 400);
line(65, 380, 80, 390);
line(95, 380, 80, 390);




// Bottom
fill(255);
noStroke();
bezier(20, 600, 20, 630, 140, 630, 140, 600);
rect(20, 485, 120, 115);

fill(12, 12, 45, 30);
ellipse(80, 600, 100, 20);










// draw these mandatory joining sections LAST:
// You can change the colour for these sections,
fill(#FFFFFF);
// but don't change their width or position!
noStroke();
rectMode(CORNER);
//   neck section
rect(50, 235, 60, 10);
//   waist section
rect(20, 475, 120, 10);

// code to save sections
// (make sure this is the very last code in your sketch)
// don't change anything from HERE ...
h.get(0, 0, 160 * scale, 240 * scale).save("top_" + uwid + ".png");
h.get(0, 240 * scale, 160 * scale, 240 * scale).save("middle_" + uwid + ".png");
h.get(0, 480 * scale, 160 * scale, 240 * scale).save("bottom_" + uwid + ".png");
// ... to HERE