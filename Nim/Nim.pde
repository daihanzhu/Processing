// Daihan Zhu
// 20643647

int a = 50;
int b = 150;
int c = 250;

int r = 40; // Triangle position 

int num = 3; // number of colums

int colums[] = new int[num]; // array of colums
int colums2[] = subset(colums, 0, 1);

int y = 80; // token y

int counter = 0;

float selected;

boolean count = false; // check if triangle is below colum
String score; // game score

// int rendom; //

void setup() {
  size(300, 620);

  for (int i = 0; i < num; i++) {
    colums[i] = rendom();
   
  }
}

void draw() {

  background(115, 150, 255);

  fill(155, 255, 240);

  constrain(r, 20, 300);

  // draw token
  for (int i = 0; i < num; i++) {
   
    for (int y = 0; y < colums[i]; y++) {
     
      ellipse(90 * i + 60, height - (y * 80 + 120), 60, 60);
      
      // check if token is above triangle
      if ((90 * i + 60) == (r + 20)) {

        selected = counter;

        count = true;
      } else {

        count = false;
      }
    }
  }

  // draw triangle
  triangle(r, 580, r + 20, 550, r + 40, 580);

  y = constrain(y, 0, 500); // constrain of y position of circle
  
  // constrain of number of token in each row, cannot go below 0
  colums[0]= constrain(colums[0], 0, 7);
  colums[1] = constrain(colums[1], 0, 7);
  colums[2] = constrain(colums[2], 0, 7);
 
  // score counter
  score = colums[0] + colums[1] + colums[2] + " tokens left"; 
  
  // score display
  textSize(30);
  fill(50);
  text(score, 50, 40);
  
  
  
}

void keyPressed() {

  // arrow key moving left or right
  if (keyCode == LEFT) {
    r = r - 90;
  }
  if (keyCode == RIGHT) {
    r = r + 90;
  }

  r = constrain(r, 40, 220); // constrain triangle position

  // number pressed to take away the number of token
  if ( (key >= '1') && (key <= '8') ) {  
    for (int i = 0; i < num; i++) {
      
      int numTokens = (key - '0');

      if ((90 * i + 60) == (r + 20)) {
        
        colums[i] = colums[i] - numTokens;
       
      } else if (i < numTokens) {      
        colums[i] = colums[i]; // Nothing happens if number is higher than token available
      }
    }
  }
}

// functtion to draw a random number of dot
int rendom() {  
  return int(random(3, 7));
}