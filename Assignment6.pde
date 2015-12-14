int posX = 10;
int posY = 100;
int posZ = 10;
int movementsize = 1;
int pupildiameter = 15;
boolean phase = false;
int circlePositionX = 400;
int circlePositionY = 450;
int circleSizeX = 75;
int circleSizeY = 75;
color a;
color b;
color c;

void setup(){
 size(800,600); 

}
void draw(){
 if (phase==false){
 background(200);
 fill(0,0,0);
 textSize(32);
 text("Before Coffee",400,100);
 collegestudent();
 hand();
 update();
 }else if (phase ==true){
  background(0,0,255);
  energized();
  hand();
 fill(0,0,0);
 textSize(32);
 text("After Coffee",400,100);
 randomizePos();  
 colorize();  
 displayEllipse();

 }
