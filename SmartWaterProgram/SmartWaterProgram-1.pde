//A program written by team Obama to have an insight into the water environment and sustainability of a container.
int currentWater;
int currentIncoming;
int currentOutgoing;

JSONObject json;
Input input;
WaterLevel waterlevel;
WaterLevel incoming;
WaterLevel outgoing;

void setup(){
input= new Input();  
waterlevel= new WaterLevel(width/2, height/2, currentWater);
incoming= new WaterLevel(width-width/3, height/2, currentIncoming);
outgoing= new WaterLevel(width/3,height/2, currentOutgoing);
size(1000,500);
rectMode(CENTER);



currentWater=100;
json = new JSONObject();
}
void draw(){
  background(255);
  waterlevel.show(currentWater);
  incoming.show(currentIncoming);
  outgoing.show(currentOutgoing);
}
void mousePressed(){
 input.update();
}
