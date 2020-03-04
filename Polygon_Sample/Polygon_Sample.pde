int n = 6;
int r = 200;

void setup(){
   size(500, 500);
   translate(width/2, height/2);
   for(float i = 0; i < 1; i+=0.02){
     PVector p = polygon_sample(i, n, r);
     ellipse(p.x, p.y, 20, 20);
   }
}