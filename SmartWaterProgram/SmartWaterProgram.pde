
//A program written by team Obama to have an insight into the water environment and sustainability of a container.
float currentWater;
float lastWater;
float currentIncoming;
float currentOutgoing;
float averageWater;
int currentDay;
JSONObject json;
Input inputobject;
Serial port; // make the port object
Blob[] blobs;
int heighestValue;
Graph graph;
WaterLevel waterlevel;
WaterLevel incoming;
WaterLevel outgoing;
Output output;
//firmata
import cc.arduino.*;
import processing.serial.*;
Arduino arduino;
//make all the neccessary variables for the serial function 
char header[] = {'F', 'P'};
int NEWLINE = 10; 
int value[] = new int[2];    // array of current received values
String input="";

//control p5
import controlP5.*;
ControlP5 cp5;
String textValue = "";
String diameter = "";
String hoogte = "";
String volume = "";

JSONObject requestCord;
float lat, lon;
String label="";

boolean CalculatedORinput = false;
float waterTankSize;
boolean save;
void setup() {
    //Port setup
  println("Available com ports");
  port = new Serial(this, Serial.list()[0], 9600);  // open the port!
  frameRate(60);
  //control p5
  PFont font = createFont("arial", 20);
  cp5 = new ControlP5(this);
  cp5.addTextfield("Location")
    .setPosition(20, 100)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0))
    ;
  cp5.addTextfield("Diameter")
    .setPosition(20, 180)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0))
    ;
  cp5.addTextfield("Height")
    .setPosition(20, 260)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0))
    ;
  cp5.addTextfield("Volume")
    .setPosition(20, 400)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0))
    ;
  // create a toggle and change the default look to a (on/off) switch look
  cp5.addToggle("CalculatedORinput")
    .setPosition(40, 350)
    .setSize(50, 20)
    .setValue(true)
    .setMode(ControlP5.SWITCH)
    ;

  inputobject= new Input();  
  output=new Output();
  waterlevel= new WaterLevel(400, height/2, currentWater, "Water in tank", color(0, 0, 255));
  incoming= new WaterLevel(300, height/2, currentIncoming, "Water incoming", color(255, 0, 0));
  outgoing= new WaterLevel(500, height/2, currentOutgoing, "Water outgoing", color(0, 255, 0));
  graph=new Graph(650, height/2, 300, 200);
  size(1000, 500);
  rectMode(CENTER);
  waterTankSize=10;
  currentWater=100;
  averageWater=0;
  json = new JSONObject();
  currentDay=day();
  save=true;
}
void draw() {
  if (currentDay!=day()&&save) {
    output.saveData();
    currentDay=day();
  }
  
  if (CalculatedORinput==true) {
    waterTankSize=int(cp5.get(Textfield.class, "Volume").getText());
  } else {
    waterTankSize=PI*sq(float(cp5.get(Textfield.class, "Diameter").getText()))*int(cp5.get(Textfield.class, "Volume").getText());
  }
  //update alle inputs
  inputobject.updateIncoming();
  inputobject.updateOutgoing();
  inputobject.updateWaterLevel();
  background(30);
  //control p5
  fill(255);
  text("Input the city you are in:", 20, 80);

  //shows the location entered
  fill(255);
  textSize(20);
  int textBoxX = 270;
  int textBoxY = 40;
  text(label, textBoxX, textBoxY);
  text(lat+" | "+lon, textBoxX, textBoxY+30);

  waterlevel.show(currentWater, waterTankSize);
  incoming.show(currentIncoming, inputobject.maxWaterSensorFlow);
  outgoing.show(currentOutgoing, waterTankSize);
  graph.show();
  textSize(20);
  text("The average amount of water over ", 600, 320);
  text("the last "+blobs.length+" days is "+averageWater+"Liter.", 600, 350);
  text("This means you can drink daily roughly", 600, 380);
  text(averageWater*4+" cups of water!", 600, 410);
  textSize(12);
}
void mousePressed() {
  output.saveData();
}

//runs after pushing a box entry
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
      +theEvent.getName()+"': "
      +theEvent.getStringValue()
      );

//if location is given get coordinates from positionstack API
    if ("Location".equals(theEvent.getName())) {
      
      //update alle velden
  textValue=cp5.get(Textfield.class, "Location").getText();
  diameter=cp5.get(Textfield.class, "Diameter").getText();
  hoogte=cp5.get(Textfield.class, "Height").getText();
  volume=cp5.get(Textfield.class, "Volume").getText();
  
      String url = "http://api.positionstack.com/v1/forward?access_key=1e1ece6c8aba982b21272d8e44d251d6&query=" + theEvent.getStringValue();
      println(url);

      JSONObject LoadJSON = new JSONObject();
      JSONArray list;

      LoadJSON = loadJSONObject(url);
      list = LoadJSON.getJSONArray("data");
      LoadJSON = list.getJSONObject(0);
      lon = LoadJSON.getFloat("longitude");
      lat = LoadJSON.getFloat("latitude");
      label = LoadJSON.getString("label");
      println(lat+" | "+lon);
    }
  }
}
