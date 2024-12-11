
/*
A rendered point in the simulation
*/

class Point{
  private PVector pos;
  private PointStatus status = PointStatus.ACTIVE;
  
  Point(float x, float y){
    this.pos = new PVector(x,y);
    
  }
  
  PVector getPos(){
    return this.pos;
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
      stroke(200,0,0);
      line(pos.x+2,pos.y+2,pos.x-2,pos.y-2);
      line(pos.x-2,pos.y+2,pos.x+2,pos.y-2);
    }
    else if(status == PointStatus.COMPARING){
      status = PointStatus.ACTIVE;
      strokeWeight(8);
      stroke(255);
      fill(255,0);
      ellipseMode(CENTER);
      circle(pos.x, pos.y, 15);
      
    }
    else{
      strokeWeight(2);
      stroke(255);
      point(pos.x, pos.y);
    }
    

  }
   
  /* returns true if current Point has greater y value than other, tie breaks by lower x value */
  boolean less(Point other){
    PVector oPos = other.getPos();
    if(pos.y > oPos.y){
      return true;
    }
    if(pos.y < oPos.y){
      return false;
    }
    
    return pos.x < oPos.x;
  }
}
