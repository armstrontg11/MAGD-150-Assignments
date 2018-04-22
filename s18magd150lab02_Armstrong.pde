//Taylor Armstrong
//MAGD 150 Lab 2
//2-11-2018


//The purpose of this program is to draw balloons with colors.

public void setup()
{
  size(500, 500);                //The size of the window.
  background(100, 200, 200);     //The color of the window's background.
}

public void draw()
{
  colorMode(RGB, 255, 255, 255); //Uses RGB color scheme with max values.
  strokeWeight(1.5);             //Weight of the black lines.
  
  fill(200, 50, 200, 255);               //Colors a shape.
  triangle(35, 30, 165, 30, 100, 150);   //Triangle (x1, y1, x2, y2, x3, y3)
  triangle(335, 30, 465, 30, 400, 150);
  
  noFill();                      //No color of next "shapes."
  
  bezier(100, 150,               //I am not going to try to explaining these.
    90, 180,
    92, 210,
    130, 260);
    
  bezier(400, 150,
   410, 180,
   408, 210,
   370, 260);
   
   colorMode(HSB, 360, 100, 100, 100); 
   fill(109, 52, 95);
   quad(200, 150, 300, 150,    //Rectangle with 4 points.
        200, 350, 300, 350);
   
   strokeWeight(1.2);
   line(250, 350, 250, 450);   //A line.
   
   
   fill(0x5CFF9090);
   strokeWeight(0);
   
   arc(35, 30, 100, 200, 0, .739);   //Arcs (x, y, height, width, start rad, end rad)
   arc(465, 30, 100, 200, PI - .739, PI);
}