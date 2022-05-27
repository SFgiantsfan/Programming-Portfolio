class Rock {
  int x, y, diam, speed, health, rand;
  PImage rock;

  // Member Methods
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(1, 5));
    diam = int(random(45, 65));
    health = diam/4;
    rand = int(random(3));
    if (rand == 0) {
      rock = loadImage("rock1.png");
    } else if(rand == 1) {
      rock = loadImage("rock2.png");
    } else {
      rock = loadImage("rock3.png");
    }
    
  }

  void display() {
    // Rock
    fill(255);
    stroke(59);
    rock.resize(diam,diam);
    //ellipse(x, y, diam, diam);
    //quad();
    textAlign(CENTER, CENTER);
    textSize(8);
    fill(255);
    text(diam, x, y);
    imageMode(CENTER);
    image(rock,x,y);
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
