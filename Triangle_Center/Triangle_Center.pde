float r = 200;
int n = 2;

void setup(){
  size(500, 500);
  translate(width/2, height/2);
  float goffy = r;;
  for(float i = 0; i <= n; i++){
    float y = map(i, 0, n, 0, r*3/2)-goffy;
    for(float j = 0; j <= i; j++){
      float x = j*r*sqrt(3)/n-r*sqrt(3)*i/n/2;
      ellipse(x, y, 50, 50);
    }
  }
  fill(0);
  float offy = r*3/2/n*2/3;
  for(float i = 0; i < n; i++){
    float y = map(i, 0, n, 0, r*3/2)-goffy+offy;
    for(float j = 0; j <= i; j++){
      float x = j*r*sqrt(3)/n-r*sqrt(3)*i/n/2;
      ellipse(x, y, 50, 50);
    }
  }
}
