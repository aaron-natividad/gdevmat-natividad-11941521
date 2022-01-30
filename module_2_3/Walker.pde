public class Walker
{
  public float x;
  public float y;
  public float r = 255;
  public float g = 255;
  public float b = 255;
  public float size = 50;
  public float tx = random(10000);
  public float ty = random(10000);
  public float tr = random(10000);
  public float tg = random(10000);
  public float tb = random(10000);
  public float ts = random(10000);
  
  void render(){
    circle(x, y, size);
  }
  
  void perlinWalk(){
    x = map(noise(tx), 0, 1, -screenX/2, screenX/2);
    y = map(noise(ty), 0, 1, -screenY/2, screenY/2);
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    size = map(noise(ts), 0, 1, 5, 150);
    fill(r, g, b);
    
    tx += 0.01f;
    ty += 0.01f;
    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
    ts += 0.01f;
  }
}
