void setup(){
 size(1000,700);
 background(0,0,255);
 noStroke();
 fill(0,255,0);
 rect(0,600,1000,200);
 jason();
}
//arm movement variables
float arm1=310;
float arm2=270;
float arm3=210;
//jason character
void jason(){
  //head
  fill(242,224,109);
  ellipse(200,200,95,110);
  noStroke();
  //blackshirt/pants
  fill(0,0,0);
  rect(173,270,53,200);
  fill(242,224,109);
  quad(185,250,215,250,225,270,175,270);
  fill(0,0,51);
  rect(140,460,115,390,10);
  fill(242,224,109);
  arc(200,270,50,50,0,PI,CHORD);
  //mask
  fill(247,239,187);
  strokeWeight(1);
  stroke(0,0,0);
  ellipse(220,200,55,110);
  //nose
  triangle(235,200,243,215,235,215);
  fill(0,0,0);
  rect(152,196,45,15,5);
  noStroke();
  fill(200,0,0);
  triangle(225,180,243,180,235,190);
  //all of the holes in the mask
  strokeWeight(1);
  fill(0,0,0);
  ellipse(220,200,20,15);
  ellipse(220,160,5,5);
  ellipse(225,170,5,5);
  ellipse(225,180,5,5);
  ellipse(243,180,5,5);
  ellipse(230,187,5,5);
  ellipse(240,187,5,5);
  ellipse(230,220,5,5);
  ellipse(230,230,5,5);
  ellipse(230,240,5,5);
  ellipse(240,220,5,5);
  ellipse(240,230,5,5);
  ellipse(215,225,5,5);
  ellipse(210,230,5,5);
  ellipse(205,175,5,5);
  ellipse(210,180,5,5);
  ellipse(240,170,5,5);
  ellipse(235,160,5,5);
  arc(247,200,15,15,HALF_PI,PI+HALF_PI,CHORD);
  //body
  noStroke();
  fill(25,51,0);
  rect(125,270,50,200,5);
  rect(225,270,50,200,5);
  //arm
  quad(225,270,225,310,355,arm1,355,arm2);
  quad(355,arm1,315,arm1,315,arm3,355,arm3);
  fill(0,0,0);
  ellipse(335,arm3-10,30,30);
  ellipse(65,455,30,30);
  fill(25,51,0);
  quad(125,270,125,330,45,430,45,370);
  rect(45,370,40,75);
  //machete
  stroke(160);
  strokeWeight(25);
  line(320,160,220,70);
  stroke(0,0,0);
  strokeWeight(20);
  line(345,190,325,170);

}
boolean machete=false;
void draw(){
  if(machete==false){
    for(int i=1;i<=5;i++){
      if (arm1==290 && arm2==250 && arm3==190){
        break;
      }else{
       arm1=arm1-1;
       arm2=arm2-1;
       arm3=arm3-1;
      }
    }
    size(1000,700);
    background(0,0,255);
    noStroke();
    fill(0,255,0);
    rect(0,600,1000,200);
    jason();
    victim();
  }else if (machete==true){
    jasonswing();
    beheaded();
  }
  }
void victim(){
  noStroke();
  fill(242,224,109);
  ellipse(500,300,95,110);
  fill(0,0,50);
  rect(450,550,100,200);
  fill(255,0,0);
  rect(350,370,300,40);
  rect(450,370,100,200,10);
  fill(242,224,109);
  quad(485,350,515,350,525,370,475,370);
  arc(500,370,50,50,0,PI,CHORD);
}
void mouseClicked(){
 machete=!machete; 
}
void jasonswing(){
 background(0,0,255);
 noStroke();
 fill(0,255,0);
 rect(0,600,1000,200);
 //head
  fill(242,224,109);
  ellipse(200,200,95,110);
  noStroke();
  //blackshirt/pants
  fill(0,0,0);
  rect(173,270,53,200);
  fill(242,224,109);
  quad(185,250,215,250,225,270,175,270);
  fill(0,0,51);
  rect(140,460,115,390,10);
  fill(242,224,109);
  arc(200,270,50,50,0,PI,CHORD);
  //mask
  fill(247,239,187);
  strokeWeight(1);
  stroke(0,0,0);
  ellipse(220,200,55,110);
  //nose
  triangle(235,200,243,215,235,215);
  fill(0,0,0);
  rect(152,196,45,15,5);
  noStroke();
  fill(200,0,0);
  triangle(225,180,243,180,235,190);
  //all of the holes in the mask
  strokeWeight(1);
  fill(0,0,0);
  ellipse(220,200,20,15);
  ellipse(220,160,5,5);
  ellipse(225,170,5,5);
  ellipse(225,180,5,5);
  ellipse(243,180,5,5);
  ellipse(230,187,5,5);
  ellipse(240,187,5,5);
  ellipse(230,220,5,5);
  ellipse(230,230,5,5);
  ellipse(230,240,5,5);
  ellipse(240,220,5,5);
  ellipse(240,230,5,5);
  ellipse(215,225,5,5);
  ellipse(210,230,5,5);
  ellipse(205,175,5,5);
  ellipse(210,180,5,5);
  ellipse(240,170,5,5);
  ellipse(235,160,5,5);
  arc(247,200,15,15,HALF_PI,PI+HALF_PI,CHORD);
  //body
  noStroke();
  fill(25,51,0);
  rect(125,270,50,200,5);
  rect(225,270,50,200,5);
  //arm
  fill(0,0,0);
  ellipse(65,455,30,30);
  fill(25,51,0);
  quad(125,270,125,330,45,430,45,370);
  rect(45,370,40,75);
  quad(275,270,275,380,325,450,345,420);
  fill(0,0,0);
  ellipse(340,440,30,30);
  //machete
  stroke(160);
  strokeWeight(25);
  line(360,462,460,552);
  stroke(0,0,0);
  strokeWeight(20);
  line(350,450,330,430);
}
int balldiameter=95;
void beheaded(){
  noStroke();
  fill(0,0,50);
  rect(450,550,100,200);
  fill(255,0,0);
  rect(350,370,300,40);
  rect(450,370,100,200,10);
  fill(242,224,109);
  quad(485,350,515,350,525,370,475,370);
  arc(500,370,50,50,0,PI,CHORD);
 ellipse(posX,posY,balldiameter,balldiameter);
 update();
}
int posX=550;
float posY=300;
int movementsize = 3;
float jumpsize = -0.5;
boolean onGround;
float gravity = 1.5;
float velocityY = 0.0;
void update(){
 posY = velocityY + posY;
 if(posY + (balldiameter/2) >= height/2){
   posY = (height/2) - balldiameter/2;
   onGround = true;
 }else{
   onGround = false;
}
}
void jump(){
  velocityY = -20.0;
}
