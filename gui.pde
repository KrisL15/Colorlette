/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */
 
int previousScreen = 0;

void resetScreen() {
  saveClicked = false;
  //reset every y value to 0 so that nothing on the new selected page has been scrolled yet
  mainSlider.setLimits(0, 0.0, 100.0);
  sliderMini.setLimits(0, 0.0, 100.0);
  screen.y = 0;
  for(int i = 0; i < 10; i ++) {
    for(int j = 0; j < 3; j++) {
      browseColoredSquares[i][j].ogY = 0;
    }
  }
}

public void exploreColorsClicked(GButton source, GEvent event) { //_CODE_:exploreColors:640186:
  resetScreen();
  screen.screen = 3;
  previousScreen = screen.screen;
} //_CODE_:exploreColors:640186:

public void colorWheelClicked(GButton source, GEvent event) { //_CODE_:colorWheel:298686:
  resetScreen();
  screen.screen = 2;
  previousScreen = screen.screen;
} //_CODE_:colorWheel:298686:

public void homeClicked(GButton source, GEvent event) { //_CODE_:home:930257:
  resetScreen();
  screen.screen = 1;
  previousScreen = screen.screen;
} //_CODE_:home:930257:

public void explorePalettesClicked(GButton source, GEvent event) { //_CODE_:explorePalettes:902454:
  resetScreen();
  screen.screen = 6;
  previousScreen = screen.screen;
} //_CODE_:explorePalettes:902454:

public void myPalettesClicked(GButton source, GEvent event) { //_CODE_:myPalettes:900340:
  resetScreen();
  screen.screen = 8;
  previousScreen = screen.screen;
} //_CODE_:myPalettes:900340:

public void savePalettesClicked(GButton source, GEvent event) { //_CODE_:savePalettes:410609:
  resetScreen();
  screen.screen = 7;
  previousScreen = screen.screen;
} //_CODE_:savePalettes:410609:

public void backClicked(GButton source, GEvent event) { //_CODE_:back:308297:
  if(screen.screen == 10)  //color theory to home
    screen.screen = 1;
  else if(screen.screen == 5 && previousScreen == 2)  //see similar/complementary colors
    screen.screen = 2;
  else
    screen.screen -= 1;
} //_CODE_:back:308297:

public void deleteClicked(GButton source, GEvent event) { //_CODE_:delete:600029:
  
} //_CODE_:delete:600029:

public void mergeClicked(GButton source, GEvent event) { //_CODE_:merge:607285:
  
} //_CODE_:merge:607285:

public void sliderMiniChanged(GSlider source, GEvent event) { //_CODE_:sliderMini:991682:
  popupY = 200-sliderMini.getValueI();
} //_CODE_:sliderMini:991682:

public void mainSliderChanged(GSlider source, GEvent event) { //_CODE_:mainSlider:664683:
  screen.y = 0-19*mainSlider.getValueI();
  for(int i = 0; i < 10; i ++) {
    for(int j = 0; j < 3; j++) {
      browseColoredSquares[i][j].ogY = 0-20*mainSlider.getValueI();
    }
  }
} //_CODE_:mainSlider:664683:

public void seeSimilarClicked(GButton source, GEvent event) { //_CODE_:seeSimilar:278952:
  resetScreen();
  screen.screen = 5;
  previousScreen = screen.screen;
} //_CODE_:seeSimilar:278952:

public void redValueChanged(GSlider source, GEvent event) { //_CODE_:redValue:714811:
  colorWheelSquare.r = redValue.getValueI();
} //_CODE_:redValue:714811:

public void greenValueChanged(GSlider source, GEvent event) { //_CODE_:greenValue:898672:
  colorWheelSquare.g = greenValue.getValueI();
} //_CODE_:greenValue:898672:

public void blueValueChanged(GSlider source, GEvent event) { //_CODE_:blueValue:837385:
  colorWheelSquare.b = blueValue.getValueI();
} //_CODE_:blueValue:837385:

public void colorWheelMainClicked(GButton source, GEvent event) { //_CODE_:colorWheelMain:964956:
  resetScreen();
  screen.screen = 2;
  previousScreen = screen.screen;
} //_CODE_:colorWheelMain:964956:

public void exploreColorsMainClicked(GButton source, GEvent event) { //_CODE_:exploreColorsMain:339268:
  resetScreen();
  screen.screen = 3;
  previousScreen = screen.screen;
} //_CODE_:exploreColorsMain:339268:

public void explorePalettesMainClicked(GButton source, GEvent event) { //_CODE_:explorePalettesMain:548508:
  resetScreen();
  screen.screen = 6;
  previousScreen = screen.screen;
} //_CODE_:explorePalettesMain:548508:

public void myPalettesMainClicked(GButton source, GEvent event) { //_CODE_:myPalettesMain:565413:
  resetScreen();
  screen.screen = 8;
  previousScreen = screen.screen;
} //_CODE_:myPalettesMain:565413:

public void colorTheoryMainClicked(GButton source, GEvent event) { //_CODE_:colorTheoryMain:978602:
  resetScreen();
  screen.screen = 10;
  previousScreen = screen.screen;
} //_CODE_:colorTheoryMain:978602:

