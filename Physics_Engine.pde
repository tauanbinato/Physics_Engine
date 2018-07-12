//Globals
Body ball = new Body(new PVector(100f,700f) , 50f);
Static_Body floor = new Static_Body("Rect", new PVector(0,700),new PVector(800,30));

//Forces
PVector gravity = new PVector(0,50f);
PVector normal = gravity.copy().mult(-1f);
PVector wind = new PVector(0.5f,-0.0f);
static float pixelFactor;

void calPixelToCm(){
 
  pixelFactor = height/23;
  
}

void setup() {
  calPixelToCm();
  ellipseMode(RADIUS);
  size(800, 800); 
}

void draw() {
  int m = millis();
  background(0);
  floor.display();
  Physics.applyForce(gravity,ball);
 // Physics.applyForce(wind,ball);
  
  ball.display();
  ball.move();
  
  
  
  
  //println(Physics.calVel(ball.location,m) + " cm/seg");
}
