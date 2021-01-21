class Graph{
  IncomingLine incomingLine;
  WaterLine waterLine;
  OutgoingLine outgoingLine;
  PVector pos;
  int breed,hoog;
Graph(int x,int y, int breed,int hoog){
  pos=new PVector(x,y);
  this.breed=breed;
  this.hoog=hoog;
incomingLine=new IncomingLine(x,y,breed,hoog);
waterLine= new WaterLine(x,y,breed,hoog);
outgoingLine=new OutgoingLine(x,y,breed,hoog);
}
void show(){
  push();
  translate(pos.x,pos.y);
  fill(255);
  rectMode(CORNER);
rect(0,0-hoog,breed,hoog);
incomingLine.show();
waterLine.show();
outgoingLine.show();
pop();
}
}
