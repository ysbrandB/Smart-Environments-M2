//A program written by team Obama to have an insight into the water environment and sustainability of a container.
int currentWater;
JSONObject json;
Input input;
WaterLevel waterlevel;

void setup(){
input= new Input();  
waterlevel= new WaterLevel();  
size(1000,500);
background(255);



waterLevel=0;
json = new JSONObject();
json.setInt("currentLevel", currentWater);
saveJSONObject(json, "data/new.json");
}
void draw(){
  
}
void mousePressed(){
 input.update();
}
