Walker[] walker = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector grav = new PVector(0, -0.4);

PVector mousePos(){
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x,y);
}

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  frameRate(120);
  
  // init walkers (reversed so smallest is rendered last)
  for(int i = 0; i < 10; i++){
    walker[i] = new Walker(10-i);
  }
}

void draw(){
  background(80);
  
  // update and render
  for(Walker w : walker){
    // earth's gravity
    grav = new PVector(0, -0.4*w.mass);
    w.applyForce(wind);
    w.applyForce(grav);
    w.update();
    w.render();
  }
}
