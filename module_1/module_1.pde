void setup(){
  size(1280, 720, P3D); // window size
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw(){
  // set color white
  background(50); // background color
  
  
  drawCartesianPlane(350, 10);
  drawLinearFunction();
  drawQuadraticFunction();
  drawCircle(0,0,50);
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
  // f(x) = x+2
  color white = color(255, 255, 255);
  fill(white);
  noStroke();
  
  for(int x = -200; x <= 200; x++){
    circle(x, x+2, 2);
  }
}

void drawQuadraticFunction(){
  // f(x) = x^2 + 2x - 5
  
  color white = color(255, 255, 255);
  fill(white);
  noStroke();
  
  for(float x = -200; x <= 200; x+=0.01f){
    circle(x, (float)(Math.pow(x,2) + 2*x - 5), 2);
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
  
