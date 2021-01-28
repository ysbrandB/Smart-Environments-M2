//The class where we will gather or emulate the data coming in
class Input{
  int maxWaterSensorFlow;
  Input(){
  //Litre/min
  maxWaterSensorFlow=1023;
  maxWaterSensorFlow=maxWaterSensorFlow/60;
  }
  void updateIncoming(){
    currentIncoming=value[0]/60*1000;
  }
  void updateWaterLevel(){
  lastWater=currentWater;
  currentWater=map(value[1],0,1023,0,waterTankSize);
  //currentWater=map(arduino.analogRead(1),0,1023,0,waterTankSize);
  }
  void updateOutgoing(){
  currentOutgoing=lastWater-currentWater-currentIncoming;
  }
}
