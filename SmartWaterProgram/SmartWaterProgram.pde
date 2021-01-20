//A program written by team Obama to have an insight into the water environment and sustainability of a container.
int currentWater;
int currentIncoming;
int currentOutgoing;

JSONObject json;
Input input;
WaterLevel waterlevel;
WaterLevel incoming;
WaterLevel outgoing;

//control p5
import controlP5.*;
ControlP5 cp5;
String textValue = "";
boolean toggleValue = false;

void setup(){
//control p5
PFont font = createFont("arial",20);
cp5 = new ControlP5(this);
  cp5.addTextfield("City")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
    cp5.addTextfield("Diameter")
     .setPosition(20,180)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
     cp5.addTextfield("Height")
     .setPosition(20,260)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
       cp5.addTextfield("Volume")
     .setPosition(20,400)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
      // create a toggle and change the default look to a (on/off) switch look
  cp5.addToggle("Use calculated or input volume")
     .setPosition(40,350)
     .setSize(50,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     ;
  
input= new Input();  
waterlevel= new WaterLevel(width/2, height/2, currentWater, "Water in tank");
incoming= new WaterLevel(width/3, height/2, currentIncoming,"Water coming in");
outgoing= new WaterLevel(width-width/3,height/2, currentOutgoing, "Outgoing water");
size(1000,500);
rectMode(CENTER);

currentWater=100;
json = new JSONObject();
}
void draw(){
    background(30);
  //control p5
  fill(255);
  text("Input the city you are in:",20,80);
  textValue=cp5.get(Textfield.class,"City").getText();
  text(textValue, 20,180);
  
  waterlevel.show(currentWater);
  incoming.show(currentIncoming);
  outgoing.show(currentOutgoing);
}
void keyPressed(){
 input.update();
}
