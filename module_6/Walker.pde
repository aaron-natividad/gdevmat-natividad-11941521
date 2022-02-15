public class Walker
{
  public PVector position = new PVector(-500, 200);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public int[] colorValue = {int(random(255)),int(random(255)),int(random(255))};
  public float resetX = 0;
  public float size = 15;
  public float mass = 1;
  public float mew = 0.01f;
  public float velocityLimit = 10;
  public float partition = 0; // for properly spacing out each ball
  
  
  
  public Walker(float m, float posX){
    // reset and other variables
    resetX = posX;
    mass = m;
    size = m*15;
    
    // starting position on construction (relative to size)
    position.x = posX;
    for(int i = 1; i <= mass; i++){
      partition += i;
      position.y = Window.top - 90 - 15*partition + 15*i/2;
    }
  }
  
  public void update(){
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }
  
  public void render(){
    noStroke();
    fill(colorValue[0],colorValue[1],colorValue[2]);
    circle(position.x, position.y, size);
  }
  
  public void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  public void checkEdges(){
    // some minor position correction so it doesn't phase through screen
    if(position.x >= Window.right - size/2){
      position.x = Window.right - size/2;
      velocity.x *= -1;
    }
    else if(position.y >= Window.top - size/2){
      position.y = Window.top - size/2;
      velocity.y *= -1;
    }
    if(position.x <= Window.left + size/2){
      position.x = Window.left + size/2;
      velocity.x *= -1;
    }
    else if(position.y <= Window.bottom + size/2){
      position.y = Window.bottom + size/2;
      velocity.y *= -1;
    }
  }
  
  public void reset(){
    mew = 0.01f;
    position.x = Window.left + 100;
    velocity.mult(0);
    acceleration.mult(0);
    colorValue[0] = int(random(256));
    colorValue[1] = int(random(256));
    colorValue[2] = int(random(256));
  }
}
