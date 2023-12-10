// Decides when the GUI buttons and sliders are to be displayed
void invisibleControls() {
  // home screen
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
  
  
  // color wheel screen
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
  
  
  // screens without slider bars
  if (screen.screen <= 3 || screen.screen == 5 || screen.screen == 6 || screen.screen == 7 || screen.screen == 8) {
    mainSlider.setVisible(false);
  }
  
  else {
    mainSlider.setVisible(true);
  }
  
  
  // screens with a back button
  if (screen.screen == 4 || screen.screen == 5 || screen.screen == 7 || screen.screen == 9 || screen.screen == 10){
    back.setVisible(true);
  }
  
  else {
    back.setVisible(false);
  }
  
  
  // second screen of explore palettes (when the image and colors of the palette are shown)
  if (screen.screen == 7){
    savePalettes.setVisible(true);
  }
  
  else {
    savePalettes.setVisible(false);
  }
  
  
  // when the save pop-up appears
  if (saveClicked){
    windowX.setVisible(true);
  }
  
  else {
    windowX.setVisible(false);
  }
  
  
  // when on the myPalettes screen and the little square to merge/delete palettes is selected by the user
  if(showMergeAndDeleteButton && screen.screen == 8) {
    merge.setVisible(true);
    delete.setVisible(true); 
  }
  
  else {
    merge.setVisible(false);
    delete.setVisible(false);
    showMergeAndDeleteButton = false;
  }
}
