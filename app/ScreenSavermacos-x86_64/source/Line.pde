class Line {
  // Member variables
  float xpos, ypos, strokeW, pointCount;

  // Constructor
  Line(float tempX, float tempY) {
    xpos = tempX;
    ypos = tempY;
  }

  // Display Method
  void display() {
    if (frameCount>2000) {
      frameCount = 0;
      background(random(255));
    } else {
      strokeW = random(1,10);
      pointCount = random(10,40);
      stroke(random(20), random(255), random(200));
      strokeWeight(strokeW);
      int rand = int(random(4));
      if (xpos<0 || xpos>width || ypos<0 || ypos>height) {
        xpos = random(width);
        ypos = random(height);
      } else {
        if (rand == 0) {
          moveRight(xpos, ypos, pointCount);
        } else if (rand == 1) {
          moveUp(xpos, ypos, pointCount);
        } else if (rand == 2) {
          moveLeft(xpos, ypos, pointCount);
        } else {
          moveDown(xpos, ypos, pointCount);
        }
      }
    }
  }

  // Movement methods
  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX-i;
      ypos = startY;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY+i;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY-i;
    }
  }
}
// Blueprint
