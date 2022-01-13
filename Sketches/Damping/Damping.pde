// Demo on Damping (A.K.A)...
// Exponential slide
// Asymptotic easing ( the line that a graph approaches but never touches)

// 3 circles' x positions:
float x1, x2, x3;

// circle #2's velocity:
float v2;


void setup(){
  size(500, 500, P2D); //P2D runs off of the GPU making things smoother?
}

void draw() {
  background(0);
  
  // x1
  // linear movement:
  if(x1 < mouseX) {
    x1 += 5;
    if(x1 > mouseX) x1 = mouseX;
  }
  else {
    x1 -= 5;
    if(x1 < mouseX) x1 = mouseX;
  }
  
  // Use physics  to move circle 2 (x2)
  
  if(x2 < mouseX) v2 ++;
  else v2 --;
  
  v2 *= .95; // Apply friction
  
  x2 += v2; // euler integration (physics)
  
  // use damping (x3):
  
  // each tick move 50% towards target
  //x3 += (mouseX - x3) * .1; // move 10% towards the target
  
  x3 = lerp(x3, mouseX, .1);
  
  // Draw circles:
  ellipse(x1, height*1/4, 25, 25);
  ellipse(x2, height*2/4, 25, 25);
  ellipse(x3, height*3/4, 25, 25);
  
}
