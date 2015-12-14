Blocks blocks;
Timer bomb;
Ground ground;
int centerX;
boolean explode = false;
PImage img;
PImage death;
PImage clear;
Movement movement;

class Timer{
  int savedTime; 
  int totalTime;  
  
  Timer(int _totalTime){
    totalTime = _totalTime;
  }
  
  // Start the Timer
  void start() {
    savedTime = millis();
  }
  
  boolean isFinished() {
   // check how much time has passed
   int passedTime = millis() - savedTime;
   if (passedTime > totalTime) {
     return true;
   } else {
     return false;
   }
  }
}

class Blocks {
  void display(){
    fill(228,193,80);
    rectMode(CENTER);
    rect(500,300,100,100);
    noStroke();
    fill(100,0,0);
    rectMode(CENTER);
    rect(400,300,100,100);
  }
}
class Ground {
  void display(){
    stroke(0,255,0);
    strokeWeight(50);
    line(0,700,1000,700);
    noStroke();
    fill(246,205,71);
    quad(0,700,1000,700,1000,800,0,800);
  }
}


void setup(){
  background(0,150,255);
  size(1000,800);
  blocks = new Blocks();
  ground = new Ground();
  movement = new Movement();
  String url = "http://files.gamebanana.com/img/ico/sprays/_1605-.png";
  img = loadImage(url, "png");
  String web = "http://gamerfront.net/wp-content/uploads/2011/03/Mario-Game-Over-Death-Montage.jpg";
  death = loadImage(web, "jpg");
  String pic = "https://i.ytimg.com/vi/3a5N_VO1WEw/hqdefault.jpg";
  clear = loadImage(pic,"jpg");
  bomb = new Timer(10000);
}
void draw(){
 if (bomb.isFinished()){
   explode = true; 
 }else{
  explode = false; 
 }
 if(explode == false && centerX<700){
   background(0,150,255);
   blocks.display();
   ground.display();
   movement.update();
   movement.display();
   image(img,650,430);
   fill(0,0,0);
   ellipse(880,530,150,150);
   fill(255,255,255);
   ellipse(900,620,100,75);
   stroke(255,255,255);
   line(910,590,910,570);
   noStroke();
 }else if (explode == true){
    background(0,200,255);
    image(death,200,0);
  }else if (centerX>=700){
    background(0,0,0);
    image(clear,200,0);
 }
}
void keyPressed(){
  movement.keyPressed();
}

void keyReleased(){
  movement.keyReleased();
}
//movement class (not in a tab because I had to use center X in the main tab
class Movement{
  boolean keys[];    
  
  int xVelocity, yVelocity;
  
  Movement(){
    centerX = 200;
    keys = new boolean [2];
  }
  void display(){
    ellipseMode(CENTER);
    fill(255,0,0);
    ellipse(centerX,610,110,100);
    fill(255,255,150);
    rect(centerX,650,70,70,70);
    fill(255,255,255);
    ellipseMode(CORNER);
    ellipse(centerX-13,570,30,40);
    fill(255,255,255);
    ellipseMode(CENTER);
    ellipse(centerX-45,610,20,40);
    ellipseMode(CORNER);
    ellipse(centerX+35,590,20,40);
    stroke(0,0,0);
    strokeWeight(5);
    point(centerX-10,640);
    point(centerX+10,640);
    noStroke();
  }
  void update(){
    if(keys[0]){
      xVelocity = -5;
    }
    if(keys[1]){
      xVelocity = 5;
    }
    if(!keys[0] && !keys[1]){ 
      xVelocity = 0;
    }
    centerX += xVelocity;
  }
void keyPressed(){
    if(key == 'a'){
      keys[0] = true;
    }
    if(key == 'd'){
      keys[1] = true;
    } 
}
  
  void keyReleased(){  
    println("Keyreleased " + key);
    if(key == 'a'){
      keys[0] = false;
    }
    if(key == 'd'){
      keys[1] = false;
    } 
  }   
}
