Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walker = new Walker[10];
PVector wind = new PVector(0.1, 0);

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  frameRate(120);
  
  for(int i = 0; i < 10; i++){
    walker[i] = new Walker(random(1,11), Window.left + (100*(i+1)), 300);
    walker[i].randomFill();
  }
}

void draw(){
  background(255);
  // friction
  float c = 0.1f;
  float normal = 1;
  float frictionMagnitude = c * normal;
  
  ocean.render();
  
  for(Walker w : walker){
    PVector friction = w.velocity.copy();
    friction.mult(-1).normalize().mult(frictionMagnitude);
    // gravity
    PVector gravity = new PVector(0, -0.15 * w.mass);
  
    if(ocean.isCollidingWith(w)){
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
    else{
      w.applyForce(wind);
    }
    w.applyForce(friction);
    w.applyForce(gravity);
    w.update();
    w.render();
  }
}
