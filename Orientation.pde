class Orientation extends Action {
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
  public void render(){
    PVector pA = a.getPos();
    PVector pB = b.getPos();
    PVector pC = c.getPos();
    System.out.println(String.format("x: %f y:%f", pA.x, pA.y));
    float res = this.getResult();
    strokeWeight(6);
    stroke(255);

    line(pA.x, pA.y, pB.x, pB.y);
    System.out.println(res);
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
  };
  
}
