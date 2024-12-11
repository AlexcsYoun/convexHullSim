class CompleteHull extends Action{
  private Hull hull;
  private boolean closed;
  
  CompleteHull(Hull hull){
    this.hull = hull;
    closed = true;
  }
  
  CompleteHull(Hull hull, boolean closed){
    this.hull = hull;
    this.closed = closed;
  }
  
  
  
  public void simulate(){
    hull.complete();
    hull.setClosed(closed);
  }

} 
