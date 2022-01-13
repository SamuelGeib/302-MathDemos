// Lerp Sketch

//Runs once at the start
void setup() {
  size(500, 500);
}

// Runs once every frame (60fps)
// Gameloop
void draw() {
  background(128);
  
  
  
  //Calculate the Stroke Weight with the mouse Y position
  float p2 = mouseY / (float) height;
  float w = lerp(1, 50, p2);
  strokeWeight(w);
  
  // Calculate the percentage for the ellipse
  float percent = mouseX / (float) width; // Inorder to get a float as the result, we must divide by a float, not an integer
  
  // Calculate the diameter:
  float diameter = lerp(50, 500, percent); // Lerp syntax (min, max, paercent)
  
  // What to draw
  ellipse(width/2, height/2, diameter, diameter);
}
