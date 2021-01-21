class Output {
  JSONArray blobData;
  Output() {
    saveData();
    loadData();
  }
  void loadData() {
    json=loadJSONObject("data.json");
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
      if(water>=heighestValue){
      heighestValue=water;}
      if(incoming>=heighestValue){
      heighestValue=incoming;}
      if(outgoing>=heighestValue){
      heighestValue=outgoing;}
    }
  }

  void saveData() {
    json=loadJSONObject("data.json");
    blobData = json.getJSONArray("blobs");
    //JSONArray newBlobs=new JSONArray();

    // Create a new JSON blob object
    JSONObject newBlob = new JSONObject();

    // Create a new JSON position object
    JSONObject data = new JSONObject();
    data.setInt("water", int(currentWater));
    data.setInt("incoming", int(currentIncoming));
    data.setInt("outgoing", int(currentOutgoing));

    // Add data to blob
    newBlob.setJSONObject("data", data);

    JSONObject time = new JSONObject();
    time.setInt("seconds", second());
    time.setInt("minutes", minute());
    time.setInt("hours", hour());
    newBlob.setJSONObject("time", time);
    println("saving");
    blobData.append(newBlob);

    JSONObject blob=new JSONObject();
    blob.setJSONArray("blobs", blobData);
    saveJSONObject(blob, "data/data.json");

    loadData();
  }
}
