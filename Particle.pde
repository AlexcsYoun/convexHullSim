class Particle{
  private String text;
  private PVector position;
  private int r,g,b;
  private int birth;
  private int liveTime;
  
  Particle(String text, PVector position, int liveTime, int r, int g, int b){
    this.text = text;
    this.position = position.copy();
    this.r = r;
    this.g = g;
    this.b = b;
     
    this.birth = millis();
    this.liveTime = liveTime;
  }
  
  public boolean alive(){
    return millis() <= birth + liveTime;
  }
  
  public void render(){
    if(millis() > birth + liveTime){
      return;
    }
    int transperancy = (int) map(millis(),birth,birth+liveTime, 255, 0);
    
    textSize(15);
    fill(r,g,b,transperancy);
    text(text,position.x,position.y);
    
    position.add(0, -0.3);
    
    //reset transperancy;
    
    fill(255,255);
  }
  
}
