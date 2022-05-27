class Spaceship {
  // Member variables
  int x, y, w, health, laserCount, diam, turret;
  //PImage ship;

  // Constructor
  Spaceship() {
    x = 0;
    y = 0;
    w = 50;
    diam = 25;
    laserCount = 501;
    turret=1;
    health = 100;
    //ship = loadImage("Ship.png");
  }

  // Member Methods
  void display(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    //imageMode(CENTER);
    //ship.resize(80,80);
    //image(ship,x,y);
    stroke(255);
    rectMode(CENTER);
    // turrets
    fill(255, 0, 0);
    rect(x-20.5, y, 5, 80);
    rect(x+20, y, 5, 80);
    // wings
    fill(0, 255, 0);
    triangle(x, y, x+50, y+40, x-50, y+40);
    // thrusters
    fill(0, 0, 255);
    ellipse(x-20, y+25, 15, 35);
    ellipse(x+20, y+25, 15, 35);
    // fuselage
    fill(255, 100, 0);
    ellipse(x, y, 25, 80);
    // windows
    fill(0, 150, 200);
    ellipse(x, y-20, 20, 10);
  }


  boolean fire() {
    if (laserCount>0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float distance = dist(x,y,r.x,r.y);
    if(distance < w/2 + r.diam) {
      return true;
    } else {
      return false;
    }
  }
}
