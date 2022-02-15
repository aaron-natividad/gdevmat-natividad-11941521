Walker[] walkers = new Walker[100];

PVector mousePos(){
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x,y);
}

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  frameRate(120);
  
  // init walkers
  for(int i = 0; i < 100; i++){
    walkers[i] = new Walker();
  }
}

void draw(){
  background(80);
  
  // update and render
  for(Walker w : walkers){
    w.acceleration = PVector.sub(mousePos(),w.position).normalize().mult(0.2);
    w.update();
    w.render();
  }
}
