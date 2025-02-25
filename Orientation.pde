import processing.sound.*;


class Orientation implements Action {
  private Point a;
  private Point b;
  private Point c;
  
  Orientation(Point a, Point b, Point c){
    this.a = a;
    this.b = b;
    this.c = c;
  }
  
  
  public float getResult(){
    PVector lineA = PVector.sub(b.getPos(),c.getPos());
    PVector lineB = PVector.sub(b.getPos(),a.getPos());
    PVector ans = lineA.cross(lineB);
    return ans.z;
  }
  
  @Override
  public void forward(){
    float freq = map(c.getPos().x, 0,width,50,800);
    Beep(freq,100);
  }
  
  @Override 
  public void backward(){
    float freq = map(c.getPos().x, width,0,50,800);
    Beep(freq,100);
  }
  
  @Override
  public void render(){
    PVector pA = a.getPos();
    PVector pB = b.getPos();
    PVector pC = c.getPos();
    
    
    float res = this.getResult();
    strokeWeight(4);
    stroke(226,187,121);

    line(pA.x, pA.y, pB.x, pB.y);
    if(res > 0){
      stroke(200,0,0);
    }
    else if(res < 0){
      stroke(0,200,0);
    }
    else{
      stroke(0,0,200);
    }
    line(pB.x, pB.y, pC.x, pC.y);
    
    c.compare();
  } 
  
}
