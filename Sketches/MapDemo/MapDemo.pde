
void setup() {
  size(500, 500); 
}

void draw() {
   background(128); 
   
   //float p = mouseX / (float) width;
   //float radians = lerp(0, 3, p); // calculate the angle in radians!
   
   // the following line of code takes the mouse's current x position, and uses it to calculate a number between 0 and 3 which can be used to ratate the square
   float radians = map(mouseX, 0, width, 0, 3); // "map()" syntax: map(Variable, current minimum value, current maximum value, new minumum value, new maximum value | maps one range of values to another 

   
   pushMatrix(); // Start a new transform
   translate(width/2, height/2); // Translate moves the world origin to a new position
   rotate(radians); // "rotate()" Rotates around the world origin
   rect(-200, -200, 400, 400);
   
   popMatrix(); // Stop the transform
}
