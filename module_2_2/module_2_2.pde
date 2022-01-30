int screenX = 1020;
int screenY = 720;
int circleCount = 0;

void setup(){
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
  frameRate(120);
}

void draw(){
  float genSD = 200;
  float genMean = 0;
  float circleSD = 10;
  float circleMean = 20; // mean is also standard circle size
  
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
  int alpha = int(random(10, 101));

  float y = (float)(random(-(screenY/2)+circleMean,(screenY/2)-circleMean));
  float x = genSD * randomGaussian() + genMean;
  float circleSize = circleSD * randomGaussian() + circleMean;
  
  noStroke();
  fill(r, g, b, alpha);
  circle(x, y, circleSize);
  
  if(circleCount >= 300){
    circleCount = 0;
    background(0);
  }
  else{
    circleCount++;
  }
}
