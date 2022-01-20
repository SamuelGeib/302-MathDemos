
// Animate 3 electrons orbiting around a nucleus.
// Each electron should follow a path and match
// colors with its respective path.

// Don't use rotate(), pushMatrix(), or popMatrix()
// Use vectors and trigonometry

float x1, x2, x3;
float y1, y2, y3;
final float a = 150; // 1/2 length of major axis
final float b = 50; // 1/2 length of minor axis
int angle;


boolean isReturningX = false;
boolean isReturningY = false;


void setup() {
  size(400, 400);
}
void draw() {

  drawBackground();

  ///////////////// START YOUR CODE HERE:
  noStroke();


  angle++;

  // Red Electron
  fill(255, 0, 0); // set Color to red
  // Move in an elpitical orbit around (200, 200)
  x1 = a*cos((PI/180)*angle);
  y1 = b*sin((PI/180)*angle);
  translate(width/2, height/2);
  //Draw the electron
  ellipse(x1, y1, 25, 25);

  // Green Electron
  fill(0, 255, 0); // set Color to red
  // Move in an elpitical orbit around (200, 200)

  // Can I recreate the rotate function??


  x2 = 1 * cos((PI/180) * angle) - 86 * sin((PI/180) * angle);
  y2 = 92.5 * cos((PI/180) * angle) + 100 * sin((PI/180) * angle);


  //Draw the electron
  ellipse(x2, y2, 25, 25);


  // do the third one
  x3 = 86 * cos((PI/180) * angle) - 1 * sin((PI/180) * angle);
  y3 = 100 * cos((PI/180) * angle) + 92.5 * sin((PI/180) * angle);
  fill(0, 0, 255);
  ellipse(x3, y3, 25, 25);

  ///////////////// END YOUR CODE HERE
}
void drawBackground() {
  background(0);
  noStroke();
  fill(255);
  ellipse(200, 200, 50, 50);
  noFill();
  strokeWeight(5);

  pushMatrix();
  translate(200, 200);
  stroke(255, 100, 100);
  ellipse(0, 0, 300, 100);
  popMatrix();

  pushMatrix();
  translate(200, 200);
  rotate(PI/1.5);
  stroke(100, 255, 100);
  ellipse(0, 0, 300, 100);
  popMatrix();

  pushMatrix();
  translate(200, 200);
  rotate(2*PI/1.5);
  stroke(100, 100, 255);
  ellipse(0, 0, 300, 100);
  popMatrix();
}
