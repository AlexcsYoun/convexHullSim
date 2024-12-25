import processing.sound.*;

class CompleteHull implements Action{
  private Hull hull;
  private boolean closed;
  private boolean pClosed;
  private SoundFile sound;
  
  CompleteHull(Hull hull){
    this.hull = hull;
    closed = true;
  }
  
  CompleteHull(Hull hull, boolean closed){
    this.hull = hull;
    this.closed = closed;
  }
  
  
  @Override
  public void forward(){
    pClosed = hull.getClosed();
    hull.setComplete(true);
    hull.setClosed(closed);
    sound = generateSound("sounds/the weather outside is rizzy.mp3");
    sound.jump(0);
  }
  
  
  @Override
  public void backward(){
    hull.setComplete(false);
    hull.setClosed(pClosed);
    sound.pause();
  }
  
  @Override
  public void render(){

  }

} 
