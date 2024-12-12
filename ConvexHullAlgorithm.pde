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
    int i = nextAction % actions.size();
    Action curAct = actions.get(i);
    curAct.render();
  
  }
  
    
  protected void incrementOperations(){
    comparisons++;
  }
  
  public int getOperations(){
    return comparisons;
  }
  
  
}
