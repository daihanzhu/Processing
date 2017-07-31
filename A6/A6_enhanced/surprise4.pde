// In this surprise I had "rain drops" coming down repeatdely down the screen, and it runs continuously coming
// back and forth to look natural since they are coming down at different speeds

float drop = 0;
float dropTwo = 0;
float dropThree = 0;
float dropFour = 0;
float dropFive = 0;

void surprise4(float grey) {

  fill(grey); // fill
  noStroke();
  rect(0, 0, w, h); // rectango 

  fill(255); // get text back to white
  text(selected, 80, 700);
  textSize(50);

  ellipse(w / 2, drop, 50, 50);
  fill(230,230,250); // Lanvader
  ellipse(40, dropTwo, 50, 50);
  fill(176, 224, 230);
  ellipse(120, dropThree, 50, 50);
  fill(135, 206, 235);
  ellipse(60, dropFour, 50, 50);
  fill(100, 149, 237);
  ellipse(100, dropFive, 50, 50);
  
  // drops the ball and the else statement brings it back to the top
  if (dropFive < h) {
    dropFive = dropFive + 6;
  } else {
    dropFive = 0;
  }
  if (dropFour < h) {
    dropFour = dropFour + 3;
  } else {
    dropFour = 0;
  }
  if (dropThree < h) {
    dropThree = dropThree + 7;
  } else {
    dropThree = 0;
  }
  if (dropTwo < h) {
    dropTwo = dropTwo + 5;
  } else {
    dropTwo = 0;
  }

  if (drop < h) {
    drop = drop + 10;
  } else {
    drop = 0;
  }
  fill(255); //Back to white
}