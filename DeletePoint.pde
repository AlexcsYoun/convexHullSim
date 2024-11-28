class DeletePoint extends Action{
  private Point p;
  
  DeletePoint(Point p){
    this.p = p;
  }
  
  public void simulate(){
    p.delete();
  }
}
