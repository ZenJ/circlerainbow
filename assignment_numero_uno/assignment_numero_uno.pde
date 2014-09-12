//assignment numero uno
float red;
float blue;
float green;
float thex;
float they;

void setup()
{
  background (red);
  size(645, 400);
  thex = 20;
  they = 200;
}

void draw()

{
  red = random(0, 255);
  blue = random(0, 255);
  green = random(0, 255);
  strokeWeight(2);
  
 
  

  fill (0);
  stroke (red, blue, green);
  ellipse(thex, they, 400, 400);
  
  thex=thex+10;
  
  if(thex>width) thex=6;
  
   fill (0);
  stroke (red, blue, green);
  ellipse(thex, they, 360, 360);
  
  fill (0);
  stroke (red, blue, green);
  ellipse(thex, they, 300, 300);
  
    fill (0);
  stroke (red, blue, green);
  ellipse(thex, they, 240, 240);
  
    fill (0);
  stroke (red, blue, green);
  ellipse(thex, they, 200, 200);

fill (0);
  stroke (red, blue, green);
  ellipse(thex, they, 120, 120);
  
  fill (0);
  stroke (red, blue, green);
  ellipse(thex, they, 70, 70);
  
  fill (0);
  stroke (red, blue, green);
  ellipse(thex, they, 20, 20);
  
}

void keyPressed()
{
  if(key=='w') background(0);

  
}
