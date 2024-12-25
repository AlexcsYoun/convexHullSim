/* A Hull, that may be complete or incomplete
*/
class Hull{
  private boolean closed, closedReset;
  private boolean complete = false;
  private ArrayList<Point> points;
  
  Hull(boolean closed){
    this.closed = closed;
    this.closedReset = closed;
    points = new ArrayList<Point>();
  }
  
  int size(){
    return points.size();
  }
  
  void pushPoint(Point p){
    points.add(p);
  }
  
  void pushPoint(Point p, int pos){
    points.add(pos, p);
  }
  
  Point popPoint(){
    Point last = points.get(points.size()-1);
    points.remove(points.size()-1);
    return last;
  }
  
  Point popPoint(int pos){
    Point p = points.get(pos);
    points.remove(pos);
    return p;
  }
  
  public void reset(){
    points.clear();
    setClosed(closedReset);
    setComplete(false);
  }
  
  
  void setComplete(boolean complete){
    this.complete = complete;
  }
  
  void setClosed(boolean closed){
    this.closed = closed;
  }
  
  boolean getClosed(){
    return closed;
  }
  
  void render(){
    strokeWeight(6);
    if(complete){
      stroke(227,232,9);
    }
    else{
      stroke(200);
    }
    if(points.size() > 1){
      PVector prev = points.get(0).getPos();
      for(int i =1; i < points.size(); i++){
        PVector cur = points.get(i).getPos();
        line(prev.x, prev.y, cur.x, cur.y);
        prev = cur;
      }
      
      if(closed){
        PVector cur = points.get(0).getPos();
        line(prev.x, prev.y, cur.x, cur.y);
      }
    }
      
    
  }
}
