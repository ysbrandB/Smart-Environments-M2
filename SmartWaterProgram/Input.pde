//The class where we will gather or emulate the data coming in
class Input{
  int maxWaterSensorFlow;
  Input(){
  //Litre/min
  maxWaterSensorFlow=1023;
  maxWaterSensorFlow=maxWaterSensorFlow/60;
  }
  void updateIncoming(){
  //currentIncoming=map(arduino.digitalRead(2),0,1,0,1);
  }
  void updateWaterLevel(){
  lastWater=currentWater;
  //currentWater=map(arduino.analogRead(1),0,1023,0,waterTankSize);
  }
  void updateOutgoing(){
  //currentOutgoing=lastWater-currentWater-currentIncoming;
  }
  void serialEvent(int serial) 
{ 
  try {    // try-catch because of transmission errors
    if (serial != NEWLINE) { 
      input += char(serial);
    } else {
      // The first character tells us which axis or button this value is for
      char c = input.charAt(0);
      // Remove it from the string
      input = input.substring(1);
      // Discard the carriage return at the end of the buffer
      input = input.substring(0, input.length()-1);
      // Parse the String into an integer
      for (int z=0; z<header.length; z++) {
        if (c == header[z]) {
          value[z] = Integer.parseInt(input);
        }
      }
      input = "";         // Clear the value of "input"
    }
  }
  catch(Exception e) {
    println("no valid data");
  }
}
}
