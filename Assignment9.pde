Turkey[] legs; 
Pie myPie;
Pie pie2;
Timer myTimer;
Timer pieTimer;
PImage turkey;
PImage face;
PImage pie;
PImage thanksgiving;
int legCount;
Boolean scene = false;
Movement newMovement;


class Movement{
  int centerX, centerY, offset1, offset2, offsetX1, offsetX2, r1, r2, r3;
  boolean keys[];    // In this array, the index corresponds with W,S,A,D.
  
  int xVelocity, yVelocity;
  
  // constructor
  Movement(){
    centerX = 500;
    centerY = 600;
    keys = new boolean [4];
  }
  
  void display(){  
     image(face, centerX, centerY);
  }
  
  void update(){
    if (keys[0]){
      yVelocity = -5;
    }
    if(keys[1]){
      yVelocity = 5;
    }
    if(keys[2]){
      xVelocity = -5;
    }
    if(keys[3]){
      xVelocity = 5;
    }
    if(!keys[2] && !keys[3]){ // if both Left and Right are released, horizontal velocity should be zero.
      xVelocity = 0;
      //println("no left or right");
    }
    if(!keys[0] && !keys[1]){ // if both Up and Down are released, vertical velocity should be zero.
      yVelocity = 0;
      //println("no left or right");
    }
    centerX += xVelocity;
    centerY += yVelocity;
  }
  
  void keyPressed(){
    if(key == 'w'){
      keys[0] = true;
    } 
    if(key == 's'){
      keys[1] = true;
    }
    if(key == 'a'){
      keys[2] = true;
    }
    if(key == 'd'){
      keys[3] = true;
    } 
  }
  
  void keyReleased(){ // the 
    println("Keyreleased " + key);
    if(key == 'w'){
      keys[0] = false;
    } 
    if(key == 's'){
      keys[1] = false;
    }
    if(key == 'a'){
      keys[2] = false;
    }
    if(key == 'd'){
      keys[3] = false;
    } 
  }   
}

class Turkey{
  int centerX, centerY;
  
  // constructor
  Turkey(){
    centerX = round(random(width));
    centerY = 10;
  }
  
  // update position
  void update(){
    centerX = round(random(-10,10)) + centerX;
    centerY = centerY + 1;
  }
  // display the enemy after the position is updated
  void display(){
    image(turkey, centerX, centerY);
  }
}
class Pie{
  int centerX, centerY;
  void updatePie(){
    centerX = round(random(0, width));
    centerY = round(random(0, height));
  }
  void drawPie(){
    image(pie, centerX, centerY);
  }
}

class Timer{
  float startTime, stopTime;
   boolean started = false; 
  Timer(float _stopTime){
    stopTime = _stopTime;
  }
  void timerStart(){
    startTime = millis();
    started = true;
  }
  
  void stopTimer(){
    started = false;
    println("time stopped");
  }
  boolean isFinished(){
    float passedTime = millis() - startTime;
    if((passedTime > stopTime) && (started)) {
      return true;
    } else {
      return false;
    }
  }
}


void setup(){
  size(1000, 800);  
  legs = new Turkey[1000];              // create the array with 1000 slots
  for(int x = 0; x < legs.length-1; x++){    // create 1000 instances for turkey legs
    legs[x] = new Turkey();
  }
  myTimer = new Timer(500);     // sets timer to 0.5 seconds
  myTimer.timerStart();
  pieTimer = new Timer(500);
  pieTimer.timerStart();
  String url = "http://img3.wikia.nocookie.net/__cb20100615145310/frontierville/images/4/4b/Chicken_Drumstick-icon.png";
  turkey = loadImage(url, "png");
  String web = "http://38.media.tumblr.com/c8bc1b2746eba15e967a4ba4575cf588/tumblr_inline_n9qnsthfYm1s4rar7.png";
  face = loadImage(web, "png");
  String page = "http://icons.iconseeker.com/png/fullsize/quickpix-2004/pumpkin-pie-2.png";
  pie = loadImage(page, "png");
  String url2 = "http://4.bp.blogspot.com/-PA4Ep0anGRA/VkMFQLCeK7I/AAAAAAAAAN8/l1_w14ZZb0w/s1600/thanksgiving%2Bclipart%2Bturkey.jpg";
  thanksgiving = loadImage(url2, "jpg");  //image for second scene
  newMovement = new Movement(); //face movement
  myPie = new Pie();  //two different pies spawning
  pie2 = new Pie();
}

void draw(){
  background(255,0,0);
  if(scene == false){
    if(myTimer.isFinished()){                      // whenever the timer goes off, add other enemy
      legCount++;
      myTimer.timerStart(); // restart the timer      // restart the timer everytime the timer goes off
    }
    if (legCount == legs.length-1){         
      legCount = 0;
    }
    for(int newLegs = legCount; newLegs > 0 ; newLegs --){    
      legs[newLegs].update();                                  
      legs[newLegs].display();
    }
    newMovement.update();
    newMovement.display();
    if(pieTimer.isFinished()){
      myPie.updatePie();
      pie2.updatePie();
      pieTimer.timerStart();
    }
    myPie.drawPie();
    pie2.drawPie();
  }else{
     background(0);
     textSize(50);
     text("Happy Thanksgiving!", 250, 400);
     image(thanksgiving, 250, 500);
  }
}
void keyPressed(){
  newMovement.keyPressed(); // the global keyPressed function calls the Movement class keyPressed method.  
}

void keyReleased(){
  newMovement.keyReleased(); 
}
void mouseClicked(){  // change scenes
   scene = !scene;
}
