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

PFont titleFont; 

boolean running = true;

boolean spaceHeld = false;

void settings(){         
  size(screenSize,screenSize);
}

void setup(){
  titleFont = loadFont("IBMPlexMono-Bold-48.vlw");
  rand = new Random();
  
  background(250,250,250);
  points = new ArrayList<Point>();
  
  
  PVector centre = new PVector((float)width/2, (float)height/2);
  for( int i =0; i< nPoints; i++){

    float mag = distanceVary ?  rand.nextInt(width) *0.45 : width * 0.45;
    PVector np = PVector.random2D().mult(mag);
    np = np.add(centre);
    // note y axis is reversed so orientation is maintained
    points.add(new Point(np.x, np.y));
  }
  
  for(Point p: points){
    System.out.println(String.format("x: %f y: %f", p.getPos().x, p.getPos().y));
  }
  Sound.volume(0.1);
  alg = new MonotoneChain();
  frameRate(120);
  beep.amp(0.07);  
  alg.execute(points);
  
}


void draw(){

  
  if(millis() > beepTime){
    beep.stop();
  }
  else{
    beep.play();
  }

  if(running){
    alg.forward();
  }
  background(250,250,250);
  renderTitle();
  alg.render();
  renderPoints();
  renderParticles();
  

}

void keyPressed(){
  if(key == ' '){
    if(!spaceHeld){
      running = !running;
      spaceHeld = true;
    }
    
  }
  if(key == CODED){
    if(keyCode == LEFT){
      running = false;
      alg.backward();
    }
    if(keyCode == RIGHT){
      running = false;
      alg.forward();
    }
  }
}


void keyReleased(){
  if(key == ' '){
    spaceHeld = false;
  }
}




void renderTitle(){
  textFont(titleFont,64);
  fill(220,200);
  textAlign(CENTER, CENTER);
  text(alg.toString(),width/2,height/2);
  fill(255,255);
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
