static class Physics{
 
   static void applyForce(PVector f , Body b){
     
     // Newtons 2 law. F = M*A
     b.acceleration.add(PVector.div(f,1));
  }
  
  static float calVel(PVector displacement , int finalTime){
   
   float sec = finalTime / 1000;
   float cm = displacement.mag()/ pixelFactor;
     
   float vel = cm / sec;
   return vel;
  }
  
}
