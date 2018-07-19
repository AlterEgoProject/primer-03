// reference from http://code.compartmental.net/minim/audioinput_class_audioinput.html

import ddf.minim.*;

Minim minim;
AudioInput in;
float[] data;
float[] amp;
int amp_length;

void setup(){
  size(500,300);
  minim = new Minim(this);
  in = minim.getLineIn();
  frameRate(60);
  amp = new float[500];
  amp_length = amp.length;
  data = new float[in.bufferSize()];
}
void draw(){
  background(0);
  stroke(255);
  
  for(int i=0; i<data.length-1; i++){
    data[i]=in.mix.get(i);
  }
  
  System.arraycopy(amp, 1, amp, 0, amp_length-1);
  amp[amp_length-1] = max(data)*500;

  // draw the waveforms so we can see what we are monitoring
  for(int i=0; i<amp.length-1; i++)
  {
    line( i, 250-amp[i], i+1,  250-amp[i+1] );
  }
}
