abstract class Action implements Runnable{
  
  
  public abstract void next();
  public abstract void back();
  
  @Override
  public boolean forward(){
    next();
    return true;
  }
  
  @Override
  public boolean backward(){
    back();
    return false;
  }
  
}
