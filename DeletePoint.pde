class DeletePoint extends Action{
  private Point p;
  
  DeletePoint(Point p){
    this.p = p;
  }
  
  public void simulate(){
    p.delete();
    particles.push(new Particle("DELETED",p.getPos(),1000,100,0,0));

  }
}
