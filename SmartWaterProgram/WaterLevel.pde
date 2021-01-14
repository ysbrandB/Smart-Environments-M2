//The class where we will gather or emulate the data coming in
class WaterLevel{
  PVector pos;
  int breed;
  int hoog;
  int source;
  
  WaterLevel(int x, int y,int source){
  this.source=source;
  pos=new PVector(x,y);
  breed=60;
  hoog=300;
  }
  
 void show(int source){
 fill(255);
 rect(pos.x,pos.y,breed,hoog);
 fill(0,0,255);
 rect(pos.x, pos.y+(hoog/2-source/2), breed, source );
 }

}
