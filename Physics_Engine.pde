//Globals
Body ball;
Static_Body floor;
float MASS_MULT = 1.2f;

//Forces
static PVector gravity = new PVector(0,90f);
static PVector normal = gravity.copy().mult(-1f);
PVector wind = new PVector(5f,-0.0f);
static float pixelFactor;

void calPixelToCm()
{
  pixelFactor = height/23;
}

void setup() {
  //Initial Functions
  calPixelToCm();
  
  //Changing some modes
  ellipseMode(RADIUS);
  
  //Setting the screen
  size(800, 800);
  
  //Initializing Bodies
  ball  = new Body("Circle",new PVector(255,0,0),new PVector(100f,300f) , 50f);
  floor = new Static_Body("Rect", new PVector(0,float(height - 100)),new PVector(float(width),30));
}

void draw() {
  int m = millis();
  background(0);
  floor.display();
  Physics.applyForce(gravity,ball);
  //Physics.applyForce(wind,ball);
  
  if(Physics.checkCollisionStatic(ball,floor)){
    
  }

  ball.display();
  ball.move();
  
  
  
  
  //println(Physics.calVel(ball.location,m) + " cm/seg");
}
