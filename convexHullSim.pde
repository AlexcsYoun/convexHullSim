import java.util.Random;

ArrayList<Point> points;
Random rand;
int nPoints = 100;
int iter = 0;

int screenSize = 600;



ConvexHullAlgorithm alg;
void settings(){
  size(screenSize,screenSize);
}

void setup(){
  
  rand = new Random();
  
  background(0,0,0);
  points = new ArrayList<Point>();
  
  
  PVector centre = new PVector((float)width/2, (float)height/2);
  for( int i =0; i< nPoints; i++){
    strokeWeight(8);
    stroke(255);
    float mag = rand.nextInt(width) *0.45;
    PVector np = PVector.random2D().mult(mag);
    np = np.add(centre);
    // note y axis is reversed so orientation is maintained
    point(np.x,np.y);
    points.add(new Point(np.x, np.y));
  }
  
  for(Point p: points){
    System.out.println(String.format("x: %f y: %f", p.getPos().x, p.getPos().y));
  }
 
   
  alg = new QuickHull();
  frameRate(20);
  
  alg.execute(points);
  
}


void draw(){
  background(0,0,0);
  alg.render();
  renderPoints();
  

}
void renderPoints(){
  for(Point p: points){
    p.render();   
  }
}

SoundFile generateSound(String filePath){
  return new SoundFile(this, filePath);
}


void Beep(float freq){
  TriOsc sine = new TriOsc(this);
  Env env = new Env(this);
  sine.play(freq,0.5);
  env.play(sine,0.025,0.1,0.9,0.3);
}
