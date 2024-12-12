class DeletePoint extends Action{
  private Point p;
  
  DeletePoint(Point p){
    this.p = p;
  }
  
  public void forward(){
    p.delete();
    particles.push(new Particle("DELETED",p.getPos(),1000,100,0,0));

  }
  
  public void backward(){
    p.reset();
  }
  
  public void render(){}
}
