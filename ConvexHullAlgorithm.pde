abstract class ConvexHullAlgorithm implements Runnable{
  
  private ArrayList<Hull> hulls = new ArrayList<Hull>();
  private int comparisons = 0;
  private String name;
  
  private ArrayList<Runnable> steps;
  private int backStep = -1;
  private int frontStep = 0;
  
  
  ConvexHullAlgorithm(String name){
    steps = new ArrayList<Runnable>();
    this.name = name;
  }
  
  public String toString(){
    return name;
  }
  
  public void setHulls(ArrayList<Hull> hulls){
    this.hulls = hulls;
  }
  
  public void addHull(Hull hull){
    hulls.add(hull);
  }
  
  public ArrayList<Hull> getHulls(){
    return hulls;
  }
  
  public abstract void execute(ArrayList<Point> points);
  

  public void pushAction(Action step){
    steps.add(step);
  }

  
  public void pushAction(ArrayList<Action> steps){
    this.steps.addAll(steps);
  }
  
  public void pushAlgorithm(ConvexHullAlgorithm alg){
  }
  
  public boolean forward(){
    if(frontStep < steps.size()){
      backStep = frontStep;
      
      Runnable step = steps.get(frontStep);
      boolean fin = step.forward();
      
      if(fin){frontStep++;}  
    }
    
    return frontStep >= steps.size();
    
  }
  
  public boolean backward(){
    if(backStep >= 0){
        frontStep = backStep;
        Runnable step = steps.get(backStep);
        boolean fin = step.backward();
        if(fin){backStep++;}
    }
    return backStep < 0;
  }
  
  public void render(){
    for(Hull h: hulls){
      h.render();
    }
    if(backStep > 0){
      Runnable step = steps.get(backStep);
      step.render();
    }
  }
  
  public void reset(){
    for(Hull h: hulls){
      h.reset();
    }
    backStep =-1;
    frontStep = 0;// time travel doesn't reset output of finished() and started() of steps
  }
  
    
  protected void incrementOperations(){
    comparisons++;
  }
  
  public int getOperations(){
    return comparisons;
  }
  
  
}
