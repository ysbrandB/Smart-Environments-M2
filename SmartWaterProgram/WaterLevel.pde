//The class where we will gather or emulate the data coming in
class WaterLevel{
  PVector pos;
  
  WaterLevel(int x, int y){
  pos=new PVector(x,y);
  }
  
 void show(){
 rect(pos.x,pos.y,pos.x,pos.y);
 }

}
