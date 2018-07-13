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
  
   private static float calDistance(PVector distPoint , PVector objLocation){
    
    float result = 0;
    return  result = PVector.dist(distPoint,objLocation);
    
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
            
            PVector testEdge = new PVector();
            if (b.location.x < sb.location.x)
                testEdge.x = sb.location.x;                    // left edge
            else if (b.location.x > sb.location.x + sb.size.x) 
                testEdge.x = sb.location.x + sb.size.x;        // right edge

            if (b.location.y < sb.location.y)
                testEdge.y = sb.location.y;                    //  top edge
            else if (b.location.y > sb.location.y + sb.size.y) 
                testEdge.y = sb.location.y + sb.size.y;        // bottom edge
          
            PVector dist = new PVector();
            dist.x = b.location.x - testEdge.x;
            dist.y = b.location.y - testEdge.y;
            
            if(calDistance(dist,b.location) <= b.rad){
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
