class Enemy {
  int x, y, size, health, speed;
  boolean isHit;
  color c1;
  PImage enemy;

  Enemy(int x, int y, int maxspeed) {
    c1 = color(random(0, 225), random(0, 225), random (0, 225));
    this.x = x;
    this.y = y;
    size = int(random(20, 100));
    health = size;
    speed = int(random(1, maxspeed));
    isHit = false;
    if(random(2)>1){
      enemy = loadImage("Rock1.png");
    }else {
      enemy = loadImage("Rock2.png");
    }
  }
  void move() {
    y = y + speed;
  }

  void display() {
    fill (c1);
    enemy.resize( size, size);
    imageMode(CENTER);
    image(enemy, x, y);
    //ellipse(x, y, size, size);
    fill (255);
    text(health, x, y);
  }
  boolean isOffScreen() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
  void relocate() {
    x = int(random(width));
    y = int(random(height));
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
