class ChanAlgorithm extends ConvexHullAlgorithm{
  ChanAlgorithm(){
    super("Chan's Algorithm");
  }
  
  public void execute(ArrayList<Point> points){
  }
  
  public void calcHull(int m){
    ArrayList<Hull> hulls = new ArrayList<Hull>();
    ArrayList<ArrayList<Point>> miniHulls = new ArrayList<ArrayList<Point>>();
    
    for(int i = 0; i < points.size(); i+= m){
      ArrayList<Point> partition = new ArrayList(points.subList(i,min(i+m, points.size()-1)));
      Hull hull;
      ArrayList<Point> results;
      if(partition.size() < 3){
        hull = new Hull(true);
        results = new ArrayList<Point>();
        super.addHull(hull);
        for(Point p: partition){
          super.pushAction(new AddHullPoint(hull, p));
          results.add(p);
        }
       
      }
      else{
        GrahamScan gScan = new GrahamScan();
        gScan.execute(partition);
      }
    }
  }
}
