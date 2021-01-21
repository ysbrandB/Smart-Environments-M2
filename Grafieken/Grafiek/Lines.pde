class Lines{
Lines(){}

void show(){
    int resolution=width/blobs.length;
   push();
  translate(0, height-height/3);
  for (int i=0; i<blobs.length; i++) {
    fill(255);
    float y;
    if (blobs[i].incoming>0) {
      y=(-blobs[i].incoming/heighestValue*(height/2))-10;
      circle(i*resolution, y, 5);
    } else {
      circle(i*resolution, 0, 5);
      y=0;
    }
    if(i!=0){
    line(lastPos.x, lastPos.y, i*resolution, y);
    }
    fill(255,0,0);
    lastPos.x=i*resolution;
    lastPos.y=y;
  }
  pop();
}
}
