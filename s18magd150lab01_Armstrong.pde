//Taylor Armstrong
//MAGD 150 Lab 1

//The purpose of this program is to use grayscale to draw something related to space.

//The picture is suppose to be a bottom of a UFO.

public void setup()
{
  size(400, 400);    //The size of the GUI.
}

public void draw()
{
  background(200);    //background color.
  
  noFill();
  noStroke();
  
  fill(120);                      //The object color.
  ellipseMode(CENTER);
  ellipse(200, 200, 300, 300);    //Ellipse with 200 x pos, 200 y pos, 300 x-axis size, 300 y-axis size.
  
  stroke(0);
  
  strokeWeight(5);      //How heavy the lines are around an object.
  fill(80);
  ellipse(140, 120, 80, 50);
  ellipse(105, 205, 80, 50);
  ellipse(140, 290, 80, 50);
  
  ellipse(260, 120, 80, 50);
  ellipse(295, 205, 80, 50);
  ellipse(260, 290, 80, 50);
  
  strokeWeight(6);
  strokeJoin(BEVEL);
  fill(55);
  rect(175, 178, 50, 50);    //A rectangle.
}