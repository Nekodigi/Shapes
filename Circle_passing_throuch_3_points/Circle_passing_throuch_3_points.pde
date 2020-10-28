PVector[] ps = new PVector[3];

void setup(){
  size(500, 500);
  strokeWeight(5);
}

float[] solve(PVector[] v){
  float[][] A = new float[3][4];
  for(int i = 0; i < 3; i++){
    A[i][0] = v[i].x;
    A[i][1] = v[i].y;
    A[i][2] = 1;
    A[i][3] = -(v[i].x*v[i].x + v[i].y*v[i].y);
  }
  return simultaSolve(A);
}

void draw(){
  background(255);
  float angle = float(frameCount)/60;
  ps[0] = PVector.fromAngle(angle).mult(width/4).add(width/4, height/4);
  ps[1] = PVector.fromAngle(angle+TWO_PI/3).mult(width/4).add(width/4*3, height/4*3);
  ps[2] = PVector.fromAngle(angle+TWO_PI/3*2).mult(width/4).add(width/2, height/4*3);
  float[] solved = solve(ps);
  println(solved);
  float x = -solved[0]/2;
  float y = -solved[1]/2;
  PVector res = circle3p(ps[1], ps[2], ps[0]);
  x = res.x;
  y = res.y;
  float r = PVector.dist(ps[0], new PVector(x, y));
  ellipse(x, y, r*2, r*2);
  ellipse(ps[0].x, ps[0].y, 20, 20);
  ellipse(ps[1].x, ps[1].y, 20, 20);
  ellipse(ps[2].x, ps[2].y, 20, 20);
}

float[] simultaSolve(float[][] a){
  float t = 0;
  for(int k = 0; k < a.length; k++){
    for(int i = k + 1; i < a.length; i++){
      t = a[i][k] / a[k][k];
      for(int j = k + 1; j <=a.length; j++){
        a[i][j] -= a[k][j] * t;
      }
    }
  }
  
  for(int i = a.length-1; i >= 0; i--){
    t = a[i][a.length];
    for(int j = i + 1; j < a.length; j++) t -= a[i][j] * a[j][a.length];
    a[i][a.length] = t / a[i][i];
  }
  float[] result = new float[a.length];
  for(int k = 0; k < a.length; k++){
    result[k] = a[k][a.length];
  }
  return result;
}
