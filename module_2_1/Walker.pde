class Walker
{
  float x = 0;
  float y = 0;
  
  void render(){
    circle(x, y, 30);
  }
  
  void randomWalk(int distance){
    int rng = int(random(8));
    randomFill();
    
    switch(rng){
      case 0:
        y += distance;
        break;
      case 1:
        y -= distance;
        break;
      case 2:
        x += distance;
        break;
      case 3:
        x -= distance;
        break;
      case 4:
        x += distance;
        y += distance;
        break;
      case 5:
        x -= distance;
        y += distance;
        break;
      case 6:
        x += distance;
        y -= distance;
        break;
      case 7:
        x -= distance;
        y -= distance;
        break;
    }
  }
  
  void randomWalkBiased(int distance){
    int rng = int(random(10));
    randomFill();
    
    switch(rng){
      case 0:
      case 1:
      case 2:
        y += distance;
        break;
      case 3:
        y -= distance;
        break;
      case 4:
        x += distance;
        break;
      case 5:
        x -= distance;
        break;
      case 6:
        x += distance;
        y += distance;
        break;
      case 7:
        x -= distance;
        y += distance;
        break;
      case 8:
        x += distance;
        y -= distance;
        break;
      case 9:
        x -= distance;
        y -= distance;
        break;
    }
  }
  
  void randomFill(){
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int alpha = int(random(50,101));
    
    fill(r, g, b, alpha);
    noStroke();
  }
}
