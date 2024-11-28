import processing.sound.*;
SoundFile file;
   
class AddHullPoint extends Action{
  private Hull hull;
  private Point p;
  private Integer pos;
  public static SoundFile file = new SoundFile(this, "deep-ass-meow.mp3");
 
 
  AddHullPoint(Hull hull, Point p){
    this.hull = hull;
    this.p = p;
  }
  

  AddHullPoint(Hull hull, Point p, Integer pos){
    this.hull = hull;
    this.p = p;
    this.pos = pos;
  }
  
  public void simulate(){
    if(pos != null){
      hull.pushPoint(p, pos);
    }
    else{
      hull.pushPoint(p);
    }
   
  }

}
