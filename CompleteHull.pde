class CompleteHull extends Action{
  private Hull hull;
  CompleteHull(Hull hull){
    this.hull = hull;
  }
  
  
  public void simulate(){
    hull.complete();
  }

} 
