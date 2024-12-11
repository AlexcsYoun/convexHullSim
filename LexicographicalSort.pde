import java.util.Comparator;

class LexicographicalSort implements Comparator<Point>{
  public int compare(Point left, Point right){
    PVector l = left.getPos();
    PVector r = right.getPos();
    
    if(l.x == r.x && l.y == r.y){
      return 0;
    }
    
    if(l.x < r.x){
      return -1;
    }
    else{
      if(l.x == r.x && l.y > r.y){
        return -1;
      }
      return 1;
    }
  }
}
