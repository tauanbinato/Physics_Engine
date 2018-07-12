class Body {
 
  float mass , b_width , b_height , speed , rad;
  PVector location, acceleration, velocity;
  
  Body(PVector loc , float mass){
    
    this.mass = mass;
    b_width = mass;
    b_height = mass;
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
    acceleration.mult(0);
    checkBounce();
    println("Velocity: " + velocity);
    println("Mag: " + velocity.mag());
     
  }
  
  private void checkBounce(){
    
    // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (location.x > width - rad || location.x < 0) {
     velocity.x *= -0.95;
     if(velocity.x < 0){
       location.x = width - rad;
       if(velocity.x > -0.5 && velocity.x < 0.5 ){
       velocity.x=0; 
      }
     }
  }
  if (location.y > height - rad || location.y < 0) {
     
     if(velocity.mag() > 0.5){
       println("ENTROU");
       velocity.y *= -0.95;
       location.y = height - rad;
     }else{
       stopMove();
     }
     
     
      
    
     
  }
    
  }
  
}
