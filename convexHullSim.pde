import java.util.Random;
ArrayList<Point> points;
Random rand;
int nPoints = 100;
int iter = 0;
void setup(){
  rand = new Random();
  size(600,600);
  background(0,0,0);
  points = new ArrayList<Point>();
  nPoints = 100;
  
  for( int i =0; i< nPoints; i++){
    strokeWeight(8);
    stroke(255);
    int x = rand.nextInt((int)(width*0.9)) + (int)(width*0.05);
    int y = rand.nextInt((int)(height*0.9))+ (int)(height*0.05);
    // note y axis is reversed so orientation is maintained
    point(x,y);
    points.add(new Point(x,y));
    
  }
  
  for(Point p: points){
    System.out.println(String.format("x: %f y: %f", p.getPos().x, p.getPos().y));
  }
   
  Orientation orientTest = new Orientation(points.get(0), points.get(1), points.get(2));
  orientTest.render();
  
}


void draw(){
  background(0,0,0);
  renderPoints();
  Orientation orientTest = new Orientation(points.get(0), points.get(1), points.get(iter));
  orientTest.render();
  iter += 1;
  iter %= nPoints;
  
}
void renderPoints(){
  for(Point p: points){
    p.render();   
  }
}
