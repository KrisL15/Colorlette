PFont brandFont;  //upload brand font (for text and/or brand title)

void home() {
  background(255);
  textFont(brandFont);  //or upload an image?
  textAlign(CENTER);

}

void colorWheel() {
  //custom color square
  fill(255);  //based on GUI slider values
  rect(width*0.25,100 , width/2,250);
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
}


void exploreColorsMain() {
  textFont(brandFont);
  textAlign(CENTER);
  textSize(150);
  text("Explore Colors!", width/2, 150);
}

void exploreColors2() {
  
}

void exploreColorsSelected() {
  
}

void explorePalettes() {
  textFont(brandFont);
  textAlign(CENTER);
  textSize(150);
  text("Explore Our Favorite Color Palettes!", width/2, 150);
}

void explorePaletteSelected() {
  textFont(brandFont);
  textAlign(CENTER);
  textSize(150);
  //text(colorPalette, width/2, 150);
  
}

void myPalettes() {
  textFont(brandFont);
  textAlign(CENTER);
  textSize(150);
  text("My Palettes", width/2, 150);
}

void myPalettesSelected() {
  textFont(brandFont);
  textAlign(CENTER);
  textSize(150);
  //text(myPalette, width/2, 150);
}
