void setup(){
  size(1280,720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos(){
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x,y);
}

void draw(){
  background(130);
  PVector mouse = mousePos();
  float mag;
 
  // red glow
  strokeWeight(20);
  stroke(255, 0, 0);
  strokeCap(ROUND);
  mouse.normalize().mult(300);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  mag = mouse.mag();
  
  // white glow
  strokeWeight(10);
  stroke(255, 255, 255);
  strokeCap(ROUND);
  mouse.normalize().mult(mag-5);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
  // handle
  strokeWeight(22);
  stroke(0, 0, 0);
  strokeCap(PROJECT);
  mouse.normalize().mult(70);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
  println(mag);
}
