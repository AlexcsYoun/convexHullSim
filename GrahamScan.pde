import java.util.Collections;
import java.util.Comparator;

class GrahamScan extends ConvexHullAlgorithm{
  
  private Hull hull = new Hull(false);
  GrahamScan(){
    super("Graham Scan");
  }
  
  public void execute(ArrayList<Point> points){
    Point origin = points.get(0);
    for(Point p: points){
      if(p.bottomPoint(origin)){
        origin = p;
      }
    }
    
    Comparator sort = new PolarSort(origin, this);
    
    Collections.sort(points, sort);
    
    for(int i =1 ; i< points.size()-1; i++){
      Point cur = points.get(i);
      Point next = points.get(i+1);
      Orientation orient = new Orientation(origin, cur, next);
      super.pushAction(orient);
      if(orient.getResult() == 0){
        cur.delete(); //temporarily mark point as deleted to check later;
        super.pushAction(new DeletePoint(cur));
      }
    }
    
    ArrayList<Point> constructHull = new ArrayList<Point>();
    
    for(Point p: points){
      if(p.getStatus() != PointStatus.DELETED){
        boolean stay = true;
        while (stay){
          if(constructHull.size() > 1){
            Point b = constructHull.get(constructHull.size()-1);
            Point a = constructHull.get(constructHull.size()-2);
            
            Orientation orient = new Orientation(a,b,p);
            
            if(orient.getResult() > 0){
              constructHull.remove(constructHull.size()-1);
              super.pushAction(new PopHullPoint(hull));
              super.pushAction(new DeletePoint(b));
              
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
        super.pushAction(new AddHullPoint(hull, p));
        }
      else{
        p.reset();
      }
    }
    
    super.pushAction(new CompleteHull(hull));
  }
  
  @Override
  public void render(){
    hull.render();
    super.render();
    
  }
}  
