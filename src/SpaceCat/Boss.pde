class Boss{
//member variables
int x, y, w, h, health, speed, duration, lvl;
boolean isHit;
PImage b1;
//constructor
Boss(int x, int y, int lvl) {
 this.x = x;
this.y = y;
this.lvl = lvl;
w = 120;
h = 120;
health = 10000; 
speed = 1;
duration = 20000;
isHit = false;
if(lvl == 1){
b1 = loadImage("lvl1Boss.png");
}else if(lvl == 2){
b1 = loadImage("lvl1Boss.png");

}
}
//methods
// Display
void display() {
  //todo: replace with image
  //image(b1, x, y);
 fill(255, 6, 88);
 ellipse(x, y, w, h);
 fill(255);
 text(health, x, y);
}
void move(){
x += speed;
}
}
