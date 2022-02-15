Walker[] walker = new Walker[10];

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  frameRate(120);
  
  for(int i = 0; i < 10; i++){
    walker[i] = new Walker(random(5,20), random(Window.left, Window.right), random(Window.bottom, Window.top));
    walker[i].randomFill();
  }
}

void draw(){
  background(255);
  
  for(int i = 0; i < 10 ; i++){
    for(int j = 0; j < 10; j++){
      if(i!=j){
        walker[i].applyForce(walker[j].calculateAttraction(walker[i]));
      }
    }
  }
  
  for(Walker w : walker){
    w.update();
    w.render();
  }
}
