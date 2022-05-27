class PowerUp {
  int x, y, diam, speed, rand;
  char type;
  PImage pu;

  // Member Methods
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(1, 7));
    diam = int(random(40, 60));
    rand = int(random(3));
    if (rand == 0) {
      type = 'l';
      pu = loadImage("laserCount.png"); // increase laser count
    } else if (rand == 1) {
      type = 'h';
      pu = loadImage("health.png"); // increase ship health
    } else {
      type = 't';
      pu = loadImage("turret1.png"); // increases turret count
    }
  }
  void display() {
    // Rock
    fill(255);
    stroke(59);
    pu.resize(diam, diam);
    //rock.resize(diam,diam);   
    imageMode(CENTER);
    image(pu,x,y);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Spaceship s) {
    float distance = dist(x, y, s.x, s.y);
    if (distance < diam/2 + s.w) {
      return true;
    } else {
      return false;
    }
  }
}
