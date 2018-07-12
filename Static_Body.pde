class Static_Body{
  
  private PVector location, size;
  
  
  Static_Body(Shape shape, PVector loc , PVector size){
    
    location = new PVector();
    size = new PVector();
    this.location = loc.copy();
    this.size = size.copy();
    
    display(shape);
  }
  
  void display(Shape shape){
    
    switch(shape){
      
      case rect:
        rect(location.x,location.y, this.size.x , this.size.y);
        break;
        
      case circle:
        ellipse(location.x,location.y, this.size.x , this.size.y);
        break;
        
      default:
        ellipse(location.x,location.y, this.size.x , this.size.y);
        println("Default!");
        break;
    
  }
  
  
}
}
