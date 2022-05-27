Spaceship s1;
import processing.sound.*;
SoundFile laser;
Star[] stars = new Star[100];
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
int score, level, rockTime, rockCount;
boolean play;
Timer rockTimer, puTimer;
PImage startScreen, gameOver;



void setup() {
  size(1000, 1000);
  laser = new SoundFile(this, "Flash-laser-03.wav");
  s1 = new Spaceship();
  rockCount = 0;
  play = false;
  score = 0;
  level = 1;
  rockTime = 1000;
  play = false;
  startScreen = loadImage("start.png");
  gameOver = loadImage("gameOver.png");
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  rockTimer = new Timer(rockTime);
  rockTimer.start();
  puTimer = new Timer(10000);
  puTimer.start();
}

void draw() {
  background(0);
  noCursor();

  // Check to see if play = true
  if (!play) {
    startScreen();
  } else {
    if (frameCount % 1000 == 10) {
      level ++;
    }

    infoPanel();
    //render stars
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
      stars[i].move();
      if (stars[i].reachedBottom()) {
        stars[i].y=-10;
      }
    }

    // Adding a rock based on the rock timer
    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      rockTimer.start();
    }

    // Add timer finished for powerup
    if (puTimer.isFinished()) {
      powerUps.add(new PowerUp(int(random(width)), -50));
      puTimer.start();
    }

    // Render powerup and detect ship collision
    for (int i = 0; i<powerUps.size(); i++) {
      PowerUp pu = powerUps.get(i);
      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powerUps.remove(pu);
      }
      if (pu.intersect(s1)) {
        if (pu.type == 'h') {
          s1.health+=100;
        } else if (pu.type == 'l') {
          s1.laserCount+=100;
        } else if (pu.type == 't') {
          s1.turret++;
        }
        powerUps.remove(pu);
      }
    }

    // Render Rocks and detect ship collision
    for (int i = 0; i<rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (rock.reachedBottom()) {
        rockCount++;
        rocks.remove(rock);
      }
      if (rock.intersect(s1)) {
        rocks.remove(rock);
        s1.health-=rock.health;
        score+=rock.health/2;
      }
    }

    //Render Lasers and detect rock collision
    for (int i = 0; i<lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j<rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          lasers.remove(laser);
          rock.diam-=30;
          if (rock.diam<20) {
            rocks.remove(rock);
            score+=rock.health;
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    //Render the spaceship
    s1.display(mouseX, mouseY);

    // check the status of play and run Game Over
    if (s1.health<1 || rockCount > 9) {
      gameOver();
      noLoop();
    }
  }
}

void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 50);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Rock Count:" + rockCount + " Score:" + score + " Level:" + level + " Health:" + s1.health + " Ammo:" + s1.laserCount, width/2, 40);
}

void startScreen() {
  background(0); // consider using a graphic
  //image(startScreen,0,0)
  textAlign(CENTER);
  textSize(40);
  fill(255);
  text("Welcome to SpaceGame!", width/2, height/2-200);
  text("By: Ethan Reynolds", width/2, height/2-160);
  text("Press spacebar to start...", width/2, height/2-120);
  if (keyPressed || mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0); // consider using a graphic
  //image(gameOver,0,0)
  textAlign(CENTER);
  textSize(40);
  fill(255);
  text("Game Over!!", width/2, height/2-200);
  text("Final Score:" + score, width/2, height/2-160);
  text("Level Achieved:" + level, width/2, height/2-120);
}

void mousePressed() {
  if (play == true) {
    laser.play();
  }
  if (s1.fire()) {
    if (s1.turret == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      s1.laserCount--;
    } else if (s1.turret == 2) {
      lasers.add(new Laser(s1.x-10, s1.y));
      lasers.add(new Laser(s1.x+10, s1.y));
      s1.laserCount--;
    }
  }
}


void keyPressed() {
  if (keyPressed) {
    if (key == ' ') {
      if (s1.fire()) {
        if (s1.turret == 1) {
          lasers.add(new Laser(s1.x, s1.y));
          s1.laserCount--;
        } else if (s1.turret == 2) {
          lasers.add(new Laser(s1.x-10, s1.y));
          lasers.add(new Laser(s1.x+10, s1.y));
          s1.laserCount--;
        }
      }
    }
  }
}

void ticker() {
}
