note note;
note otherNote;
doubleNote doubleNote;
doubleNote otherdouble;
boolean music = true;
boolean back = true;
PImage shadows;
PImage gates;
void setup(){
  background(0,0,255);
  size(800,600);
  String url = "https://upload.wikimedia.org/wikipedia/commons/2/29/Avenged-Sevenfold-BergenCalling-2011-Christian_Misje-5528.jpg";
  shadows = loadImage(url, "jpg");
  String page = "https://c1.staticflickr.com/3/2918/14519437021_2aa309cfb6_b.jpg";
  gates = loadImage(page, "jpg");
  note = new note();
  otherNote = new note();
  doubleNote = new doubleNote();
  otherdouble = new doubleNote();
}
void draw(){
if (music == true){
  if (back == true){
  background(0,0,0);
  }else if (back == false){
    background(255,0,0);
  }
  image(shadows, 100, 0);
  fill(255,255,255);
  textSize(50);
  text("Chorus", 600,100);
  note.move();
  note.play();
  otherNote.move();
  otherNote.play();
  doubleNote.move();
  doubleNote.play();
  otherdouble.move();
  otherdouble.play();
}else if(music == false){
  background(0,0,255);
  image(gates, 0,0);
  fill(255,255,255);
  textSize(50);
  text("Guitar Solo", 100, 100);
  note.move();
  note.play();
  otherNote.move();
  otherNote.play();
  doubleNote.move();
  doubleNote.play();
  otherdouble.move();
  otherdouble.play();
}
}
class note{
  int centerX, centerY, offset1, offset2;
  
  note(){
   centerX = round(random(0, width));
   centerY = round(random(0, height));
   offset1 = 100;
   offset2 = 100;
  }
  note(int centerX2, int centerY2, int offset_1, int offset_2){
    centerX = centerX2;
    centerY = centerY2;
    offset1 = offset_1;
    offset2 = offset_2;
  }
  void play(){
    fill(255,255,255);
    ellipse(centerX, centerY, 50, 50);
    strokeWeight(10);
    line(centerX+25, centerY, centerX+25, centerY-offset2);
  }
  void move(){
    centerX = round(random(-10,10)) + centerX;
    centerY = round(random(-10,10)) + centerY;
  }
}
class doubleNote{
  int centerX, centerY, offset1, offset2;
  
  doubleNote(){
   centerX = round(random(0, width));
   centerY = round(random(0, height));
   offset1 = 100;
   offset2 = 100;
  }
   doubleNote(int centerX2, int centerY2, int offset_1, int offset_2){
    centerX = centerX2;
    centerY = centerY2;
    offset1 = offset_1;
    offset2 = offset_2;
  }
  void play(){
    fill(255,255,255);
    stroke(255,255,255);
    ellipse(centerX, centerY, 50, 50);
    strokeWeight(10);
    line(centerX+25, centerY, centerX+25, centerY-offset2);
    ellipse(centerX+100, centerY, 50, 50);
    strokeWeight(10);
    line(centerX+125, centerY, centerX+125, centerY-offset2);
    line(centerX+25, centerY-offset1, centerX+125, centerY-offset2);
  }
  void move(){
    centerX = round(random(-10,10)) + centerX;
    centerY = round(random(-10,10)) + centerY;
  }
}

void mouseClicked(){
   music = !music;
   
}
void keyPressed(){
   back = !back;
}
