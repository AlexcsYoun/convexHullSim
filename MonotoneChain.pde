import java.util.Collections;
import java.util.Comparator;

class MonotoneChain extends ConvexHullAlgorithm{
  
  private Hull top = new Hull(false);
  private Hull bottom = new Hull(false);
  
  
  MonotoneChain(){
    super("Monotone Chain");
  }
  
  @Override
  public void execute(ArrayList<Point> points){
    Comparator sort = new LexicographicalSort();
    Collections.sort(points, sort);
    
    ArrayList<Point> constructHull = new ArrayList<Point>();
    
    
    for(Point p: points){
      boolean stay = true;
      
      while (stay){
        if(constructHull.size() > 1){
          Point b = constructHull.get(constructHull.size()-1);
          Point a = constructHull.get(constructHull.size()-2);
          
          Orientation orient = new Orientation(a,b,p);
          
          if(orient.getResult() > 0){
            constructHull.remove(constructHull.size()-1);
            PopHullPoint popPoint = new PopHullPoint(top);
            super.pushAction(popPoint);
          }
          else{
            stay = false;
          }
          super.pushAction(orient);
        }
        else{
          stay = false;
        }
      }
      
      constructHull.add(p);
      super.pushAction(new AddHullPoint(top, p));
      
    }
    
    super.pushAction(new CompleteHull(top, false));

    
    for(int i = points.size()-1; i >=0; i--){
      Point p = points.get(i);
      boolean stay = true;
      
      while (stay){
        if(constructHull.size() > 1){
          Point b = constructHull.get(constructHull.size()-1);
          Point a = constructHull.get(constructHull.size()-2);
          
          Orientation orient = new Orientation(a,b,p);
          
          if(orient.getResult() > 0){
            constructHull.remove(constructHull.size()-1);
            PopHullPoint popPoint = new PopHullPoint(bottom);
            super.pushAction(popPoint);
          }
          else{
            stay = false;
          }
          super.pushAction(orient);
        }
        else{
          stay = false;
        }
      }
      
      constructHull.add(p);
      super.pushAction(new AddHullPoint(bottom, p));
      
    }

    super.pushAction(new CompleteHull(bottom, false));
    
    
  }
  
  @Override
  public void render(){
    top.render();
    bottom.render();
    super.render();

  }
  
}
