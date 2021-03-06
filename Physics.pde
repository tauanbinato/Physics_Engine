static class Physics{
 
   static void applyForce(PVector f , Body b){
     
     // Newtons 2 law. F = M*A
     b.acceleration.add(PVector.div(f,b.mass));
  }
  
  static float calVel(PVector displacement , int finalTime){
   
   float sec = finalTime / 1000;
   float cm = displacement.mag()/ pixelFactor;
     
   float vel = cm / sec;
   return vel;
  }
  
  
  private static void performImpact(Body b){
    
    if(b.velocity.mag() > 0.5){
       b.velocity.y *= -0.95;
     }
     else
     {
       b.stopMove();
       applyForce(normal,b);
     }
    
  }
  
  static boolean checkCollisionStatic(Body b , Static_Body sb){
    
    String sb_shape = sb.shape.toLowerCase();
    String b_shape = b.shape.toLowerCase();
    
    switch(sb_shape){
     
      case "rect":
        
        switch(b_shape){
          
          case "rect":
          break;
          
          case "circle":
            
            float testX = b.location.x, testY = b.location.y;
            if (b.location.x < sb.location.x)
                testX = sb.location.x;                    // left edge
            else if (b.location.x > sb.location.x + sb.size.x) 
                testX = sb.location.x + sb.size.x;        // right edge

            if (b.location.y < sb.location.y)
                testY = sb.location.y;                    //  top edge
            else if (b.location.y > sb.location.y + sb.size.y) 
                testY = sb.location.y + sb.size.y;        // bottom edge
          
            float distX = 0 , distY = 0;
            distX = b.location.x - testX;
            distY = b.location.y - testY;
            float distance = sqrt( (distX*distX) + (distY*distY) );
         
            if(distance <= b.b_height){
               performImpact(b);
               return true;
            }else {
               return false;
            }
          
        }
      
      break;
      
      case "circule":
      
        switch(b_shape){
          
          case "rect":
          break;
          
          case "circle":  
          break;
        }
      
      break;
    }
    
    return true;
  }
  
}
