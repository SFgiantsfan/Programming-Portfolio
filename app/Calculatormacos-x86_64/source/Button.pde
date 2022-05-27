class Button{
  // Member Variables
  float x,y,w,h;
  boolean on;
  String val;
  color c1, c2;
  
  // Constructor
  Button(float tempX, float tempY, float tempW, float tempH, String tempVal, color tempC1, color tempC2) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    c1 = tempC1;
    c2 = tempC2;
    on = false; // Button always starts as off
  }
  
  // Display Method
  void display() {
    if(on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x,y,w,h,5);
    fill(0);
    textAlign(LEFT);
    if(val.equals("sin")){
      text(val,x+3,y+15);
    } else if(val.equals(".")){
      text(val,x+8,y+12);
    } else if(val.equals("|x|")){
      text(val,x+4.5,y+14);
    } else if(val.equals("x")){
      text(val,x+8,y+14);
    } else if(val.equals("-")){
      text(val,x+8,y+14);
    } else{
      textSize(13);
      text(val,x+7,y+15);
    }
  }
  
  // Rollover Method
  void hover(int mx, int my) {
    on = (mx<x+w && mx>x && my>y && my<y+h);
  }
}
