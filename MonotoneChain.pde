import java.util.Collections;
import java.util.Comparator;

class MonotoneChain extends ConvexHullAlgorithm{
    
  MonotoneChain(){
    super("Monotone Chain");
  }
  
  @Override
  public void execute(ArrayList<Point> points){
    Comparator sort = new LexicographicalSort();
    Collections.sort(points, sort);
    
    
  }
  
}
