
// Tween is like interpolation
// Tween is a begining value, an ending value, and the time it takes to move between them

float xStart = 20; // Starting x-position of the circle
float xEnd = 780; // Ending x-position of the circle

float timeCurrent = 0; // keeps track of the current time
float timeTotal = 1; // measured in seconds

float timeStampPrev = 0; // The previous time


void setup() {
  size(800, 500);
}

void draw() {
  background(64);
  
  float timeStamp = millis()/1000.0; // Setting timeStamp to the current time in seconds
  float dt = timeStamp -timeStampPrev; // Finding delta time
  timeStampPrev = timeStamp; // Setting the previous time to the current time
  
  timeCurrent += dt;
  
  float p = timeCurrent / timeTotal;
  p = constrain(p, 0, 1); // Processing's clamp function
  
  // bending the percent curve
  // to add easing (eas in / ease out)
  p = p *p *(3-2 *p);

  float x = lerp(xStart, xEnd, p);

  ellipse(x, height/2, 30, 30);
}

// Restart the animation every time you click
void mousePressed() {
 timeCurrent = 0; 
}
