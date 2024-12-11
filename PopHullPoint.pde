import processing.sound.*;


class PopHullPoint extends Action{
  private Hull hull; 
 
  PopHullPoint(Hull hull){
    this.hull = hull;
  }
  
  
  public void simulate(){
    hull.popPoint();
    SoundFile sound = generateSound("deep-ass-meow.mp3");
    sound.play();
    sound.removeFromCache();
  }
}
