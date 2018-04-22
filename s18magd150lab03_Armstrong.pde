//Taylor Armstrong
//MAGD 150 Lab 3
//2-18-2018

//The purpose of this program is to use math operators and such but I added bubbles you can move and pop other bubbles with one.


import processing.sound.*;

int moveNoBubble = -1;              //The index of the bubble to move by the user.
SoundFile file;                     //Holds the audio file.
String audioName = "Blop-Mark_DiAngelo-79054334.mp3";    //The name of the audio file.
String path;                               //The pathway of the audio file.
ellipseObj bubbles[] = new ellipseObj[5];    //The array of ellipses.

public void setup()
{
   System.out.println("Turn sound on and if it requires it, import sound libary!");
   System.out.println("Click and hold on the bubbles to move them!");
   System.out.println("Let go and click on another bubbles to move a different one!");
   System.out.println("Try hitting the bubbles together and see what happends!\n");
   
   size(500, 500);
   background(100, 100, 100);
   
   
   frameRate(999999999);                                                        //Max possoble FPS.
   
   path = sketchPath(audioName);                                                //Audio path.
   file = new SoundFile(this, path);                                            //File object that holds the audio file.
   
   for(int i = 0; i < bubbles.length * 50; i = i + 50)
   {
     bubbles[i / 50] = new ellipseObj(i + 10, i + 10, 50, 50);                  //Places the starting bubbles.
   }
}

public void draw()
{
  background(100, 100, 100, 100);
  
  for(int i = 0; i < bubbles.length; ++i)                                      //Draws all the bubbles.
  {
    bubbles[i].drawOnScreen();
  }
  
  if(moveNoBubble >= 0 && moveNoBubble < bubbles.length)                      //If the bubble you what to move's index is valid in array.
  {
    if(mousePressed)                                                          //If mouse is pressed.
    {
      bubbles[moveNoBubble].changeCord(mouseX, mouseY);                       //Bubble reprints location where mouse location is on GUI.
      
      for(int i = 0; i < bubbles.length; ++i)
      {
        if(bubbles[moveNoBubble].collision(bubbles[i]))                       //If the bubble the user is moving hits another bubble...
        {
          bubbles[i].setX(random(500));
          bubbles[i].setY(random(500));                                       //... randomize the hit bubble location...
          file.play();                                                        //... play a "poping" sound.
        }
      }
    }
    else
    {
      moveNoBubble = -1;
    }
  }
  
  if(moveNoBubble == -1)                                                      //If the user has not clicked on a bubble currently.
  {
    for(int i = 0; i < bubbles.length; ++i)
    {
      if(bubbles[i].intersects(pmouseX, pmouseY) && mousePressed)             //Check to see if the user's mouse is over a bubble.
      {
        moveNoBubble = i;
        break;
      }
    }
  }
}

public class ellipseObj                    //This is an object I created to make my life easier while crating mutiple ellipses (allowd a use of an array of objects).
{
  private float x;                         //X cord.
  private float y;                         //Y cord.
  
  private float heightNo;                  //Height (radius of ellipse). This object only have funcianality for the same height ans width!
  private float widthNo;
  
  public ellipseObj()
  {
    x = 0;
    y = 0;
    heightNo = 0;
    widthNo = 0;
    ellipse(x, y, heightNo, widthNo);
  }
  
  public ellipseObj(float xPos, float yPos, float heightPos, float widthPos)
  {
    x = xPos;
    y = yPos;
    heightNo = heightPos;
    widthNo = widthPos;
    
    fill(231, 254, 255);
    ellipse(x, y, heightNo, widthNo);
  }
  
  public void drawOnScreen()          //Creates new ellipses.
  {
    fill(231, 254, 255);
    ellipse(x, y, heightNo, widthNo);
  }
  
  public void setX(float xPos)      //Change x cord.
  {
    x = constrain(xPos, 0, width);    //Restrict the x to be in the screen size.
    
    fill(231, 254, 255);
    ellipse(x, y, heightNo, widthNo);
  }
  
  public void setY(float yPos)     //Change y cord.
  {
    y = constrain(yPos, 0, height);  //Restrict the y to be in the screen size.
    
    fill(231, 254, 255);
    ellipse(x, y, heightNo, widthNo);
  }
  
  public float getX()
  {
    return x;
  }
  
  public float getY()
  {
    return y;
  }
  
  public void changeCord(float xPos, float yPos)    //Changes both x and y cord.
  {
    x = constrain(xPos, 0, width);
    y = constrain(yPos, 0, height);
    
    fill(231, 254, 255);
    ellipse(x, y, heightNo, widthNo);
  }
  
  public boolean intersects(float xPos, float yPos)      //Checks to see if two cord is in the ellipse.
  {
    if((heightNo / 2) >= sqrt(pow(xPos - x, 2) + pow(yPos - y, 2)))
    {      
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public boolean collision(ellipseObj bubble)            //Checks to see if a ellipse is in another ellipse.
  {
    if(this != bubble)
    {
      if(pow(heightNo, 2) >= pow(bubble.x - x, 2) + pow(bubble.y - y, 2))
      {      
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      return false;
    }
  }
}