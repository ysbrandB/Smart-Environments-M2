//The class where we will gather or emulate the data coming in
class Input{
  Input(){
  
  }
  void update(){
  currentWater+=int(random(-100,100));
  currentIncoming+=int(random(-100,100));
  currentOutgoing+=int(random(-100,100));
  json.setInt("currentLevel", currentWater);
  saveJSONObject(json, "data/new.json");
  }

}
