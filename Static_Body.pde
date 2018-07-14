class Static_Body{
  
  PVector location, size;
  String shape;
  
  Static_Body(String _shape, PVector _location , PVector _size){
    
    location = new PVector(0,0);
    size = new PVector(0,0);
    this.location = _location.copy();
    this.size = _size.copy();
    this.shape = _shape.toLowerCase();;
  }
  
  
   void display(){
      
      if (shape.equals("rect")) {
        fill(255);
        rect(location.x,location.y, size.x , size.y);
      } 
      else if (shape.equals("rircle")) {
        fill(255);
        ellipse(location.x,location.y, size.x , size.y);
      } 
      else {
      // default
        fill(255);
        ellipse(location.x,location.y, size.x , size.y);
       
      }
      
     
    
  }
  
  
}
