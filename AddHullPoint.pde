import processing.sound.*;
   
class AddHullPoint implements Action{
  private Hull hull;
  private Point p;
  private Integer pos;
 
 
  AddHullPoint(Hull hull, Point p){
    this.hull = hull;
    this.p = p;
  }
  

  AddHullPoint(Hull hull, Point p, Integer pos){
    this.hull = hull;
    this.p = p;
    this.pos = pos;
  }
  
  @Override
  public void forward(){
    if(pos != null){
      hull.pushPoint(p, pos);
    }
    else{
      hull.pushPoint(p);
    }
    particles.push(new Particle("ADDED",p.getPos(),1000,0,150,0));
    
    SoundFile sound = generateSound("sounds/deep-ass-meow.mp3");
    sound.play();
    sound.amp(0.15);
    sound.removeFromCache();

  }
  
  @Override
  public void backward(){
    if(pos != null){
      hull.popPoint(pos);
    }
    else{
      hull.popPoint();
    }
  }
  
  @Override
  public void render(){
    
  }

}
