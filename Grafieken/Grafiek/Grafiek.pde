JSONObject json;
JSONArray blobData;
Blob[] blobs;
PVector lastPos;
int heighestValue;
Graph graph;
void setup() {
  size(1000, 500);
  heighestValue=0;
  loadData();
  lastPos=new PVector(10, 1);
  graph=new Graph();
}

void draw() {
  loadData();
  background(100);
  fill(255);
  graph.show();
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
    if (incoming>=heighestValue) {
      heighestValue=incoming;
    }
    println(heighestValue);
  }
}
