void setup(){
  size(1500,1000);
  background(0,100,255);
  fill(100,0,0);
  rect(150,150,20,300);
  fill(100,0,0);
  rect(250,150,20,300);
  noStroke();
  triangle(450,150,420,150,435,130);
  fill(255,255,255);
  arc(195,195,310,310,QUARTER_PI,TWO_PI,OPEN);
  fill(255,255,255);
  ellipseMode(CENTER);
  ellipse(200,200,300,300);
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(200,200,250,250);
  fill(255,255,255);
  ellipseMode(CENTER);
  ellipse(200,200,200,200);
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(200,200,150,150);
  fill(255,255,255);
  ellipseMode(CENTER);
  ellipse(200,200,100,100);
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(200,200,50,50);
  stroke(0,0,0);
  strokeWeight(5);
  stroke(75,0,0);
  strokeWeight(15);
  arc(1200,600,500,600,HALF_PI,PI+HALF_PI,OPEN);
  fill(0,255,0);

}
void draw(){
  background(0,100,255);
  fill(0,150,0);
  stroke(0,0,0);
  //shape made to create the ground 
  beginShape();
  vertex(0, 445);
  vertex(1500, 445);
  vertex(1500, 1500);
  vertex(0, 1500);
  endShape(CLOSE);
  strokeWeight(2);
  stroke(0,0,0);
  fill(100,0,0);
  rect(150,150,20,300);
  fill(100,0,0);
  rect(250,150,20,300);
  noStroke();
  triangle(275,465,245,465,260,445);
  noStroke();
  triangle(175,465,145,465,160,445);
  fill(255,255,255);
  stroke(0,0,0);
  //the handle of the bow
  arc(195,195,310,310,QUARTER_PI,TWO_PI,OPEN);
  fill(255,255,255);
  //ellipses were used to build the target
  ellipseMode(CENTER);
  ellipse(200,200,300,300);
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(200,200,250,250);
  fill(255,255,255);
  ellipseMode(CENTER);
  ellipse(200,200,200,200);
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(200,200,150,150);
  fill(255,255,255);
  ellipseMode(CENTER);
  ellipse(200,200,100,100);
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(200,200,50,50);
  stroke(0,0,0);
  strokeWeight(15);
  point(250,200);
  point(200,300);
  beginShape(POINTS);
  vertex(150, 170);
  vertex(200, 220);
  vertex(200, 180);
  vertex(150, 280);
  endShape();
  stroke(0,255,0);
  strokeWeight(5);
  //lines that make up the arrows already shot in the target
  beginShape(LINES);
  vertex(250, 200);
  vertex(450, 200);
  vertex(400, 300);
  vertex(200, 300);
  endShape();
  noFill();
  stroke(75,0,0);
  strokeWeight(15);
  arc(1200,600,500,600,HALF_PI,PI+HALF_PI,OPEN);
  stroke(0,0,0);
  strokeWeight(5);
  //lines that make up the bowstrings 
  line(1200,300,mouseX,mouseY); 
  stroke(0,0,0);
  strokeWeight(5);
  line(1200,900,mouseX,mouseY);
  noFill();
  strokeWeight(5);
  stroke(0,255,0);
  //the visual on the target showing where the user is trying to aim
  beginShape(TRIANGLE_FAN);
  vertex(197.5, 200);
  vertex(197.5, 165); 
  vertex(232, 200); 
  vertex(197.5, 235); 
  vertex(162, 200); 
  vertex(197.5, 165); 
  endShape();
  stroke(0,255,0);
  //arrow in the bow
  rect(mouseX,mouseY,-400,0);

  
}
