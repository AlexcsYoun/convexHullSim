
/*
A rendered point in the simulation
*/

class Point implements Comparable<Point>{
  private PVector pos;
  private PointStatus status = PointStatus.ACTIVE;
  
  Point(float x, float y){
    this.pos = new PVector(x,y);
    
  }
  
  PVector getPos(){
    return this.pos.copy();
  }
  
  
  PointStatus getStatus(){
    return this.status;
  }
  
  void reset(){
    status = PointStatus.ACTIVE;
  }
  
  void delete(){
    status = PointStatus.DELETED;
  }
  
  void compare(){
    status = PointStatus.COMPARING;
  }
  
  void render(){
    
    if(status == PointStatus.DELETED){
      strokeWeight(2);
      stroke(150,0,0);
      line(pos.x+3,pos.y+3,pos.x-3,pos.y-3);
      line(pos.x-3,pos.y+3,pos.x+3,pos.y-3);
    }
    else if(status == PointStatus.COMPARING){
      status = PointStatus.ACTIVE;
      strokeWeight(8);
      stroke(10);
      fill(10,0);
      ellipseMode(CENTER);
      circle(pos.x, pos.y, 15);
      
    }
    else{
      //strokeWeight(5);
      //strokeCap(PROJECT);
      //stroke(10);
      //point(pos.x, pos.y);
      strokeWeight(2);
      stroke(50,50,50);
      line(pos.x+4,pos.y,pos.x-4,pos.y);
      line(pos.x,pos.y+4,pos.x,pos.y-4);
    }
    

  }
   
  /* returns true if current Point has greater y value than other, tie breaks by lower x value */
  boolean bottomPoint(Point other){
    PVector oPos = other.getPos();
    if(pos.y > oPos.y){
      return true;
    }
    if(pos.y < oPos.y){
      return false;
    }
    
    return pos.x < oPos.x;
  }
  
  public int compareTo(Point p){
    PVector o = p.getPos();
    
    if(pos.x == o.x && pos.y == o.y){
      return 0;
    }
    
    if(pos.x < o.x){
      return -1;
    }
    else{
      if(pos.x == o.x && pos.y > o.y){
        return -1;
      }
      return 1;
    }  
  }
}
