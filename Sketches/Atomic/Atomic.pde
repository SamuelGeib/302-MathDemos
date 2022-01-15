
// Animate 3 electrons orbiting around a nucleus.
// Each electron should follow a path and match
// colors with its respective path.

// Don't use rotate(), pushMatrix(), or popMatrix()
// Use vectors and trigonometry

  float x1, x2, x3;
  float y1, y2, y3; 
  final float a = 150; // 1/2 length of major axis
  final float b = 50; // 1/2 length of minor axis
  int angle1, angle2, angle3;
  
  
  boolean isReturningX = false;
  boolean isReturningY = false;
  
  
void setup(){
  size(400, 400);
  
  
  
}
void draw(){
  
  drawBackground();
  
  ///////////////// START YOUR CODE HERE:
  noStroke();
  
  
  angle1++;
  
  // Red Electron
  fill(255, 0, 0); // set Color to red
  // Move in an elpitical orbit around (200, 200)
  x1 = a*cos((PI/180)*angle1);
  y1 = b*sin((PI/180)*angle1);
  translate(width/2, height/2);
  //Draw the electron
  ellipse(x1, y1, 25, 25);
  
  // Green Electron
  angle2 ++;
  fill(0, 255, 0); // set Color to red
  // Move in an elpitical orbit around (200, 200)
  
  // Can I recreate the rotate function??
  
  
  x2 = 1 * cos((PI/180) * angle1) - 86 * sin((PI/180) * angle1);
  y2 = 92.5 * cos((PI/180) * angle1) + 100 * sin((PI/180) * angle1);
  
  
  //translate(width/2, height/2);
  //Draw the electron
  ellipse(x2, y2, 25, 25);
  
  
  // do the third one
  x3 = 86 * cos((PI/180) * angle1) - 1 * sin((PI/180) * angle1);
  y3 = 100 * cos((PI/180) * angle1) + 92.5 * sin((PI/180) * angle1);
  fill(0, 0, 255);
  ellipse(x3, y3, 25, 25);
  
  
  
  /**
  // Oscilate X
  if ( x < 350 && isReturningX == false) {
    x++;
    
  } else if (x == 350) {
   isReturningX = true; 
  }
  
  if (x > 50 && isReturningX == true) {
   x--; 
  } else if (x == 50) {
   isReturningX = false; 
  }
  
  
  // Attempt to change Y value exponentially
  y = -.002 * ((x - 200) * (x - 200) + 250);
  
  
  
  // Oscilate Y
  if ( y >= 150 && isReturningY == false) {
    y -= 1;
    
  } else if (y <= 150) {
   isReturningY = true; 
  }
  
  if (y <= 250 && isReturningY == true) {
   y += 1;
  } else if (y >= 250) {
   isReturningY = false; 
  }
  */
  
  println(y1 + " , " + isReturningY);
  ///////////////// END YOUR CODE HERE
  
}
void drawBackground(){
  background(0);
  noStroke();
  fill(255);
  ellipse(200,200,50,50);
  noFill();
  strokeWeight(5);
  
  pushMatrix();
  translate(200,200);
  stroke(255,100,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(PI/1.5);
  stroke(100,255,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(2*PI/1.5);
  stroke(100,100,255);
  ellipse(0,0,300,100);
  popMatrix();
}
