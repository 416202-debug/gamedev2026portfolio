class PowerUp{
 int x, y, size, health,speed,harm;
boolean isHit;
color c1;
char type;
PImage powUpi;

PowerUp(int x, int y) {
 c1 = color(random(0, 225), random(0,225), random (0,225));
 this.x = x;
 this.y = y;
 size = int(random(30,50));
 health = size;
 harm = 10;
 speed = int(random(1,10));
 if(random(3)>2){
   type = 'h';
      powUpi = loadImage("health.png");
    }else if(random(2)<1){
      type = 'd';
      powUpi = loadImage("harm.png");
    }else {
      type = 's';
      powUpi = loadImage("harm.png");
    }
}
void move() {
 y = y + speed;
}
void display() {
fill (c1);
powUpi.resize( size, size);
imageMode(CENTER);
image(powUpi,x,y);
if(type == 'h'){
  text("+"+health, x, y);
}else if(type == 'd'){
  text("Laser Harm + "+harm, x, y);
}else{
ellipse(x, y, size, size);
}
//ellipse(x, y, size, size);
//fill (255);
//text("+"+health, x, y);
}

void relocate() {
x = int(random(width));
y = int(random(height));
} 
boolean isOffScreen() {
  if(y>height+50) {
  return true;
  } else{
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
