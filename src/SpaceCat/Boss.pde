class Boss{
//member variables
int x, y, w, h, health, yspeed,xspeed, duration, lvl;
boolean isHit; //<>//
PImage b1;

//constructor
Boss(int x, int y, int lvl) {
 this.x = x;
this.y = y;
this.lvl = lvl;
w = 120;
h = 120;
health = 10000; 
yspeed = 0;
xspeed = 1;
duration = 20000;
isHit = false;
if(lvl == 1){
b1 = loadImage("Boss.png");
}else if(lvl == 2){
b1 = loadImage("Boss.png");

}
}
//methods
// Display
void display() {
  //todo: replace with image
  image(b1, x, y);
 //fill(255, 6, 88);
 //ellipse(x, y, w, h);
 //fill(255);
 text(health, x, y);
}
void move(){
x += xspeed;
y -= yspeed;
}
boolean isOffScreen() {
    if (x>width+100) {
      return true;
    } else {
      return false;
    }
  }
}
