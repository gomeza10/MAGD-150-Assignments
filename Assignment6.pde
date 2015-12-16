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


 
}
void update(){
  if (((posX+100) + pupildiameter/2) > 200){
   movementsize = movementsize * -1; 
  }else if (posX+100  < 100){
   movementsize = movementsize * -1; 
  }
 posX = posX + movementsize;
}
void collegestudent(){
 strokeWeight(1);
 fill(255,153,51);
 ellipse(98,100,350,400);
 fill(255,255,255);
 ellipse(48,100,100,100);
 fill(255,255,255);
 ellipse(148,100,100,100);
 fill(0,0,0);
 ellipse(posX,posY,pupildiameter,pupildiameter);
 ellipse(posX+100,posY,pupildiameter,pupildiameter);
 fill(135,39,208);
 arc(48,105,100,95,0,PI,CHORD);
 fill(135,39,208);
 arc(148,105,100,95,0,PI,CHORD);
 fill(135,39,208);
 arc(48,95,100,95,PI,TWO_PI,CHORD);
 fill(135,39,208);
 arc(148,95,100,95,PI,TWO_PI,CHORD);
 stroke(0,0,0);
 strokeWeight(20);
 line(48,200,148,200);
 strokeWeight(1);
 fill(0,153,0);
 rect(0,300,300,500);
}
void hand(){
 fill(250);
 rect(mouseX,mouseY-100,100,150);
 fill(153,76,0);
 rect(mouseX,mouseY-30,100,50);
 fill(255,153,51);
 ellipse(mouseX,mouseY,150,150);
}
void mouseClicked(){
  phase=!phase;
}
void energized(){
  strokeWeight(1);
 fill(255,153,51);
 ellipse(98,100,350,400);
 fill(255,255,255);
 ellipse(48,100,100,100);
 fill(255,255,255);
 ellipse(148,100,100,100);
 fill(0,0,0);
 ellipse(posX,posY,pupildiameter,pupildiameter);
 ellipse(posX+100,posY,pupildiameter,pupildiameter);
 stroke(0,0,0);
 strokeWeight(20);
 line(48,200,148,200);
 strokeWeight(1);
 fill(0,153,0);
 rect(0,300,300,500);
  
}
void randomizePos(){  
 circlePositionX = round(random(width));  
 circlePositionY = round(random(height));  
 }
void colorize(){ 
   a = round(random(255));
   b = round(random(255));
   c = round(random(255));  
   } 
void displayEllipse(){  
  fill(c);  
  ellipse(circlePositionX, circlePositionY, circleSizeX, circleSizeY);
}
