import java.util.Random;
import java.util.LinkedList;

ArrayList<Point> points;
Random rand;
int nPoints = 100;
int iter = 0;
Boolean distanceVary = true;


int screenSize = 600;

Pulse beep = new Pulse(this);
int beepTime = 0;


LinkedList<Particle> particles = new LinkedList<Particle>();


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
    float mag = distanceVary ?  rand.nextInt(width) *0.45 : width * 0.45;
    PVector np = PVector.random2D().mult(mag);
    np = np.add(centre);
    // note y axis is reversed so orientation is maintained
    point(np.x,np.y);
    points.add(new Point(np.x, np.y));
  }
  
  for(Point p: points){
    System.out.println(String.format("x: %f y: %f", p.getPos().x, p.getPos().y));
  }
  Sound.volume(0.1);
  alg = new JarvisMarch();
  frameRate(120);
  beep.amp(0.1);  
  alg.execute(points);
  
}


void draw(){
  if(millis() > beepTime){
    beep.stop();
  }
  else{
    beep.play();
  }
  background(10,10,10);
  alg.render();
  renderPoints();
  renderParticles();
  

}
void renderPoints(){
  for(Point p: points){
    p.render();   
  }
}

void renderParticles(){
  while(!particles.isEmpty() && !particles.peek().alive()){
    particles.removeFirst();
  }
  
  for(Particle p: particles){
    p.render();
  }
}

SoundFile generateSound(String filePath){
  return new SoundFile(this, filePath);
}


void Beep(float freq,int time){
  beepTime = time + millis();
  beep.freq(freq);
}
