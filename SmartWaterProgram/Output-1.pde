class Output {
  Output() {
  }
  void save() {
    json.setInt("currentLevel", currentWater);
    saveJSONObject(json, "data/new.json");
  }
}
