//The class where we will gather or emulate the data coming in
class WaterLevel{
  PVector pos;
  int breed;
  int hoog;
  int source;
  String tekst;
  WaterLevel(int x, int y,int source, String tekst){
  this.source=source;
  pos=new PVector(x,y);
  breed=60;
  hoog=300;
  this.tekst=tekst;
  }
  
 void show(int source){
   push();
  
   translate(pos.x,pos.y);
 fill(255);
 rect(0,0,breed,hoog);
  if(source>0){
 fill(0,0,255);
 rect(0, (hoog/2-source/2), breed, source );
  }
 fill(255);
 text(tekst,0-breed/2,20+hoog/2);
 pop();
 }
}
