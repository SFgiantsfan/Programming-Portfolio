class Laser {
  int x, y, diam, speed;

  // Member Methods
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 8;
    diam = 3;
  }

  void display() {
    rectMode(CENTER);
    fill(255, 0, 0);
    noStroke();
    rect(x, y, diam, speed);
    //rect(x-20, y, diam, speed);
  }

  void move() {
    y-=speed;
  }
  boolean reachedTop() {
    if(y<-10) {
      return true;
    } else{
      return false;
    }
  }

  boolean intersect(Rock r) {
    float distance = dist(x,y,r.x,r.y);
    if(distance < 30) {
      return true;
    } else {
      return false;
    }
  }
}
