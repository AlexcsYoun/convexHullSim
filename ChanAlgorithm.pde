class ChanAlgorithm extends ConvexHullAlgorithm{
  ChanAlgorithm(){
    super("Chan's\nAlgorithm");
  }
  
  public void execute(ArrayList<Point> points){
    Point origin = points.get(0);
    for(Point p: points){
      if(p.bottomPoint(origin)){
        origin = p;
      }
    }
    calcHull(origin, 20);
  }
  
  public void calcHull(Point bottom, int m){
    ArrayList<Hull> hulls = new ArrayList<Hull>();
    ArrayList<ArrayList<Point>> miniHulls = new ArrayList<ArrayList<Point>>();
    
    for(int i = 0; i < points.size(); i+= m){
      ArrayList<Point> partition = new ArrayList(points.subList(i,min(i+m, points.size())));
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
        miniHulls.add(results);
       
      }
      else{
        GrahamScan gScan = new GrahamScan();
        gScan.execute(partition);
        super.pushAlgorithm(gScan);
        miniHulls.add(gScan.getResult());
      }
    }
    
  }
  
  public Point nextPoint(Point prev, ArrayList<Point> miniHull){
    
  }
}
