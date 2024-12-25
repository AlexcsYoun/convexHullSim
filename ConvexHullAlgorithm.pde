abstract class ConvexHullAlgorithm{
  
  private ArrayList<Hull> hulls = new ArrayList<Hull>();
  private int comparisons = 0;
  private String name;
  
  private ArrayList<Action> actions;
  private int nextAction = 0;
  
  
  
  ConvexHullAlgorithm(String name){
    actions = new ArrayList<Action>();
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
  
  public void addHull(ArrayList<Hull> hulls){
    this.hulls.addAll(hulls);
  }
  
  public ArrayList<Hull> getHulls(){
    return hulls;
  }
  public abstract void execute(ArrayList<Point> points);
  
    
  public ArrayList<Action> getActions(){
    return actions;
  }
  
  public void pushAction(Action action){
    actions.add(action);
  }
  
  public void pushAction(ArrayList<Action> actions){
    this.actions.addAll(actions);
  }
  
  public void pushAlgorithm(ConvexHullAlgorithm alg){
    pushAction(alg.getActions());
    addHull(alg.getHulls());
  }
  
  public void forward(){
    if(nextAction < actions.size()){
      Action nextAct = actions.get(nextAction);
      nextAct.forward();
      nextAction++;
    }    
  }
  
  public void backward(){
    if(nextAction > 0){
        Action curAct = actions.get(nextAction-1);
        curAct.backward();
        nextAction--;      
    }
  }
  
  public void render(){
    for(Hull h: hulls){
      h.render();
    }
    if(nextAction > 0){
      int i = nextAction-1;
      Action curAct = actions.get(i);
      curAct.render();
    }
  }
  
  public void reset(){
    for(Hull h: hulls){
      h.reset();
    }
    nextAction = 0;
  }
  
    
  protected void incrementOperations(){
    comparisons++;
  }
  
  public int getOperations(){
    return comparisons;
  }
  
  
}
