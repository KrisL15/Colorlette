void invisibleControls() {
  merge.setVisible(false);
  delete.setVisible(false);
  
  if (screen.screen == 1) {
    colorWheelMain.setVisible(true);
    exploreColorsMain.setVisible(true);
    explorePalettesMain.setVisible(true);
    myPalettesMain.setVisible(true);
    colorTheoryMain.setVisible(true);
  }
  
  else {
    colorWheelMain.setVisible(false);
    exploreColorsMain.setVisible(false);
    explorePalettesMain.setVisible(false);
    myPalettesMain.setVisible(false);
    colorTheoryMain.setVisible(false);
  }
  
  if (screen.screen == 2) {
    redValue.setVisible(true);
    greenValue.setVisible(true);
    blueValue.setVisible(true);
    seeSimilar.setVisible(true);
  }
  
  else {
    redValue.setVisible(false);
    greenValue.setVisible(false);
    blueValue.setVisible(false);
    seeSimilar.setVisible(false);
  }
  
  if (screen.screen <= 3 || screen.screen == 6 || screen.screen == 7) { // screens without slider bars
    mainSlider.setVisible(false);
  }
  
  else {
    mainSlider.setVisible(true);
  }
  
  if (screen.screen == 4 || screen.screen == 5 || screen.screen == 7 || screen.screen == 9 || screen.screen == 10){ // screens with a back button
    back.setVisible(true);
  }
  else {
    back.setVisible(false);
  }
  
  if (screen.screen == 7){
    savePalettes.setVisible(true);
  }
  else {
    savePalettes.setVisible(false);
  }
  
  if (saveClicked){
    windowX.setVisible(true);
  }
  else {
    windowX.setVisible(false);
  }
}
