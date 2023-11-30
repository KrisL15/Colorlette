void invisibleControls() {
  sliderMini.setVisible(false);
  windowX.setVisible(false);
  savePalettes.setVisible(false);
  merge.setVisible(false);
  delete.setVisible(false);
  seeSimilar.setVisible(false);
  back.setVisible(false);
  
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
  }
  
  else {
    redValue.setVisible(false);
    greenValue.setVisible(false);
    blueValue.setVisible(false);
  }
}
