import java.util.Collections;

class JarvisMarch extends ConvexHullAlgorithm{
  Hull hull = new Hull(false);
  
  
  JarvisMarch(){
    super("Jarvis March");
  }
  
  @Override
  public void execute(ArrayList<Point> points){
    
    int origin = points.indexOf(Collections.min(points));
    
    boolean stay = true;
    super.pushAction(new AddHullPoint(hull, points.get(origin)));
    int prev = origin;
    while(stay){
      int cur = (prev +1) % (points.size());
      for(int i = 0; i < points.size(); i++){
        Point p = points.get(i);
        Orientation orient = new Orientation (points.get(prev), points.get(cur), p);

        if(orient.getResult() > 0 ){
           cur = i;
        }
       super.pushAction(orient);
       
      }
      
      prev = cur;
      Point cPoint = points.get(cur);
      if(cur == origin){
        stay = false;
      }
      else{
        super.pushAction(new AddHullPoint(hull, cPoint));
        System.out.println(String.format("%f,%f",cPoint.getPos().x, cPoint.getPos().y)); 
      }
    }
    super.pushAction(new CompleteHull(hull));    
  }
  
  
  public void render(){
    hull.render();
    super.render();
     //<>//
  }
}
