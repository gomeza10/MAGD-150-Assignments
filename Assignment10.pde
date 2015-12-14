PImage vault_arms;  //vault boy photo in scene 1
PImage vault_walk; //vault boy photo in scene 2
PImage deathclaw; //deathclaw photo in scene 2
PImage deathclaw_VATS; //deathclaw photo in scene 3
PImage vault_miss;  //photo for when you miss your shot
PImage deathHand; //photo of deathclaw hand
PImage fatman;  //photo of the mininuke launcher in scene 5
PImage direct; //photo in the final scene
Timer hand_timer; //timer for explosion scene
Timer deathclaw_timer;
Timer scene_timer;
Timer scene_timer5; //timer in scene 5
nuke mynuke;
hand myHand;
hand[] handArray; //array for explosions in scene 6
int num_hand=0; //number of explosions in array
int scene = 1; //determines scene number
String limb; //string for what limb is selected in scene 3
boolean hit;  //determines if you hit the deathclaw or not

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
 }
 boolean isFinished(){
  float passedTime = millis() - startTime;
  if((passedTime > stopTime) && (started)){
   return true; 
  }else{
   return false; 
  }
 }
}


class mushroom_cloud{
  int centerX, centerY, size;
  
  // constructor
  mushroom_cloud(){
    centerX = round(random(width));
    centerY = 10;
    size = round(random(50, 100));
  }

  
  void display(){
    image(deathHand,centerX,centerY);
  }
}


class hand{
  int centerX, centerY, size;
  
  // constructor
  hand(){
    centerX = round(random(width));
    centerY = 5;
    size = round(random(50, 100));
  }
  
  // update position
  void update(){
    centerX = round(random(-10,10)) + centerX;
    centerY = centerY + 5;
  }
  // display the enemy after the position is updated
  void display(){
    image(deathHand,centerX,centerY);
  }
}

int centerX, centerY;
class nuke{              //class for the nuke in scene 5

  nuke(){
    centerX = 526;
    centerY = 342;
  }
  void update(){
     centerX = centerX-5;
  }
  void display(){
    noStroke();
    fill(51,102,0);
    ellipse(centerX,centerY,100,75);
    triangle(centerX+40,centerY,centerX+74,centerY-22,centerX+74,centerY+33);
    beginShape();
      vertex(centerX+74,centerY-22);
      vertex(centerX+94,centerY-22);
      vertex(centerX+94,centerY+33);
      vertex(centerX+74,centerY+33);
    endShape(CLOSE);  
  }
} 

void setup(){
 size(1000,800);
 background(0,0,0);
 //load images for scenes
 String url = "http://img4.wikia.nocookie.net/__cb20101012145038/fallout/images/0/08/ShotgunSurgeon.png";
 vault_arms = loadImage(url, "png");
 String walk = "http://static.giantbomb.com/uploads/square_small/7/73953/2197863-walker_of_the_mojave.png";
 vault_walk = loadImage(walk,"png");
 String beast = "http://vignette2.wikia.nocookie.net/fallout/images/2/24/FoS_deathclaw.png/revision/latest?cb=20150816214023";
 deathclaw = loadImage(beast,"png");
 String vats = "http://img2.wikia.nocookie.net/__cb20110511005659/fallout/images/9/9c/Deathclaw.png";
 deathclaw_VATS = loadImage(vats,"png");
 String miss = "http://vignette2.wikia.nocookie.net/fallout/images/0/00/26_You_Gotta_Shoot_'Em_in_the_Head.png/revision/latest?cb=20100325143018";
 vault_miss = loadImage(miss,"png");
 String hand = "http://img3.wikia.nocookie.net/__cb20110308180248/fallout/images/thumb/e/e4/Deathclaw_Hand.png/500px-Deathclaw_Hand.png";
 deathHand = loadImage(hand, "png");
 String launch = "http://vignette4.wikia.nocookie.net/fallout/images/2/23/13_Take_it_Back!.png/revision/latest?cb=20100325141339";
 fatman = loadImage(launch,"png");
 String guns = "http://static-3.nexusmods.com/15/mods/130/images/47880-1-1348195835.png";
 direct = loadImage(guns,"png");
 deathclaw_timer = new Timer(5000);
 deathclaw_timer.timerStart(); 
 scene_timer = new Timer(8000);
 scene_timer.timerStart();
 scene_timer5 = new Timer(3000);
 handArray = new hand[100];
 for(int x=0; x<handArray.length-1; x++){  //loop to create instances
   handArray[x] = new hand();
 }
 hand_timer = new Timer(1000);
 myHand = new hand();
 mynuke = new nuke();
 }
