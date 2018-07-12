//Globals
Body ball = new Body(new PVector(100f,100f) , 50f);
//Forces
PVector gravity = new PVector(0,1f);
PVector drag = new PVector(0.5,-0.2f);
static float pixelFactor;

void calPixelToCm(){
 
  pixelFactor = height/23;
  
}

void setup() {
  calPixelToCm();
  ellipseMode(RADIUS);
  size(800, 600); 
}

void draw() {
  int m = millis();
  background(0);
  Physics.applyForce(gravity,ball);
  //Physics.applyForce(drag,ball);
  ball.display();
  ball.move();
  
  
  
  //Physics.applyForce(airResistance,ball);
  //println(Physics.calVel(ball.location,m) + " cm/seg");
}
