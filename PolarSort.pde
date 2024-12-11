import java.util.Comparator;

class PolarSort implements Comparator<Point>{
  private Point origin;
  private ConvexHullAlgorithm alg;

  PolarSort(Point origin, ConvexHullAlgorithm alg){
    this.origin = origin;
    this.alg = alg;
  }
  
  public int compare(Point left, Point right){
     if(left == origin){
       return -1;
     }
     if(right == origin){
       return 1;
     }
     
     
     Orientation orient = new Orientation(origin, left, right);
     alg.pushAction(orient);
     
     if(orient.getResult() == 0){
       PVector l = PVector.sub(left.getPos(),origin.getPos());
       PVector r = PVector.sub(right.getPos(),origin.getPos());
       
       return (l.magSq() < r.magSq()) ? -1 : 1;
    
     }
     
     return (orient.getResult() > 0) ? 1: -1;
     
  }
}
