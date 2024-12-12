import processing.sound.*;


class PopHullPoint extends Action{
  private Hull hull; 
  private Point p;
 
  PopHullPoint(Hull hull){
    this.hull = hull;
  }
  
  
  public void simulate(){
    p = hull.popPoint();
    //SoundFile sound = generateSound("deep-ass-meow.mp3");
    //sound.play();
    //sound.removeFromCache();
    
    particles.push(new Particle("Removed",p.getPos(),1000,255,0,0));

  }
}
