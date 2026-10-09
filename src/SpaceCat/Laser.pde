class Laser {
  //Member variables
  int x, y, w, h, speed, harm;
  PImage lsi;
  //constructor
  Laser(int x, int y, int harm) {
    this.x = x;
    this.y = y;
    w = 6;
    h = 12;
    speed = 5;
    this.harm = harm;
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
    y = y-speed;
  }

  boolean isOffScreen() {
    if (y<-15) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(Enemy e) {
    float d = dist(x, y, e.x, e.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
