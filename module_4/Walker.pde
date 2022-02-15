public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public int[] colorValue = {255,255,255};
  public float size = 50;
  public float velocityLimit = 10;
  
  public Walker(){
    position.x = random(Window.left, Window.right);
    position.y = random(Window.bottom, Window.top);
    size = random(10,40);
  }
  
  public void update(){
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
  }
  
  public void render(){
    fill(colorValue[0],colorValue[1],colorValue[2]);
    circle(position.x, position.y, size);
  }
  
  public void checkEdges(){
    if(position.x > Window.right){
      position.x = Window.left;
    }
    else if(position.x < Window.left){
      position.x = Window.right;
    }
    else if(position.y > Window.top){
      position.y = Window.bottom;
    }
    else if(position.y < Window.bottom){
      position.y = Window.top;
    }
  }
}
