
void setup(){
  size(500,500);
}

void draw() {
  background(0);
  
  float d = doMap(mouseX, 0, width, 10, 400); // This function implicitly casts int to float
  
  ellipse(width/2, height/2, d, d);
  
}

// Recreating the lerp() function
float doLerp(float min, float max, float p) {
  return (max-min) * p + min; // (max-min) finds the range of values, p is the gieven percentage of that range which we want, and adding it back to the min gives us the new value

}

// Recreating the map() function
float doMap(float val, float inMin, float inMax, float outMin, float outMax) {
 
  // 1. figure out the p
  
  // find out where Value falls between inMin and inMax ( the percentage)
  // range * p + inMin = Val
  // range * p = val-inMin
  // p = (val-inMin) / (inMax - inMin)
  
  float p = (val - inMin) / (inMax - inMin);
  
  // 2. lerp using the p 
  return doLerp(outMin, outMax, p);
}
