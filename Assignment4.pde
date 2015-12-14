//cheer change variables
int cheer;
int diffcheer;
void setup(){
  size(1300,1000);
  background(0,200,255); 
  //blue speaker
  fill(255,203,166);
  ellipse(300,500,100,100);
  fill(100,0,0);
  rect(400,570,100,200);
  triangle(400,570,500,570,500,550);
  fill(0,0,150);
  rect(250,550,100,200);
  //speech bubbles
  fill(255,255,255);
  rect(400,30,500,100);
  ellipse(450,400,150,100);
  ellipse(1050,400,200,100);
  noStroke();
  triangle(400,430,410,430,390,480);
  triangle(1100,430,1110,430,1110,480);
  //words
  fill(0,0,0);
  textSize(35);
  text("2016 Presidential Debate", 450,100);
  text("Logic",410,410);
  text("I have $$",980,410);
  //red speaker
  stroke(0,0,0);
  strokeWeight(1);
  fill(255,203,166);
  ellipse(1200,500,100,100);
  fill(100,0,0);
  rect(1000,570,100,200);
  triangle(1000,570,1000,550,1100,570);
  fill(250,0,0);
  rect(1150,550,100,200);
  //crowd
  fill(250,0,0);
  rect(600,550,100,200);
  fill(255,203,166);
  ellipse(650,500,100,100);
  fill(250,0,0);
  rect(700,550,100,200);
  fill(255,203,166);
  ellipse(750,500,100,100);
  fill(255,203,166);
  ellipse(850,500,100,100);
  fill(250,0,0);
  rect(800,550,100,200);
  
  
}
void draw(){
  if (cheer == 1){
    fill(255,255,255);
    ellipse(700,350,150,100);
    noStroke();
    triangle(700,380,690,380,680,420);
    fill(0,0,0);
    textSize(35);
    text("WOO!",850,300);
  }else{
    stroke(0,0,0);
    line(900,300,850,450);
    fill(255,255,255);
    stroke(1);
    ellipse(900,300,150,100);
    fill(0,0,0);
    textSize(35);
    text("YAY!",650,350);
  }

}
void mousePressed() {
   cheer = cheer + 1;
   diffcheer = (cheer % 2);
}
