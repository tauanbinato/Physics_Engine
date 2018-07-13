class Body {
 
  private float mass , rad;
  private PVector location, acceleration, velocity;
  public  PVector b_rgb;
  String shape;
  
  Body(String _shape, PVector rgb, PVector loc , float mass){
    
    acceleration = new PVector();
    velocity     = new PVector();
    b_rgb        = new PVector();
    this.b_rgb = rgb.copy();
    this.mass = mass;
    this.location = loc;
    this.rad = mass;
    this.shape   = _shape.toLowerCase();;
  }
  
  void display(){
    
    if (shape.equals("rect")) {
        fill(b_rgb.x,b_rgb.y,b_rgb.z);
        rect(location.x,location.y, mass * 1.2, mass * 1.2);
      } 
      else if (shape.equals("circle")) {
        ellipse(location.x,location.y, mass * 1.2, mass * 1.2);
      } 
      else {
      // default
        ellipse(location.x,location.y, mass * 1.2, mass * 1.2);
       
      }
    
    
  }
  
  private void stopMove(){
    velocity.mult(0);
  }
  
  void move(){
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    //checkBounce();
     
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
  
  
  if (location.y + (rad+3) > height) {
     
    
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
