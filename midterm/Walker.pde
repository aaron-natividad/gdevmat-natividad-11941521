public class Walker
{
  public PVector position = new PVector();
  public PVector speed = new PVector();
  public int[] colorValue = {255,255,255};
  public float size = 50;
  public float walkerSD = 200;
  
  void update(){
    position.add(speed);
  }
  
  void render(){
    fill(colorValue[0],colorValue[1],colorValue[2]);
    circle(position.x, position.y, size);
  }
  
  void randomSpawn(PVector mean){
    noStroke();
    colorValue[0] = int(random(256));
    colorValue[1] = int(random(256));
    colorValue[2] = int(random(256));
    size = random(10, 40);
    position.x = walkerSD * randomGaussian() + mean.x;
    position.y = walkerSD * randomGaussian() + mean.y;
  }
}
