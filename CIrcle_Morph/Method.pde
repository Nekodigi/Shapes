PVector polygon_sample(float fac, float n, float r){
  fac *= n;
  for(float i = 0; i < n; i++){
    if(i <= fac && fac < i+1){
      float t = i+1;
      PVector p1 = new PVector(cos(i/n*TWO_PI)*r, sin(i/n*TWO_PI)*r);
      PVector p2 = new PVector(cos(t/n*TWO_PI)*r, sin(t/n*TWO_PI)*r);
      return PVector.lerp(p1, p2, fac-i);
    }
  }
  return null;
}

float EaseInOutCubic(float start, float end, float t){
  end -= start;//calculate difference
  return t<0.5 ? end*4*t*t*t+start : end*(4*(t-1)*(t-1)*(t-1)+1)+start;
}