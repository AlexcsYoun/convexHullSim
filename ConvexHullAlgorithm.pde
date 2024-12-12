abstract class ConvexHullAlgorithm{
  
  private int comparisons = 0;
  private String name;
  
  protected ArrayList<Action> actions;
  private int nextAction = 0;
  
  ConvexHullAlgorithm(String name){
    actions = new ArrayList<Action>();
    this.name = name;
  }
  
  public String toString(){
    return name;
  }
  
  public abstract void execute(ArrayList<Point> points);
  
  public void pushAction(Action action){
    actions.add(action);
  }
  
  public void render(){
    if(nextAction < actions.size()){
      Action curAct = actions.get(nextAction);
      curAct.simulate();
      nextAction++;
    }
    
  };
    
  protected void incrementOperations(){
    comparisons++;
  }
  
  public int getOperations(){
    return comparisons;
  }
  
  
}
