//Sarah Zhang || sep 17, 26 || 3B
import gifAnimation.*;
import processing.sound.*;
SoundFile laser1, rockbreak, impact, enemyhit;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powUps = new ArrayList<PowerUp>();
int score, enemyCount, enemiesOffScreen, lharm, level, emaxSpeed;
boolean play;
Ship s1;
Boss boss01;
Timer enemyDist, pDist;
Enemy e;
Laser l;
PowerUp p;
Gif   rbackground;
PImage sbackground, ebackground;
//Gif ship01;

void setup() {

  size(500, 500);
  enemies.add(new Enemy(int(random(width)), -60, emaxSpeed));
  powUps.add(new PowerUp(int(random(width)), -60));
  lasers.add(new Laser(int(random(width)), -60, lharm));
  l = new Laser(int(random(width)), -60, lharm);
  enemyDist = new Timer(2000);
  enemyDist.start();
  pDist = new Timer(3000);
  pDist.start();
  s1 = new Ship(this);
  boss01 = new Boss(-120, 70, 1);
  score = 0;
  enemyCount = 0;
  enemiesOffScreen = 0;
  play = false;
  lharm = 10;
  sbackground = loadImage("sb.png");
  rbackground = new Gif(this, "rb.gif");
  rbackground.loop();
  rbackground.play();
  ebackground = loadImage("eb.png");

  laser1 = new SoundFile (this, "laser2.mp3");
  rockbreak = new SoundFile (this,"rockbreak.mp3");
  impact = new SoundFile (this, "impact.mp3");
  enemyhit = new SoundFile (this, "enemyhit.mp3");
}
void draw() {
  noCursor();
  if (play == false) {
    startScreen();
  } else {
    imageMode(CENTER);
    image(rbackground, width/2, height/2, width, height);
    rbackground.play();
    //background(30);
    //player control
    s1.display();
    s1.move(mouseX, mouseY);
    //enemies.add(new Enemy());
    //enemies.add(new Enemy());
    //enemies.add(new Enemy());
    for (Enemy enemy : enemies) {
      enemy.display();
    }
    //Add Rocks
    if (enemyDist.isFinished() == true) {
      enemyDist.start();
      enemies.add(new Enemy(int(random(width)), -60, emaxSpeed));
      enemyCount++;
    }

    //Add Power Ups
    if (pDist.isFinished() == true) {
      pDist.start();
      powUps.add(new PowerUp(int(random(width)), -60));
    }
    //Displays and moves enemies
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      e.display();
      e.move();
      if (e.isHit(s1)) {
        //remove rock
        enemies.remove(e);
        s1.health = s1.health - e.health;
        //sound
        impact.play();
      }
      if (e.isOffScreen() == true) {
        enemies.remove(e);
        enemiesOffScreen++;
      }
      println(enemies.size());
    }
    
    boss01.display();
    boss01.move();
    //Displays and moves power ups
    for (int i = 0; i < powUps.size(); i++) {
      PowerUp p = powUps.get(i);
      p.display();
      p.move();
      if (p.isHit(s1)) {
        //remove
        
        if (p.type == 'h') {
          if (200-s1.health<p.health){
            s1.health = 200;
          }else {
          s1.health += p.health;}
        } else if(p.type == 's'){
          lharm = lharm+ p.harm;
          //s1.turretCount = 2;
        }else{
        emaxSpeed -= 1;
        if(emaxSpeed<6){
        emaxSpeed = 5;
        }
        }
        powUps.remove(p);
      }
      if (p.isOffScreen() == true) {
        powUps.remove(p);
      }
      println(enemies.size());
    }
    //display and move lasers and detect rock collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      l.display();
      l.move();
      for (int j = 0; j < enemies.size(); j++) {
        Enemy e = enemies.get(j);
        if (l.isHit(e)) {
          //remove laser
          lasers.remove(l);
          //deduct rock health
          e.health -= l.harm;
          enemyhit.play();
          if (e.health<0) {
            score += e.size;
            //Add Sound
            rockbreak.play();
            enemies.remove(e);
          }
          //increment score
        }
      }
      if (l.isOffScreen() == true) {
        lasers.remove(l);
      }
      println(lasers.size());
    }

    //for () {

    infoPanel();
    if (s1.health<1 || enemiesOffScreen>9) {
      gameOver();
    }
    //game over
  }
}
void mousePressed() {
  if(s1.turretCount == 1) {
  lasers.add(new Laser(s1.x, s1.y, lharm));
  //sound
  laser1.play();
  } else if(s1.turretCount == 2) {
  lasers.add(new Laser(s1.x+20, s1.y, lharm));
  lasers.add(new Laser(s1.x-20, s1.y, lharm));
  //sound
  laser1.play();
}
}

void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 20, width, 40);
  fill(255);
  text("Score: "+ score, 20, 35);
  text("Healthl: "+ s1.health, 100, 35);
  text("Rock Count: "+ enemyCount, 200, 35);
  text("Rocks Passed: "+ enemiesOffScreen, 300, 35);
  text("Laser Damage: "+ lharm, 400, 35);
}

void startScreen() {
  //background(0);
  imageMode(CENTER);
  image(sbackground, width/2, height/2);
  fill(255);
  textSize(10);
  text("Sarah Zhang", 3*width/7, 3*height/4);
  textSize(32);
  text("Press any key to start game...", width/7, 5*height/6);
   textSize(16);
  //add start screen graphic
  if (keyPressed) {
    play = true;
  }
}

void gameOver () {
  //background(0);
  imageMode(CENTER);
  image(ebackground, width/2, height/2);
  //Add game over graphic
  fill(255);
   textSize(32);
  text("Game Over! Thanks for playing! " , width/8, height/2);
  text("Score:" + score, width/3, 2*height/3);
  noLoop();
  //add start screen graphic
}