void draw(){
 if(scene == 1){
   background(0,0,0);
   textSize(50);
   fill(0,255,0);
   text("Fallout V.A.T.S.",300,200);
   text("Press a key to continue",230,300);
   image(vault_arms, 300,300);
 }else if (scene == 2){
    background(225,240,126); 
    noFill();
    stroke(0,255,0);
    rectMode(CENTER);
    rect(500,50,500,20);
    stroke(255,0,0);
    line(500,30,500,70);
    stroke(0,0,0);
    strokeWeight(8);
    fill(102,51,0);
    quad(0,500,1000,500,1000,800,0,800);
    image(vault_walk, 600,300);
    if(deathclaw_timer.isFinished()){
      image(deathclaw, 0,250);
      fill(255,0,0);
      stroke(255,0,0);
      rectMode(CENTER);
      rect(200,700,300,20);
      stroke(0,0,0);
      strokeWeight(15);
      point(740,350);
      point(770,353);
      noStroke();
      fill(225,240,126);
      rectMode(CENTER);
      rect(700,330,50,100);
    }
    fill(0,255,0);
    stroke(0,255,0);
    rectMode(CENTER);
    rect(800,700,300,20);
    if(scene_timer.isFinished()){
      scene++;  
    }
  }else if(scene == 3){
     background(225,240,126); 
     stroke(0,0,0);
     strokeWeight(8);
     fill(102,51,0);
     quad(0,500,1000,500,1000,800,0,800);
     image(deathclaw_VATS,0,0);
     stroke(0,255,0);
     fill(0,255,0);
     triangle(mouseX,mouseY,mouseX+15,mouseY+15,mouseX+5,mouseY+20);
     textSize(50);
     text("Select a limb to fire on.",0,50);
     fill(0,255,0,50);
     if(mouseX<621 && mouseX>456 && mouseY<285 && mouseY>114){ //if then statement to show head outline
       beginShape();
         vertex(456,114);
         vertex(641,137);
         vertex(614,260);  //outline for the head outline
         vertex(516,333);
         vertex(491,301);
       endShape(CLOSE);
       fill(0,255,0);
       limb = "Head 75%";
       text("Limb Selected: ",0,100);
       text(limb,400,100);
     }else if(mouseX<707 && mouseX>622 && mouseY<455 && mouseY>141){  //if then for torso outline
       beginShape();
         vertex(646,141);
         vertex(697,145);  //outline for the torso outline
         vertex(707,252);
         vertex(693,283);
         vertex(706,312);
         vertex(641,461);
         vertex(532,384);
         vertex(540,330);
         vertex(619,269);
       endShape(CLOSE);
       limb = "Torso 95%";
       fill(0,255,0);
       text("Limb Selected: ",0,100);
       text(limb,400,100);
     }else if(mouseX>708 && mouseX<998 && mouseY>140 && mouseY<357){ //if then for right arm outline
       beginShape();
         vertex(695,134);
         vertex(742,148);  //outline for the right arm outline
         vertex(796,273);
         vertex(998,279);
         vertex(998,459);
         vertex(932,355);
         vertex(769,341);
         vertex(704,275);
       endShape(CLOSE);
       limb = "Right Arm 50%";
       fill(0,255,0);
       text("Limb Selected: ",0,100);
       text(limb,400,100);
     }else if(mouseX<752 && mouseX>659 && mouseY<741 && mouseY>325){ //if then for right leg outine
       beginShape();
         vertex(714,320);
         vertex(757,517);  //outline of the right leg outline
         vertex(727,667);
         vertex(825,736);
         vertex(641,744);
         vertex(653,465);
       endShape(CLOSE);
       limb = "Right Leg 50%";
       fill(0,255,0);
       text("Limb Selected: ",0,100);
       text(limb,400,100);
     }else if(mouseX<606 && mouseX>453 && mouseY>386 && mouseY<637){ //if then for left leg
       beginShape();
         vertex(519,386);
         vertex(591,451);  //shape for the left leg outline
         vertex(561,483);
         vertex(616,504);
         vertex(590,637);
         vertex(445,626);
         vertex(544,543);
         vertex(448,538);
       endShape(CLOSE);
       limb = "Left Leg 50%";
       fill(0,255,0);
       text("Limb Selected: ",0,100);
       text(limb,400,100);
     }else if(mouseX<450 && mouseX>101 && mouseY>150 && mouseY<405){ //if then for left arm outline
        beginShape();
         vertex(449,155);  //shape for the left arm outline
         vertex(476,295);
         vertex(105,401);
         vertex(100,267);
         vertex(280,299);
         vertex(409,236);
       endShape(CLOSE);
       limb = "Left Arm 50%";
       fill(0,255,0);
       text("Limb Selected: ",0,100);
       text(limb,400,100);
     }
    }else if (scene == 4){
       background(225,240,126); 
       noFill();
       stroke(0,255,0);
       rectMode(CENTER);
       rect(500,50,500,20);
       stroke(255,0,0);
       line(500,30,500,70);
       stroke(0,0,0);
       strokeWeight(8);
       fill(102,51,0);
       quad(0,500,1000,500,1000,800,0,800);
       image(fatman, 600,300);
       image(deathclaw, 0,250);
        fill(255,0,0);
        stroke(255,0,0);
        rectMode(CENTER);
        rect(200,700,300,20);
        fill(0,255,0);
        stroke(0,255,0);
        rectMode(CENTER);
        rect(800,700,300,20);
        fill(200);
        stroke(0,0,0);
        strokeWeight(5);
        rectMode(CENTER);
        rect(745,572,32,65);
        rect(788,572,32,65);
        triangle(745,602,708,620,762,620);
        triangle(788,602,752,622,806,620);
        mynuke.update();
        mynuke.display();
        if(centerX <= 260){
         scene++; 
        }
     }else if (scene == 5){
       scene_timer.timerStart();
      background(255,0,0);
      stroke(0,0,0);
      strokeWeight(8);
      fill(102,51,0);
      quad(0,500,1000,500,1000,800,0,800);
        noStroke();
      fill(255,128,0);
      beginShape();
        vertex(396,315);
        vertex(606,315);
        vertex(606,620);
        vertex(396,620);
      endShape(CLOSE);
      beginShape();
        vertex(606,620);
        vertex(710,760);
        vertex(292,760);
        vertex(396,620);
      endShape(CLOSE);
      fill(255,178,102);
      ellipse(493,230,300,300);
      ellipse(623,280,300,300);
      ellipse(380,280,300,300);
      stroke(0,0,0);
      fill(153,76,0);
      ellipse(293,762,200,200);
      ellipse(440,762,200,200);
      ellipse(610,762,200,200);
      ellipse(790,762,200,200);
      myHand.update();
      myHand.display();
      hand_timer.timerStart();
      if(hand_timer.isFinished()){
      num_hand++;              //raise number of explosions
       hand_timer.timerStart();  //resets timer 
      }
      if(num_hand == handArray.length-1){
       num_hand = 0; 
      
      for(int newHand = num_hand; newHand > 0; newHand--){
       handArray[newHand].update();
       handArray[newHand].display();
      }
      }
      if(scene_timer5.isFinished()){
       scene = 7; 
      }
     }else if(scene == 6){
       background(225,240,126);
       fill(0,0,0);
       textSize(60);
       text("YOU MISSED!",300,200);
       text("Reload file to start over. :(",200,300);
       stroke(0,0,0);
       strokeWeight(8);
       fill(102,51,0);
       quad(0,500,1000,500,1000,800,0,800);
       noStroke();
       fill(255,0,0);
       ellipse(400,700,200,150);
       ellipse(450,700,150,150);
       ellipse(350,700,150,150);
       image(vault_miss,300,500);
     }
}
void keyPressed(){
 scene++; 
}
void mouseClicked(){
  if(mouseX<450 && mouseX>101 && mouseY>150 && mouseY<405){ //left arm
    hit = true;
    scene=4;
  }else if(mouseX<606 && mouseX>453 && mouseY>386 && mouseY<637){ //if then for left leg
     hit = true;
     scene=4;
   }else if(mouseX<752 && mouseX>659 && mouseY<741 && mouseY>325){ //if then for right leg 
      hit = true;
      scene=4;
    }else if(mouseX>708 && mouseX<998 && mouseY>140 && mouseY<357){ //if then for right arm
       hit = true;
       scene=4;
     }else if(mouseX<707 && mouseX>622 && mouseY<455 && mouseY>141){  //if then for torso
        hit = true;
        scene=4;
      }else if(mouseX<621 && mouseX>456 && mouseY<285 && mouseY>114){ //if then for head
         hit = true;
         scene=4;
       }else{
          hit = false;
          scene=6;
       }
}
