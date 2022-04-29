//Global Variables
//
void setup()
{
  size(600, 600); //fullScreen(); //displayWidth, displayHeight
  //Code evaluates if the WINDOW Size will be able to be displayed, reduce by percentage if "NO"
  //Code inspects geometry, what is the shorter side, always displays board right side up
  println("What is bigger? DisplayWidth or width:", displayWidth, width);
  println("What is bigger? DisplayHeight or height:", displayHeight, height);
  println("what is the geometery for a Square Orientation?");
  //Code creates Square Geometry
  //Thus, phone can be either orientation, still able to play Tic Tac Toe
  //Algorithm saves user from themselves, always displays CANVAS
  display(); //Square manditory
  //
}//End Setup
//
void draw() {}//End draw
//
void mousePressed() {}//End mousePressed
//
void keyPressed() {}//End keyPressed
//
//End MAIN Program
