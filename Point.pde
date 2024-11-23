
/*
A rendered point in the simulation
*/

class Point{
  private PVector pos;
  private PointStatus status = PointStatus.ACTIVE;
  
  Point(int x, int y){
    this.pos = new PVector(x,y);
    
  }
  
  PVector getPos(){
    return this.pos;
  }
  
  
  PointStatus getStatus(){
    return this.status;
  }
  
  void render(){
    strokeWeight(8);
    stroke(255);
    point(pos.x, pos.y);
  }
}
