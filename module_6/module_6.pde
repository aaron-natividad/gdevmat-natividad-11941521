Walker[] walker = new Walker[8];
PVector force = new PVector(0.2, 0);
boolean reset = false;

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  frameRate(120);
  
  // init walkers
  for(int i =  0; i < 8; i++){
    walker[i] = new Walker(i+1, Window.left + 100);
  }
}

void draw(){
  background(20);
  
  // reset on mouse click
  if(mousePressed && !reset){
    for(Walker w : walker){
      w.reset();
    }
    reset = true;
  }
  else if (!mousePressed){
    reset = false;
  }
  
  // main loop
  for(Walker w : walker){
    // change to 0.4 at the middle of the screen
    if(w.position.x > 0){
      w.mew = 0.4f;
    }
    
    // friction
    float normal = 1; // n
    PVector friction = w.velocity.copy(); // v
    float frictionMag = w.mew * normal; // mew * n
    friction.mult(-1).normalize().mult(frictionMag); // -1 * mew * n * v
    
    // bonus: make acceleration gravity-like
    force = new PVector(0.2*w.mass, 0);
    
    // update and render
    w.applyForce(friction);
    w.applyForce(force);
    w.update();
    w.render();
    
    // render middle line
    strokeWeight(5);
    stroke(250);
    line(0,Window.top,0,Window.bottom);
  }
}
