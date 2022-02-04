public class Walker
{
  public PVector position = new PVector();
  public PVector speed = new PVector(5, 8); // default values for moveAndBounce()
  public float[] colorValue = {255, 255, 255}; // rgb
  public float size = 50;
  public float tx = random(10000);
  public float ty = random(10000);
  public float tr = random(10000);
  public float tg = random(10000);
  public float tb = random(10000);
  public float ts = random(10000);
  
  void render(){
    circle(position.x, position.y, size);
  }
  
  void moveAndBounce(){
    background(255);
    if(position.x >= Window.right || position.x <= Window.left){
      randomFill();
      strokeWeight(1);
      speed.x *= -1;
    }
    if(position.y >= Window.top || position.y <= Window.bottom){
      randomFill();
      strokeWeight(1);
      speed.y *= -1;
    }
    position.add(speed);
  }
  
  void perlinWalk(){
    // perlin movement
    position.x = map(noise(tx), 0, 1, Window.left, Window.right);
    position.y = map(noise(ty), 0, 1, Window.bottom, Window.top);
    
    // perlin rgb
    colorValue[0] = map(noise(tr), 0, 1, 0, 255);
    colorValue[1] = map(noise(tg), 0, 1, 0, 255);
    colorValue[2] = map(noise(tb), 0, 1, 0, 255);
    size = map(noise(ts), 0, 1, 5, 150);
    fill(colorValue[0], colorValue[1], colorValue[2]);
    noStroke();
    
    // add time
    tx += 0.01f;
    ty += 0.01f;
    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
    ts += 0.01f;
  }
  
  void randomWalk(int distance){
    // recoded using PVector
    randomFill();
    noStroke();
    speed.x = int(random(-2,2)) * distance;
    speed.y = int(random(-2,2)) * distance;
    position.add(speed);
  }
  
  void randomWalkBiased(int distance){
    // bias based on random range (biased going up)
    randomFill();
    noStroke();
    int dirX = int(random(-2,2));
    int dirY = int(random(-2,3));
    
    //clamp
    if(dirX > 1)
      dirX = 1;
    else if(dirX < -1)
      dirX = -1;
    if(dirY > 1)
      dirY = 1;
    else if(dirY < -1)
      dirY = -1;  
    
    /// move
    speed.x = dirX * distance;
    speed.y = dirY * distance;
    position.add(speed);
  }
    
  void randomFill(){
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int alpha = int(random(50,101));
    
    fill(r, g, b, alpha);
  }
}
