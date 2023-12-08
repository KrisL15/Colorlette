class MyPalette {
  // FIELDS
  String title;
  ArrayList<String> paletteColors;
  int size;
 
  // CONSTRUCTOR
  MyPalette(String t){
    this.title = t;
    this.paletteColors = new ArrayList<String>();
    this.size = 0;
  }
  
  // METHODS
  void addColor(String i) {
    this.paletteColors.add(i);
    println(this.title,this.paletteColors);
    
  }
  
  void removeColor(String i) {
    this.paletteColors.remove(i);
    println(this.title,this.paletteColors);
    
  }
}
