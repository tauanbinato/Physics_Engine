class Body {
 
  float mass , speed , rad;
  PVector location, acceleration, velocity;
  
  Body(PVector loc , float mass){
    
    this.mass = mass;
    rad = mass;
    
    speed = 0.0;
    location = loc;
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
  }
  
  void display(){
    ellipse(location.x,location.y,mass * 1.5, mass * 1.5);
  }
  
  private void stopMove(){
    velocity.mult(0);
  }
  
  void move(){
    
    velocity.add(acceleration);
    location.add(velocity);
    println(location);
    acceleration.mult(0);
    checkBounce();
    
     
  }
  
  private void checkBounce(){
    
    // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (location.x > width - rad || location.x < 0) {
     
    location.x = height - rad;
     
     if(velocity.mag() > 0.5){
       velocity.x *= -0.95;
       
     }
     else
     {
       stopMove();
       //Physics.applyForce(normal,ball);
     }
  }
  if (location.y + rad > height) {
     
    
    location.y = height - rad;
     if(velocity.mag() > 0.5){
       velocity.y *= -0.95;
 
     }
     else
     {
       stopMove();
       Physics.applyForce(normal,ball);
     }
     
     
      
    
     
  }
    
  }
  
}
