class MergeHull extends ConvexHullAlgorithm{
  
  private ArrayList<Hull> hulls = new ArrayList<Hull>();
  
  MergeHull(){
    super("MergeHull");
  }
  
  public void execute(ArrayList<Point> points){
    Collections.sort(points);
    
  
  }
  
  private Hull merge(ArrayList<Point> points){
    
  }
}
