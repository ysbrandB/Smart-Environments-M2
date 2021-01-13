class Output {
  Output() {
  }
  void save() {
    json.setInt("currentLevel", waterLevel);
    saveJSONObject(json, "data/new.json");
  }
}
