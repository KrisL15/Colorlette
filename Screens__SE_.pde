PFont brandFont;  //upload brand font (for text and/or brand title)

void home() {
  background(255);
  textFont(brandFont);  //or upload an image?
  textAlign(CENTER);

}

void colorWheel() {
  //custom color square
  //fill()  //based on GUI slider values
  rect(width*0.25,150 , width*0.75,300);
  fill(150,150,150);
  rect(width*0.25,300 , width*0.72,350);
  textFont(brandFont);
  textSize(100);
  textAlign(CENTER);
  fill(255);
  text("#______", width/2, 225);
  
  
  //slider texts
  textFont(brandFont);
  textAlign(LEFT);
  text("red", width/3, 450);
  text("green", width/3, 500);
  text("blue", width/3, 550);
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
