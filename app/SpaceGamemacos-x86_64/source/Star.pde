class Star{
  // Member variables
  int x,y,diam,speed;
  
  // Constructor
  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(1,5));
    speed = int(random(1,5));
  }
 
  // Member Methods
  void display() {
    fill(int(random(200,255)),int(random(200,255)),10);
    ellipse(x,y,diam,diam);
  }
  
  void move() {
    y+=speed;
  }
  
  boolean reachedBottom() {
    if(y>height+10) {
      return true;
    } else{
      return false;
    }
  }
}
