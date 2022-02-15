public class Walker
{
  public PVector position = new PVector(-500, 200);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public int[] colorValue = {255, 255, 255};
  public float size = 10;
  public float mass = 1;
  public float velocityLimit = 10;
  public float partition = 0; // for properly spacing out each ball
  
  public Walker(float m, float posX, float posY){
    position.x = posX;
    position.y = posY;
    mass = m;
    size = m*10;
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
  
  public void randomFill(){
    colorValue[0] = int(random(256));
    colorValue[1] = int(random(256));
    colorValue[2] = int(random(256));
  }
}
