import java.util.Collections;

class QuickHull extends ConvexHullAlgorithm{
  Hull hull = new Hull(true);
  
  
  QuickHull(){
    super("QuickHull");
    super.addHull(hull);
  }
  
  @Override
  public void execute(ArrayList<Point> points){
    Point p1 = Collections.min(points), p2 = Collections.max(points);
   
   
    super.pushAction(new AddHullPoint(hull, p1));
    super.pushAction(new AddHullPoint(hull, p2));

 
     ArrayList<Point> upper = new ArrayList<Point>();
     ArrayList<Point> lower= new ArrayList<Point>();
     for(Point p: points){
       Orientation orient = new Orientation(p1, p2, p);
       super.pushAction(orient);
       if(orient.getResult() < 0){
         lower.add(p);
       }
       else if(orient.getResult()>0){
         upper.add(p);
       }
       else if(!(p == p1 || p == p2)){
         super.pushAction(new DeletePoint(p));
       }
     }
     
     qHull(p2, p1, upper, 2);
     qHull(p1, p2, lower, 1);
     super.actions.add(new CompleteHull(hull));    
    
  }
  
  
  private void qHull(Point a, Point b, ArrayList<Point> points, Integer pos){
    
    Point selected = points.get(0);
    float thres = 0;
    
    for(Point p: points){
      Orientation orient = new Orientation(a, b, p);
      super.pushAction(orient);
      if(orient.getResult() < thres){
        thres = orient.getResult();
        selected = p;
      }
    }
    super.pushAction(new AddHullPoint(hull, selected, pos));


    ArrayList<Point> left = new ArrayList<Point>();
    ArrayList<Point> right= new ArrayList<Point>();
    for(Point p:points){
     Orientation orientA = new Orientation(a, selected, p);
     super.actions.add(orientA);
     Orientation orientB = new Orientation(selected, b, p);
     super.actions.add(orientB);
     if(orientA.getResult() < 0){
       left.add(p);
     }
     else if(orientB.getResult() < 0){
       right.add(p);
     }
     else if(!(p == selected)){
       super.pushAction(new DeletePoint(p));
     }
    }
    
    if(right.size() > 0){
      qHull(selected,b,right,pos+1);
    }
    if(left.size() > 0){
      qHull(a,selected,left,pos);
    }

    
    
  }
}
