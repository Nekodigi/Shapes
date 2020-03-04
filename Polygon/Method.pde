void polygon(float x, float y, int n, float r) {
  beginShape();
  for (float i = 0; i < n; i++) {
    vertex(x+sin(i/n*TWO_PI)*r, y-cos(i/n*TWO_PI)*r);
  }
  endShape();
}

void polygonLines(float x, float y, int n, float r, boolean[] walls) {
  PVector[] points = new PVector[n];
  for (float i = 0; i < n; i++) {
    points[floor(i)] = new PVector(x+sin(i/n*TWO_PI)*r, y-cos(i/n*TWO_PI)*r);
  }
  for (int i = 0; i < n; i++) {
    if (walls[i]) {
      stroke(0);
    } else {
      noStroke();
    }
    lineVec(points[i], points[(i+1)%n]);
  }
}

void lineVec(PVector a, PVector b) {
  line(a.x, a.y, b.x, b.y);
}