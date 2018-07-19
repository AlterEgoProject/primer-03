// reference from http://code.compartmental.net/minim/audioinput_class_audioinput.html

import ddf.minim.*;

Minim minim;
AudioInput in;

void setup(){
  size(1000,600);
  minim = new Minim(this);
  in = minim.getLineIn();
  frameRate(60);
}
void draw(){
  background(0);
  stroke(255);
  
  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i, 300 + in.mix.get(i)*500, i+1, 300 + in.mix.get(i+1)*500 );
  }
}
