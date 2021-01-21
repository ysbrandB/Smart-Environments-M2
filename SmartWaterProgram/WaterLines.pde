class WaterLine{
  PVector lastPos;
  PVector pos;
  int breed, hoog;
WaterLine(int x, int y, int breed, int hoog){
  pos=new PVector(x,y);
lastPos=new PVector(x,y);
this.breed=breed;
this.hoog=hoog;
}
void show(){
    int resolution=breed/blobs.length;
   push();
  translate(0, 0);
  for (int i=0; i<blobs.length; i++) {
    fill(255);
    float y;
     fill(0,0,255);
    if (blobs[i].water>0) {
      y=(-blobs[i].water/heighestValue*(hoog-hoog/7))-10;
      circle(i*resolution, y, 5);
    } else {
      circle(i*resolution, 0, 5);
      y=0;
    }
    if(i!=0){
    line(lastPos.x, lastPos.y, i*resolution, y);
    }
   
    lastPos.x=i*resolution;
    lastPos.y=y;
  }
  pop();
}
}
