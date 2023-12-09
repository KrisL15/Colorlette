class MyPalette {
  // FIELDS
  String title;
  ArrayList<Integer> paletteColors;
 
  // CONSTRUCTOR
  MyPalette(String t){
    this.title = t;
    this.paletteColors = new ArrayList<Integer>();
  }
  
  // METHODS
  void addColor(int i) {
    this.paletteColors.add(i);
  }
  
  void removeColor(int i) {
    for(int c = 0; c < this.paletteColors.size(); c++) { // for each value in the paletteColors arrayList,
      if(this.paletteColors.get(c) == i) { // check if equals the color you want to remove
        this.paletteColors.remove(c);
      }
    }
  }
}
