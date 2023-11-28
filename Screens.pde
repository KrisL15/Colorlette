class Screen {
  // FIELDS
  PImage brand;
  //brand = loadImage("Colorlette.png");
  PFont brandFont;  //upload brand font (for text and/or brand title)
  //brandFont = createFont("Cambria-Bold-48.vwl". 48);

  int r, g, b, screen;
  
  // CONSTRUCTOR
  Screen(int s) {
    //this.brand =   loadImage("Colorlette.png");
    //this.brandFont = createFont("Cambria-Bold-48.vwl". 48);
    this.r = 0;
    this.g = 0;
    this.b = 0;
    this.screen = s;
  }
  
  // METHODS
  void callScreens() {
    if(this.screen == 1)
      home();
    else if(this.screen == 2)
      colorWheel();
    else if(this.screen == 3)
      exploreColorsMain();
    else if(this.screen == 4)
      exploreColors2();
    else if(this.screen == 5)
      exploreColorsSelected();
    else if(this.screen == 6)
      explorePalettes();
    else if(this.screen == 7)
      explorePaletteSelected();
    else if(this.screen == 8)
      myPalettes();
    else if(this.screen == 9)
      myPalettesSelected();
  }

  void navigatorBar() {
    fill(155, 98, 197);
    noStroke();
    rect(0,0 , 800,40);
  }
  
  void home() {
    background(255);
    navigatorBar();
    invisibleControls();
    //textFont(brandFont);  //or upload an image?
    textAlign(CENTER);
    //image(brand, width/2, 100);
  }
  
  void colorWheel() {
    background(255);
    navigatorBar();
    //custom color square
    fill(color(r, g, b));  //based on GUI slider values
    rect(width*0.25,80 , width/2,270);
    fill(150,150,150);
    rect(width*0.25,350 , width/2,50);
    //textFont(brandFont);
    textSize(25);
    textAlign(CENTER);
    fill(0);
    text("#______", width/2, 225);
    
    
    //slider texts
    //textFont(brandFont);
    textAlign(LEFT);
    text("red", width/4, 450);
    text("green", width/4, 500);
    text("blue", width/4, 550);
    
    redValue.setVisible(true);
    greenValue.setVisible(true);
    blueValue.setVisible(true);
  }
  
  
  void exploreColorsMain() {
    background(255);
    navigatorBar();
    invisibleControls();
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(50);
    text("Explore Colors!", width/2, 125);
  }
  
  void exploreColors2() {
    background(255);
    navigatorBar();
    invisibleControls();
  }
  
  void exploreColorsSelected() {
    background(255);
    navigatorBar();
    invisibleControls();
  }
  
  void explorePalettes() {
    background(255);
    navigatorBar();
    invisibleControls();
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(50);
    text("Explore Our" + "\n" + "Favorite Color Palettes!", width/2, 125);
  }
  
  void explorePaletteSelected() {
    background(255);
    navigatorBar();
    invisibleControls();
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(50);
    //text(colorPalette, width/2, 150);
    
  }
  
  void myPalettes() {
    background(255);
    navigatorBar();
    invisibleControls();
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(80);
    text("My Palettes", width/2, 125);
  }
  
  void myPalettesSelected() {
    background(255);
    navigatorBar();
    invisibleControls();
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(80);
    //text(myPalette, width/2, 125);
  }

}
