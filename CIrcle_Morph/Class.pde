class Vertex{
  PVector p1;
  PVector p2;
  float fac;
  
  Vertex(PVector p1, PVector p2){
    this.p1 = p1;
    this.p2 = p2;
  }
  
  PVector get(){
    return PVector.lerp(p1, p2, fac);
  }
}