int shift = 0; //phase shift for sine wave
float amplitude = 20;
float frequency = 0.1;

void setup(){
  size(1280, 720, P3D); // window size
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); // set 0,0 to center
  frameRate(60); 
}

void draw(){
  background(10);
  
  drawCartesianPlane(350, 10);
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();
  keyCheck();
  //drawCircle(0,0,50);
}

void drawCartesianPlane(int width, int interval){
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  strokeWeight(1);
  
  line(-width, 0, width, 0);
  line(0, -width, 0, width);
  
  for(int i = -width; i <= width; i+=interval){
    line(i,2,i,-2);
    line(2,i,-2,i);
  }
}

void drawLinearFunction(){
  // f(x) = -5x+30
  color purple = color(128, 0, 255);
  fill(purple);
  noStroke();
  
  for(float x = -200; x <= 200; x+=0.2f){
    circle(x, (float)(((-5)*x)+30), 2);
  }
}

void drawQuadraticFunction(){
  // f(x) = x^2 - 15x - 3
  color yellow = color(255, 255, 0);
  fill(yellow);
  noStroke();
  
  for(float x = -200; x <= 200; x+=0.2f){
    circle(x, (float)(Math.pow(x,2) - 15*x - 3), 2);
  }
}

void drawCircle(int x, int y, int radius){
  color white = color(255, 255, 255);
  fill(white);
  noStroke();
  
  for(int d = 0; d <= 360; d++){
    circle((float)Math.cos(d)*radius + x, (float)Math.sin(d)*radius + y, 2);
  }
}

void drawSineWave(){
  //NOTE freq is 1/period, hence multiplied (freq++ = more waves, smaller period; freq-- = less waves, bigger period)
  color cyan = color(0, 255, 255);
  fill(cyan);
  noStroke();
  
  for(float x = -300; x <= 300; x+=0.2f){
    circle(x, (float)(amplitude*Math.sin((x+shift)*frequency)), 2);
  }
  shift++;
}

void keyCheck(){
  if(keyPressed){
    if(key == 'a' || key == 'A'){
      frequency -= 0.01f;
    }
    else if(key == 'd' || key == 'D'){
      frequency += 0.01f;
    }
    else if(key == 'w' || key == 'W'){
      amplitude += 1f;
    }
    else if(key == 's' || key == 'S'){
      amplitude -= 1f;
    }
  }
  
  //clamp
  if(frequency < 0)
    frequency = 0;
  else if(frequency > 0.5)
    frequency = 0.5;
  if(amplitude < 0)
    amplitude = 0;
  else if(amplitude > 100)
    amplitude = 100;
}
  
