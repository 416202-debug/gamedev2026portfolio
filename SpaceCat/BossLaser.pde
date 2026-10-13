class BossLaser {
  //Member variables
  int x, y, w, h, speed, harm;
  PImage lsi;
  //constructor
  BossLaser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 6;
    h = 12;
    speed = 5;
    harm = 10;
    lsi = loadImage("Laser.png"); 
  }
  //Member Methods
  void display () {
    fill(0, 0, 255);
    imageMode(CENTER);
    image(lsi,x,y,w,h);
    //rect(x, y, w, h);
  }

  void move() {
    y = y+speed;
  }

  boolean isOffScreen() {
    if (y<-15) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(Ship s1) {
    float d = dist(x, y, s1.x, s1.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
  
}
