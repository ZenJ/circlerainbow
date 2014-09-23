// draw this:
//x = 2 sin(3 u) / (2 + cos(v))
//y = 2 (sin(u) + 2 sin(2 u)) / (2 + cos(v + 2 pi / 3))
//
//z = (cos(u) - 2 cos(2 u)) (2 + cos(v)) (2 + cos(v + 2 pi / 3)) / 4
//
//-pi <= u <= pi
//-pi <= v <= pi

import ddf.minim.*; // import an external library

// audio stuff
Minim minim; // this is the audio engine
AudioInput in; // this is the audio input
float theamp; // this is how loud i'm being

int NUMPOINTS = 50;
float r = 0.;
float scroll = 0.;

PShape s; // this is my cool shape
PImage img; // this is my cool image

void setup()
{
  size(800, 800, OPENGL);
  
  //img = loadImage("mitt.jpg"); // load in mitt romney
 // textureMode(NORMAL); // express uvw in normal coordinates (0-1)
 // textureWrap(REPEAT); // make the texture wrap
  // audio shit
  minim = new Minim(this); // this starts the audio engine
  in = minim.getLineIn();
  
  fillShape();
}

void draw()
{
  doaudiostuff();
  background(0);
  lights();
  fill(123, 432, 234);
  //noFill();
  stroke(255);
  noStroke();
  fillShape();
  
  float samp = map(theamp, 0., 1., 1., 20);

  translate(mouseX, mouseY);
  rotate(r, -0.2, 0.3143, 0.3);
  //scale(theamp*2.0+0.05);
  scale(0.05);
  shape(s, 0, 0);
  r= r+theamp;
  scroll = scroll+0.1;
}

void fillShape()
{
  
  s = createShape();
  s.beginShape(QUAD_STRIP);
 // s.texture(img);
  
   for(int i = 0;i<NUMPOINTS;i++)
   {
      for(int j = 0;j<NUMPOINTS;j++)
     {
       float u = map(i, 0, NUMPOINTS, 0, 1);
       float v = map(j, 0, NUMPOINTS, 0, 1);
       float x = (2.0 + sin(2.0*PI*u)*sin(2.0*PI*v))*sin(3.0*PI*v);
       float y = (2.0 + sin(2.0*PI*u)*sin(2.0*PI*v))*cos(3.0*PI*v);
       float z = cos(2.0*PI*u)*sin(2.0*PI*v) + 4.0*v-2.0;       

        s.vertex(x*width+width, y*width+width, z*width+width, (float(i*10)/NUMPOINTS)+scroll, (float(j*10)/NUMPOINTS)+scroll);
     } 
   }
   
     s.endShape();
}

void doaudiostuff()
{
  float rawamp = 0.;

  for (int i = 0; i < in.bufferSize () - 1; i++)
  {
    rawamp = rawamp + abs(in.left.get(i)); // add the abs value of the current sample to the amp
  }
  rawamp = rawamp / in.bufferSize();

  theamp = mysmooth(rawamp, theamp, 0.9);

}

// y(n) = a*y(n-1) + (1.0-a)*x(n)
float mysmooth(float x, float y, float a)
{
  return(a*y + (1.0-a)*x);
}
