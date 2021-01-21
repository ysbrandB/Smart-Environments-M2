JSONObject json;
JSONArray blobData;
Blob[] blobs;
PVector lastPos;
int heighestValue;
void setup() {
  size(1000, 500);
  heighestValue=0;
  loadData();
  lastPos=new PVector(1, 1);
}

void draw() {
  int resolution=width/blobs.length;
  background(100);
  fill(255);
  push();
  translate(0, height/2);
  for (int i=0; i<blobs.length; i++) {
    fill(255);
    float y;
    if (blobs[i].incoming>0) {
      y=0-blobs[i].incoming/heighestValue*resolution;
      circle(i*resolution, y, 20);
    } else {
      circle(i*resolution, 0, 20);
      y=0;
    }
    if(i<blobs.length-1){
    line(lastPos.x, lastPos.y, i*resolution, y);
    }
    fill(255,0,0);
    text(i,i*resolution,y);
    lastPos.x=i*resolution;
    lastPos.y=y;
  }
  pop();
}

void loadData() {
  json=loadJSONObject("../../SmartWaterProgram/data/data.json");
  blobData = json.getJSONArray("blobs");
  blobs = new Blob[blobData.size()];
  for (int i = 0; i < blobData.size(); i++) {
    // Get each object in the array
    JSONObject blob = blobData.getJSONObject(i); 
    // Get a position object
    JSONObject data = blob.getJSONObject("data");
    // Get x,y from position
    int water = data.getInt("water");
    int incoming = data.getInt("incoming");
    int outgoing = data.getInt("outgoing");
    // Put object in array
    blobs[i] = new Blob(water, incoming, outgoing);
    println(incoming);
    println(blobs[i].incoming);
    if (incoming>=heighestValue) {
      heighestValue=incoming;
    }
    println(i);
  }
}
