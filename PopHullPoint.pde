import processing.sound.*;


class PopHullPoint implements Action{
  private Hull hull;
  private Integer pos;
  private Point p;
 
  PopHullPoint(Hull hull){
    this.hull = hull;
  }
  
  PopHullPoint(Hull hull, int pos){
    this.hull = hull;
    this.pos = pos;
  }
  
  
  public void forward(){
    if(pos != null){
      p = hull.popPoint(pos);
    }
    else{
      p = hull.popPoint();
    }
  
    //SoundFile sound = generateSound("deep-ass-meow.mp3");
    //sound.play();
    //sound.removeFromCache();
    
    particles.push(new Particle("REMOVED",p.getPos(),1000,255,0,0));

  }
  
  public void backward(){
    if(pos != null){
      hull.pushPoint(p, pos);
    }
    else{
      hull.pushPoint(p);
    }
  }
  
  public void render(){}
}
