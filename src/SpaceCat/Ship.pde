class Ship {
 // Member Variables

 PApplet parent;
 int x,y,health, turretCount;
 Gif ship01;
 
 // Contructor
 Ship(PApplet app) {

  x = width/2;
  y = height/2;
  health = 100;
  ship01 = new Gif(app, "player.gif");
  turretCount = 1;
 ship01.loop();

 }
 // Member Methods
 void display(){
   fill(127);
   
   image(ship01, x, y, 100,100);
   //quad(x, y-50,x+25,y-15,x,y+40,x-25,y-15);
 }

void move(int tempX, int tempY) {
x = tempX;
y = tempY;
ship01.play();
}

}
