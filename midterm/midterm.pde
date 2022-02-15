int timer = 0;
Walker[] circles = new Walker[100];
Walker blackHole = new Walker();

PVector mousePos(){
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x,y);
}

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  frameRate(120);
  
  // black hole first position
  blackHole.position.x = random(Window.left, Window.right);
  blackHole.position.y = random(Window.bottom, Window.top);
  
  // init circles
  for(int i = 0; i < 100; i++){
      circles[i] = new Walker();
  }  
}

void draw(){
  background(0);
  // reset
  if(timer == 0){
    timer = 400;
    blackHole.position.x = random(Window.left,Window.right);
    blackHole.position.y = random(Window.bottom,Window.top);
    for(Walker c : circles){
      c.randomSpawn(blackHole.position);
    }    
  }
  
  // follow black hole
  else{
    timer--;
    blackHole.speed = PVector.sub(mousePos(), blackHole.position).normalize().mult(3);
    for(Walker c : circles){
      c.speed = PVector.sub(blackHole.position,c.position).normalize().mult(4);
    }
  }
  
  // update and render
  for(Walker c : circles){
    c.move();
    c.render();
  }
  blackHole.move();
  blackHole.render();
}
