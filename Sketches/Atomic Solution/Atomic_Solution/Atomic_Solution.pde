// Atomic Solution
// Nick Pattison tutorial


// Animate 3 electrons orbiting around a nucleus.
// Each electron should follow a path and match
// colors with its respective path.

// Don't use rotate(), pushMatrix(), or popMatrix()
// Use vectors and trigonometry

float x1, x2, x3;
float y1, y2, y3;
final float a = 150; // 1/2 length of major axis
final float b = 50; // 1/2 length of minor axis
//int angle;


boolean isReturningX = false;
boolean isReturningY = false;


void setup() {
  size(400, 400);
}
void draw() {

  drawBackground();

  ///////////////// START YOUR CODE HERE:

  noStroke();
  fill(255);

  
  PVector red = FindOvalPos(0, 0);
  PVector red2 = FindOvalPos(0, 2);
  PVector green = FindOvalPos(60, 1);
  PVector blue = FindOvalPos(-60, 2);



  ellipse(red.x, red.y, 20, 20);
  ellipse(red2.x, red2.y, 20, 20);
  ellipse(green.x, green.y, 20, 20);
  ellipse(blue.x, blue.y, 20, 20);

  ///////////////// END YOUR CODE HERE
}
PVector FindOvalPos(float rotateAmount, float timeOffset) {

  float time = millis()/1000.0;

  // find path on oval:
  float x = 150 * cos(time + timeOffset);
  float y =  50 * sin(time + timeOffset);

  // convert coordinate to polar:
  float angle = atan2(y, x); // What does atan2() do?
  float mag = sqrt(x*x + y*y);

  // rotate vector:
  angle -= radians(rotateAmount); // radians() converts the given value (60) from radians to degrees

  // convert back to cartesian:
  x = mag * cos(angle);
  y = mag * sin(angle);

  // translate to center of screen:
  x += width/2;
  y += height/2;
 
  return new PVector(x, y); // nre PVector makes a new vector object. Doesn't work without this 
  
  // Another way to do this:
  // PVector val = new PVector(x, y);
  // return val;
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
