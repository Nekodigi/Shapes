ArrayList<Vertex> vertices;
float len = 1000;
float r = 1000;
int n = 2;
float range = 0.1;
boolean mode1 = true;

void setup(){
  fullScreen();
  strokeWeight(20);
  reset();
}

void keyPressed(){
  if(keyCode == UP){
    n++;
    reset();
  }else if(keyCode == DOWN){
    n--;
    reset();
  }
  if(key == 't'){
    mode1 = !mode1;
  }
}

void reset(){
  vertices = new ArrayList<Vertex>();
  for(float i = 0; i < len; i++){
    float theta = map(i, 0, len, 0, TWO_PI);
    vertices.add(new Vertex(polygon_sample(i/len, n, r), new PVector(cos(theta)*r, sin(theta)*r)));
  }
}

void draw(){
  background(255);
  float off = float(frameCount)/200;
  off = abs(off%2-1)*1.1;
  translate(width/2, height/2);
  strokeJoin(ROUND);
  beginShape();
  for(int i = 0; i < len; i++){
    Vertex vert = vertices.get(i);
    if(mode1) vert.fac = EaseInOutCubic(0, 1, constrain((i/len-1+off)/range, 0, 1));
    else vert.fac = EaseInOutCubic(0, 1, off);
    PVector p = vert.get();
    vertex(p.x, p.y);
  }
  endShape(CLOSE);
}