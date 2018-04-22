//Taylor Armstrong
//MAGD 150 Lab 5
//2-4-2018


ellipseObj circleButton;
rectObj rectButton;

boolean mouseHold;

String str1, str2;

int option, circleOrigX, circleOrigY, rectOrigX, rectOrigY;
int backColor1, backColor2, backColor3, randColor1, randColor2, randColor3;

public void setup()
{
  size(800, 800);
  
  
  mouseHold = false;
  
  str1 = "Option 1 (Hold)";
  str2 = "Option 2 (Hold)";
  
  circleOrigX = 100;
  circleOrigY = 300;
  
  rectOrigX = 390;
  rectOrigY = 123;
  
  circleButton = new ellipseObj(circleOrigX, circleOrigY, 200, 200);
  circleButton.setText(str1);
  
  rectButton = new rectObj(rectOrigX, rectOrigY, 300, 300);
  rectButton.setText(str2);
  
  option = 0;
  
  backColor1 = 200;
  backColor2 = 150;
  backColor3 = 200;
  
  randColor1 = 0;
  randColor2 = 0;
  randColor3 = 0;
}

public void draw()
{
  if(!mouseHold)
  {
    if(mousePressed)
    {
      if(circleButton.intersects(mouseX, mouseY))
      {
        mouseHold = true;
        switchARoo();
        
        option = 1;
      }
      else if(rectButton.intersects(mouseX, mouseY))
      {
        randColor1 = (int)random(255);
        randColor2 = (int)random(255);
        randColor3 = (int)random(255);
        
        mouseHold = true;
        randomPlace();
        
        option = 2;
      }
    }
    else
    {
      background(backColor1, backColor2, backColor3);
      circleButton.setText(str1);
      rectButton.setText(str2);
      
      option = 0;
    }
  }
  
  if(mousePressed && mouseHold)
  {
    switch(option)
    {
      case 1:
              background(255 - backColor1, 255 - backColor2, 255 - backColor3);
              break;
      case 2:
              background(randColor1, randColor2, randColor3);
              break;
      default:
    }
  }
  else if(!mousePressed && mouseHold)
  {
    mouseHold = false;
    
    switch(option)
    {
      case 1:
              switchARoo();
              break;
      case 2:
              rectButton.setX(rectOrigX);
              rectButton.setY(rectOrigY);
              
              circleButton.setX(circleOrigX);
              circleButton.setY(circleOrigY);
      default:
    }
  }
  
  circleButton.setTextColor(200, 100, 200);
  rectButton.setTextColor(200, 100, 200);
  
  fill(231, 254, 255);
  circleButton.drawOnScreen();
  rectButton.drawOnScreen();
}

public void switchARoo()
{
  float temp;
  
  temp = circleButton.getX();
  circleButton.setX(circleButton.getY());
  circleButton.setY(temp);
  
  temp = rectButton.getX();
  rectButton.setX(rectButton.getY());
  rectButton.setY(temp);
}

public void randomPlace()
{
  rectButton.setX(random(width - rectButton.getWidth()));
  rectButton.setY(random(height - rectButton.getHeight()));
  
  circleButton.setX(random(circleButton.getWidth() / 2, width - (circleButton.getWidth() / 2)));
  circleButton.setY(random(circleButton.getHeight() / 2, height - (circleButton.getHeight() / 2)));
}
  

public class ellipseObj                    //This is an object I created to make my life easier while crating mutiple ellipses (allowd a use of an array of objects).
{
  private float x;                         //X cord.
  private float y;                         //Y cord.
  
  private float heightNo;                  //Height (radius of ellipse). This object only have funcianality for the same height ans width!
  private float widthNo;
  
  private String label;
  
  private int color1;
  private int color2;
  private int color3;
  
  public ellipseObj()
  {
    x = 0;
    y = 0;
    
    heightNo = 0;
    widthNo = 0;
    
    label = null;
  }
  
  public ellipseObj(float xPos, float yPos, float heightPos, float widthPos)
  {
    x = xPos;
    y = yPos;
    heightNo = heightPos;
    widthNo = widthPos;
    
    label = null;
    
    ellipse(x, y, heightNo, widthNo);
  }
  
  public void setX(float xPos)
  {
    x = xPos;
  }
  
  public float getX()
  {
    return x;
  }
  
  public void setY(float yPos)
  {
    y = yPos;
  }
  
  public float getY()
  {
    return y;
  }
  
  public float getHeight()
  {
    return heightNo;
  }
  
  public float getWidth()
  {
    return widthNo;
  }
  
  public void setText(String addText)
  {
     label = addText;
     
     color1 = 0;
     color2 = 0;
     color3 = 0;
  }
  
  public void setTextColor(int c1, int c2, int c3)
  {
    color1 = c1;
    color2 = c2;
    color3 = c3;
  }
  
  public void drawOnScreen()
  {
    int oldColor = g.fillColor;
    
    ellipse(x, y, heightNo, widthNo);
    
    if(label != null)
    {
      fill(color1, color2, color3);
      textSize(min(heightNo, widthNo) / 10);
      text(label, x - 72, y + 10);
      fill(oldColor);
    }
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
}

public class rectObj
{
  private float x;
  private float y;
  
  private float xLength;
  private float yLength;
  
  private String label;
  
  private int color1;
  private int color2;
  private int color3;
  
  public rectObj()
  {
    x = 0;
    y = 0;
    
    xLength = 0;
    yLength = 0;
    
    label = null;
  }
  
  public rectObj(float xPos, float yPos, float xLeng, float yLeng)
  {
     x = xPos;
     y = yPos;
     
     xLength = xLeng;
     yLength = yLeng;
     
     label = null;
     
     rect(x, y, xLength, yLength);
  }
  
  public void setX(float xPos)
  {
    x = xPos;
  }
  
  public float getX()
  {
    return x;
  }
  
  public void setY(float yPos)
  {
    y = yPos;
  }
  
  public float getY()
  {
    return y;
  }
  
  public float getWidth()
  {
    return xLength;
  }
  
  public float getHeight()
  {
    return yLength;
  }
  
  public void setText(String addText)
  {
     label = addText;
     
     color1 = 0;
     color2 = 0;
     color3 = 0;
  }
  
  public void setTextColor(int c1, int c2, int c3)
  {
    color1 = c1;
    color2 = c2;
    color3 = c3;
  }
  
  public void drawOnScreen()
  {
    int oldColor = g.fillColor;
    
    rect(x, y, xLength, yLength);
    
    if(label != null)
    {
      fill(color1, color2, color3);
      textSize(min(xLength, yLength) / 10);
      text(label, x + 40, (y + yLength / 2) + 5);
      fill(oldColor);
    }
  }
  
  public boolean intersects(float xPos, float yPos)
  {
    float x2Temp, y2Temp;
    
    x2Temp = x + xLength;
    y2Temp = y + yLength;
    
    if((x <= xPos) && (y <= yPos))
    {
      if((x2Temp >= xPos) && (y2Temp >= yPos))
      {
        return true;
      }
    }
    
    return false;
  }
}