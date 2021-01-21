//The class where we will gather or emulate the data coming in
class WaterLevel{
  PVector pos;
  float breed;
  float hoog;
  float source;
  String tekst;
  color c;
  WaterLevel(float x, float y,float source, String tekst, color c){
  this.source=source;
  pos=new PVector(x,y);
  breed=60;
  hoog=300;
  this.tekst=tekst;
  this.c=c;
  }
  
 void show(float source, float reference){
   push();
   translate(pos.x,pos.y);
 
 //outline
 rect(0,0,breed,hoog);
 //level
  if(source>0){
 fill(0,0,255);

 float newHoogte=source/reference*hoog;
 rect(0,hoog/2-(newHoogte/2),breed, newHoogte);
  }
  //tekst
 fill(c);
 text(tekst,0-breed/2,20+hoog/2);
 //percentage lijntjes
 fill(255);
 for(int i=0; i<10;i++){
   line(-breed/2,+hoog/2-i*(hoog/10) ,breed/2,+hoog/2-i*(hoog/10) ) ;
   text(i*10+"%",breed/2+10,+hoog/2-i*(hoog/10));
 }
 pop();
 }
}
