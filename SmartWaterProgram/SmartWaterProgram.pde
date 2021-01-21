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
String diameter = "";
String hoogte = "";
String volume = "";
boolean CalculatedORinput = false;
int waterTankSize;
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
  cp5.addToggle("CalculatedORinput")
     .setPosition(40,350)
     .setSize(50,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     ;
  
input= new Input();  
waterlevel= new WaterLevel(400, height/2, currentWater, "Water in tank");
incoming= new WaterLevel(300, height/2, currentIncoming,"Water incoming");
outgoing= new WaterLevel(500,height/2, currentOutgoing, "Water outgoing");
size(1000,500);
rectMode(CENTER);

currentWater=100;
json = new JSONObject();
}
void draw(){
  //update alle velden
  textValue=cp5.get(Textfield.class,"City").getText();
  diameter=cp5.get(Textfield.class,"Diameter").getText();
  hoogte=cp5.get(Textfield.class,"Height").getText();
  volume=cp5.get(Textfield.class,"Volume").getText();
  if(CalculatedORinput==true){
   waterTankSize=int(cp5.get(Textfield.class,"Volume").getText());
  }else{
    waterTankSize=PI*sq(float(cp5.get(Textfield.class,"Diameter").getText()))*int(cp5.get(Textfield.class,"Volume").getText());
  }
    background(30);
  //control p5
  fill(255);
  text("Input the city you are in:",20,80);
  text(textValue, 20,180);
  
  waterlevel.show(currentWater);
  incoming.show(currentIncoming);
  outgoing.show(currentOutgoing);
}
void keyPressed(){
 input.update();
}