public void windowXClicked(GButton source, GEvent event) { //_CODE_:windowX:545388:
  saveClicked = false;
  previousScreen = screen.screen;
} //_CODE_:windowX:545388:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  exploreColors = new GButton(this, 240, 0, 240, 40);
  exploreColors.setIcon("Screenshot 2023-11-25 164243.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  exploreColors.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  exploreColors.addEventHandler(this, "exploreColorsClicked");
  colorWheel = new GButton(this, 45, 0, 185, 40);
  colorWheel.setIcon("Screenshot 2023-11-25 163910 (1).png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  colorWheel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  colorWheel.addEventHandler(this, "colorWheelClicked");
  home = new GButton(this, 0, 0, 33, 40);
  home.setIcon("Screenshot 2023-11-25 170223.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  home.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  home.addEventHandler(this, "homeClicked");
  explorePalettes = new GButton(this, 490, 0, 257, 40);
  explorePalettes.setIcon("Screenshot 2023-11-25 164246.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  explorePalettes.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  explorePalettes.addEventHandler(this, "explorePalettesClicked");
  myPalettes = new GButton(this, 757, 0, 45, 40);
  myPalettes.setIcon("Screenshot 2023-11-25 170900.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  myPalettes.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  myPalettes.addEventHandler(this, "myPalettesClicked");
  savePalettes = new GButton(this, 130, 475, 195, 35);
  savePalettes.setIcon("Save Palettes.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  savePalettes.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  savePalettes.addEventHandler(this, "savePalettesClicked");
  back = new GButton(this, 675, 550, 103, 35);
  back.setIcon("Back (1).png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  back.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  back.addEventHandler(this, "backClicked");
  delete = new GButton(this, 0, 560, 180, 40);
  delete.setIcon("Delete.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  delete.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  delete.addEventHandler(this, "deleteClicked");
  merge = new GButton(this, 627, 560, 173, 40);
  merge.setIcon("Merge.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  merge.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  merge.addEventHandler(this, "mergeClicked");
  sliderMini = new GSlider(this, 550, 200, 200, 10, 10.0);
  sliderMini.setRotation(PI/2, GControlMode.CORNER);
  sliderMini.setLimits(0.0, 0.0, 100.0);
  sliderMini.setNumberFormat(G4P.DECIMAL, 2);
  sliderMini.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  sliderMini.setOpaque(false);
  sliderMini.addEventHandler(this, "sliderMiniChanged");
  mainSlider = new GSlider(this, 800, 40, 560, 10, 60.0);
  mainSlider.setRotation(PI/2, GControlMode.CORNER);
  mainSlider.setLimits(0.0, 0.0, 100.0);  //(starting point, min value, max value)
  mainSlider.setNumberFormat(G4P.DECIMAL, 0);
  mainSlider.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  mainSlider.setOpaque(false);
  mainSlider.addEventHandler(this, "mainSliderChanged");
  seeSimilar = new GButton(this, 529, 525, 223, 40);
  seeSimilar.setIcon("See Similar.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  seeSimilar.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  seeSimilar.addEventHandler(this, "seeSimilarClicked");
  redValue = new GSlider(this, 325, 435, 255, 10, 10.0);
  redValue.setLimits(0, 0, 255);
  redValue.setNumberFormat(G4P.INTEGER, 0);
  redValue.setLocalColorScheme(GCScheme.RED_SCHEME);
  redValue.setOpaque(false);
  redValue.addEventHandler(this, "redValueChanged");
  greenValue = new GSlider(this, 325, 485, 255, 10, 10.0);
  greenValue.setLimits(0, 0, 255);
  greenValue.setNumberFormat(G4P.INTEGER, 0);
  greenValue.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  greenValue.setOpaque(false);
  greenValue.addEventHandler(this, "greenValueChanged");
  blueValue = new GSlider(this, 325, 535, 255, 10, 10.0);
  blueValue.setLimits(0, 0, 255);
  blueValue.setNumberFormat(G4P.INTEGER, 0);
  blueValue.setOpaque(false);
  blueValue.addEventHandler(this, "blueValueChanged");
  colorWheelMain = new GButton(this, 213, 215, 375, 85);
  colorWheelMain.setIcon("Color Wheel Main (3).png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  colorWheelMain.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  colorWheelMain.addEventHandler(this, "colorWheelMainClicked");
  exploreColorsMain = new GButton(this, 251, 310, 298, 60);
  exploreColorsMain.setIcon("Explore Colors Main (3).png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  exploreColorsMain.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  exploreColorsMain.addEventHandler(this, "exploreColorsMainClicked");
  explorePalettesMain = new GButton(this, 251, 375, 298, 60);
  explorePalettesMain.setIcon("Explore Palettes Main (5).png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  explorePalettesMain.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  explorePalettesMain.addEventHandler(this, "explorePalettesMainClicked");
  myPalettesMain = new GButton(this, 251, 440, 298, 60);
  myPalettesMain.setIcon("My Palettes Main (2).png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  myPalettesMain.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  myPalettesMain.addEventHandler(this, "myPalettesMainClicked");
  colorTheoryMain = new GButton(this, 251, 505, 298, 60);
  colorTheoryMain.setIcon("Color Theory Main (1).png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  colorTheoryMain.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  colorTheoryMain.addEventHandler(this, "colorTheoryMainClicked");
  windowX = new GButton(this, 500, 203, 38, 40);
  windowX.setIcon("Window X.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  windowX.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  windowX.addEventHandler(this, "windowXClicked");
}

// Variable declarations 
// autogenerated do not edit
GButton exploreColors; 
GButton colorWheel; 
GButton home; 
GButton explorePalettes; 
GButton myPalettes; 
GButton savePalettes; 
GButton back; 
GButton delete; 
GButton merge; 
GSlider sliderMini; 
GSlider mainSlider; 
GButton seeSimilar; 
GSlider redValue; 
GSlider greenValue; 
GSlider blueValue; 
GButton colorWheelMain; 
GButton exploreColorsMain; 
GButton explorePalettesMain; 
GButton myPalettesMain; 
GButton colorTheoryMain; 
GButton windowX; 
