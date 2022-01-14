
// Animate 3 electrons orbiting around a nucleus.
// Each electron should follow a path and match
// colors with its respective path.

// Don't use rotate()
// Use vectors and trigonometry

  float x = 50;
  float y = 200;
  
  boolean isReturningX = false;
  boolean isReturningY = false;
  
  
void setup(){
  size(400, 400);
  
  
  
}
void draw(){
  
  drawBackground();
  
  ///////////////// START YOUR CODE HERE:
  
  
  
  
  fill(#FFF9C6);
  stroke(#FFF9C6);
  ellipse(x, y, 25, 25);
  
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
  
  println(y + " , " + isReturningY);
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
