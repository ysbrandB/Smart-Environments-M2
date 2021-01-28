//The class where we will gather or emulate the data coming in
class Input{
  int maxWaterSensorFlow;
  Input(){
  //Litre/min
  maxWaterSensorFlow=1023;
  maxWaterSensorFlow=maxWaterSensorFlow/60;
  }
  void updateIncoming(){
    println("Data 2:"+arduino.digitalRead(2));
  //currentIncoming=map(arduino.digitalRead(2),0,1,0,1);
  }
  void updateWaterLevel(){
  lastWater=currentWater;
  currentWater=map(arduino.analogRead(1),0,1023,0,waterTankSize);
  }
  void updateOutgoing(){
  currentOutgoing=lastWater-currentWater-currentIncoming;
  }
}
