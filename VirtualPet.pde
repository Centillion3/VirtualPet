import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

void setup(){
  background(0, 0, 0);
  size(400, 400);
  arduino = new Arduino(this, Arduino.list()[2], 57600);
}

public static int enlarge(int y, int initial, double r){
  return (int)(initial + (r * y));
}
void draw(){
  //main
  fill(color(0, 128, 255));
  ellipse(200, 200, 300, 300);
  
  fill(color(255, 255, 255));
  ellipse(200, 225, 250, 250);
  
  //eyes
  ellipse(160, 105, 75, 80);
  line(155, 115, 170, 100);
  line(170, 100, 185, 115);
  
  ellipse(240, 105, 75, 80);
  line(245, 115, 230, 100);
  line(230, 100, 215, 115);
  
  //nose
  fill(color(255, 51,  51));
  int y = arduino.analogRead(5);
  ellipse(200, 150, enlarge(y, 50, .5), enlarge(y, 50, .5));
  
  fill(color(255, 255, 255));
  ellipse(195 - .05 * enlarge(y, 50, .025), 145 - .05 * enlarge(y, 50, .025), enlarge(y, 20, .5), 
  enlarge(y, 20, .5));
  
  //facial features
  line(200, 175 + (Math.abs(20 - enlarge(y, 20, .5)))/2, 200, 275);
  noFill();
  arc(200, 175, 200, 200, PI/6, (5*PI)/6);
  
  line(175, 200, 100, 200);
  line(175, 215, 100, 235);
  line(175, 185, 100, 165);
  
  line(225, 200, 300, 200);
  line(225, 215, 300, 235);
  line(225, 185, 300, 165);
  
  //bell
  fill(color(255, 51, 51));
  rect(100, 325, 200, 30);
  
  fill(color(255, 255, 0));
  ellipse(200, 360, 50, 50);
  fill(color(0, 0, 0));
  ellipse(200, 370, 10, 10);
  line(200, 375, 200, 385);
}
