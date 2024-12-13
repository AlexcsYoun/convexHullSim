import java.util.Arrays;
import java.util.LinkedList;

class IncrementalConvexHull extends ConvexHullAlgorithm{
  
  private Hull hull = new Hull(true);
  IncrementalConvexHull(){
    super("Incremental\nConvex Hull");
    super.addHull(hull);
  }
  
  public void execute(ArrayList<Point> points){
    Collections.sort(points);
    
    LinkedList<Point> constructHull = new LinkedList<Point>();
    Orientation baseCase = new Orientation(points.get(0), points.get(1), points.get(2));
    super.pushAction(baseCase);

    if(baseCase.getResult() == 0){
      throw new RuntimeException("Collinear points not allowed");
    }
    
    ArrayList<Integer> seq = new ArrayList<Integer>((baseCase.getResult() < 0) ? Arrays.asList(0,1,2): Arrays.asList(1,0,2));
    
    for(int i: seq){
        System.out.println(((Integer)i).toString());
        constructHull.addLast(points.get(i));
        super.pushAction(new AddHullPoint(hull, points.get(i)));
    }
    
    for(int i = 3; i < points.size(); i++){
      Point p = points.get(i);
      Point right = constructHull.peekLast();
      
      boolean stay;
      Point b = right, t = right;
      
      stay = true;
      do {
        
        Orientation orient = new Orientation(p, b, constructHull.getFirst());
        super.pushAction(orient);
        if(orient.getResult() >= 0){
          b = constructHull.removeFirst();
          super.pushAction(new PopHullPoint(hull, 0));
        }
        else{
          stay = false;
        }
      }
      while(stay);
      constructHull.addFirst(b);
      super.pushAction(new AddHullPoint(hull, b, 0));
      
      constructHull.removeLast();
      super.pushAction(new PopHullPoint(hull));
      stay = true;
      do {
        Orientation orient = new Orientation(t, p, constructHull.getLast());
        super.pushAction(orient);
        if(orient.getResult() >= 0){
          t = constructHull.removeLast();
          super.pushAction(new PopHullPoint(hull));
        }
        else{
          stay = false;
        }
      }
      while(stay);
      
      
      constructHull.addLast(t);
      constructHull.addLast(p);
      
      super.pushAction(new AddHullPoint(hull, t));
      super.pushAction(new AddHullPoint(hull, p));
    }
    
    
    super.pushAction(new CompleteHull(hull));
    

    
  }
  
}
