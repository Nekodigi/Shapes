int n = 6;
int size = 200;
boolean[] walls = {false, true, false, true, false, true};


void setup(){
  //fullScreen();
  size(500, 500);
  translate(width/2, height/2);
  polygon(0,0,n,size);
  strokeWeight(30);
  stroke(10);
  polygonLines(0,0,n,size,walls);
}