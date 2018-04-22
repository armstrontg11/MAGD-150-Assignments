//Taylor Armstrong
//MAGD 150 Lab 4
//2-25-2018

//The purpose of this program is to use "if" statements as well as key/mouse presses.

//The user can click on the slices of pizza (each has a different color) and press buttons "w" and "s".



pizza []piece = new pizza[4];          //Pizza Pizza slices.


float angle = 0;                       //The angle of the sine wave.
float angleChange = .1;                //The change of the angle for the sine wave.
float amplitude = 100;                 //The height of the sine wave.

float xHeight = 0;                     //The user allocated height for the sine wave. 


public void setup()
{
  size(800, 800);    //800 x 800 screen size.
}

public void draw()
{
  background(#0077be);    //Ocean Blue
  
  strokeWeight(5);
  noFill();
  
  beginShape();          //This draws the sine wave using sin method.
  {
    for(int x = 0; x <= width + 140; x += 5)
    {
      
      if(angle > 999)   //This rectricts the "speed" of the sine wave.
      {
        angle = 0;
      }
      
      float y = constrain(map(sin(angle), -1, 1, 0, 100) + xHeight, 1, height - 1);   //This calc. the y points for the sine wave.
      
      vertex(x, y);           //This draws each point for the sine wave.
      angle += angleChange;   //Adds up for next calc.
    }
  }
  endShape();
  
  
  noStroke();
  
  fill(#dba24a);    //Pizza dough color.
  
  piece[0] = new pizza(100, 100, 300, 180, 100, 260);
  piece[1] = new pizza(500, 100, 700, 180, 500, 260);
  piece[2] = new pizza(500, 500, 700, 580, 500, 660);    //Pizza Pizza!
  piece[3] = new pizza(100, 500, 300, 580, 100, 660);
  
  fill(212, 78, 42);
  
  ellipse(140, 150, 20 , 20);
  ellipse(180, 160, 20 , 20);    //The pepperoni for slice 1.
  ellipse(134, 200, 20 , 20);
  ellipse(246, 183, 20 , 20);
  
  ellipse(554, 174, 20 , 20);
  ellipse(636, 180, 20 , 20);    //The pepperoni for slice 2.
  ellipse(533, 220, 20 , 20);
  ellipse(519, 177, 20 , 20);
  
  ellipse(147, 559, 20 , 20);
  ellipse(173, 558, 20 , 20);    //The pepperoni for slice 3.
  ellipse(136, 579, 20 , 20);
  ellipse(224, 577, 20 , 20);
  
  ellipse(511, 544, 20 , 20);
  ellipse(542, 597, 20 , 20);    //The pepperoni for slice 4.
  ellipse(621, 594, 20 , 20);
  ellipse(542, 619, 20 , 20);
  
  stroke(0);
  
  for(int i = 0; i < piece.length; ++i)        //The interaction for each slice of pizza. I forgot the colors and am too lazy to look them up.
  {
    if(piece[0].intersects(mouseX, mouseY) && mousePressed)
    {
      stroke(#EA4949);
    }
    else if(piece[1].intersects(mouseX, mouseY) && mousePressed)
    {
      stroke(#49EA88); 
    }
    else if(piece[2].intersects(mouseX, mouseY) && mousePressed)
    {
      stroke(#EAEA49);
    }
    else if(piece[3].intersects(mouseX, mouseY) && mousePressed)
    {
      stroke(#A149EA);
    }
  }
  
  if(keyPressed && (key == 'w' || key == 'W'))    //The movement of the sine wave. "w" is up and "s" is down.
  {
    xHeight = xHeight - 3;
  }
  else if(keyPressed && (key == 's' || key == 's'))
  {
    xHeight = xHeight + 3;
  }
}

public class pizza         //Pizza object using triangles.
{
  private float x1;
  private float y1;
  
  private float x2;
  private float y2;
  
  private float x3;
  private float y3;
  
  public pizza() {}    //Lazy
  
  public pizza(float xPos1, float yPos1, float xPos2, float yPos2, float xPos3, float yPos3)
  {
    x1 = constrain(xPos1, 0, width);
    y1 = constrain(yPos1, 0, height);
    
    x2 = constrain(xPos2, 0, width);                  //Creates a triangle.
    y2 = constrain(yPos2, 0, height);
    
    x3 = constrain(xPos3, 0, width);
    y3 = constrain(yPos3, 0, height);
    
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
  private float area(float xPos1, float yPos1, float xPos2, float yPos2, float xPos3, float yPos3)
  {
    //This method takes a point and two trangles vertexes and calc. the area of the smaller (or larger) triangle.
    
    return Math.abs((xPos1 * (yPos2 - yPos3) + xPos2 * (yPos3 - yPos1) + xPos3 * (yPos1 - yPos2)) / 2);
  }
  
  public boolean intersects(float pointX, float pointY)    //This method checks to see if a point is inside a triangle.
  {                                                            //By using the area method above.
    float areaTotal, area1, area2, area3;  //Total area is .this triangles area; area1, area2, and area3 are all new triangles made
                    //by using the new point.
    
    areaTotal = this.area(x1, y1, x2, y2, x3, y3);
    area1 = this.area(pointX, pointY, x2, y2, x3, y3);    //Finds the triangles to chect to see if they are equal.
    area2 = this.area(x1, y1, pointX, pointY, x3, y3);
    area3 = this.area(x1, y1, x2, y2, pointX, pointY);
    
    if(areaTotal == (area1 + area2 + area3))       //If the three triangles added up (area1, area2, and area3) are equal to (totalArea) of
    {                                                         //.this triangle then a point is inside the .this triangle.
      return true;
    }
    else
    {
      return false;
    }
  }
}