class Body {
 
  private float mass , rad , b_width , b_height;
  private PVector location, acceleration, velocity;
  public  PVector b_rgb;
  String shape;
  
  Body(String _shape, PVector rgb, PVector loc , float mass){
    
    acceleration = new PVector();
    velocity     = new PVector();
    b_rgb        = new PVector();
    this.b_rgb   = rgb.copy();
    this.mass    = mass * MASS_MULT;
    this.location = loc;
    this.rad = mass/2;
    this.shape    = _shape.toLowerCase();;
  }
  
  void display(){
    
    if (shape.equals("rect")) {
        fill(b_rgb.x,b_rgb.y,b_rgb.z);
        rect(location.x,location.y, mass, mass);
        this.b_width = mass;
        this.b_height = mass;
      } 
      else if (shape.equals("circle")) {
        ellipse(location.x,location.y, mass, mass );
        this.b_width = mass;
        this.b_height = mass;
      } 
      else {
      // default
        ellipse(location.x,location.y, mass, mass);
        this.b_width = mass;
        this.b_height = mass;
       
      }
    
    
  }
  
  private void stopMove(){
    velocity.mult(0);
  }
  
  void move(){
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkBounce();
     
  }
  
  private void checkBounce(){
    
    // Test to see if the shape exceeds the boundaries of the screen
    // If it does, reverse its direction by multiplying by a negative number lower then 1.
  if (location.x + b_width > width || location.x < 0) {
     
    location.x = width - b_width;
     
     if(velocity.mag() > 0.5){
       velocity.x *= -0.95;
     }
     else
     {
       stopMove();
       //Physics.applyForce(normal,ball);
     }
  }
  
  
  if (location.y + b_height > height) {
     
    
    location.y = height - b_height;
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
