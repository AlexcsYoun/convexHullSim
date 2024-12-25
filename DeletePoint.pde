class DeletePoint extends Action{
  private Point p;
  
  DeletePoint(Point p){
    this.p = p;
  }
  
  @Override
  public void next(){
    p.delete();
    particles.push(new Particle("DELETED",p.getPos(),1000,100,0,0));
  }
  
  @Override
  public void back(){
    p.reset();
  }
  
  @Override
  public void render(){}
}
