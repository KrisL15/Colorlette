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

// typically called when the user choses to switch screens
void resetScreen() {
  saveClicked = false; // disable all of the popups
  popUpEnabled = false;
  palettesMaxed = false;
  savePreMadePalettePopUp = false;
  mergePalettePopUp = false;
  //reset every y value to 0 so that nothing on the new selected page has been scrolled yet
  mainSlider.setLimits(0, 0.0, 100.0);
  screen.y = 0;
  for(int i = 0; i < 10; i ++) {
    for(int j = 0; j < 3; j++) {
      browseColoredSquares[i][j].ogY = 0;
      if(previousScreen == 9)
        browseColoredSquares[i][j].liked = false;      
    }
  }
  for(int i = 0; i < palettes.size(); i++){ // go through each palette to see which are selected to be deleted
    palettes.get(i).mergeDeleteSelected = false;
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
  previousScreen = screen.screen;
  screen.screen = 8;
} //_CODE_:myPalettes:900340:

// on screen 7 to save the pre-premade palette colors to myPalettes
public void savePalettesClicked(GButton source, GEvent event) { //_CODE_:savePalettes:410609:
  previousScreen = screen.screen;
  screenPast = screen.screen;
  resetScreen();
  screen.screen = 7;
  
  if(palettes.size() < 6) {
    newPalette = true;
    savePreMadePalettePopUp = true;
    framePopUpStarted = frameCount; // record the frame so the popup can be displayed for long enough for the user to read
  }
  else
    palettesMaxed = true; // max amount of palettes at once is 6 (not including the like colors palette). Called to Display message if user tries to create more than the max
    
  if(!palettesMaxed){ // if there are under the max amount of paletes, the user can create a palette
    palettes.add(new MyPalette(explorePreMadePalette)); // add a new palette to the palettes ArrayList
    
    // set the palette colors according to which pre-made palette the user wanted to save
    int n = 0;
    for(int i = 0; i < 6; i++){
      if(explorePreMadePalette == "Winter Wonderland")
        palettes.get(palettes.size()-1).addColor(color(winterW[n], winterW[n+1], winterW[n+2]));
      else if(explorePreMadePalette == "Vivid Spring")
        palettes.get(palettes.size()-1).addColor(color(vSpring[n], vSpring[n+1], vSpring[n+2]));
      else if(explorePreMadePalette == "Pastel Summer")
        palettes.get(palettes.size()-1).addColor(color(pSummer[n], pSummer[n+1], pSummer[n+2]));
      else if(explorePreMadePalette == "Pumpkin Spice")
        palettes.get(palettes.size()-1).addColor(color(pumpkinS[n], pumpkinS[n+1], pumpkinS[n+2]));
      else if(explorePreMadePalette == "Northern Lights")
        palettes.get(palettes.size()-1).addColor(color(nLights[n], nLights[n+1], nLights[n+2]));
      else if(explorePreMadePalette == "Enchanted Forest")
        palettes.get(palettes.size()-1).addColor(color(eForest[n], eForest[n+1], eForest[n+2]));
      else if(explorePreMadePalette == "Sunset by the Beach")
        palettes.get(palettes.size()-1).addColor(color(sBeach[n], sBeach[n+1], sBeach[n+2]));
      else if(explorePreMadePalette == "Lavender Landscape")
        palettes.get(palettes.size()-1).addColor(color(lavenderL[n], lavenderL[n+1], lavenderL[n+2]));
      else if(explorePreMadePalette == "Monochromatic")
        palettes.get(palettes.size()-1).addColor(color(mono[n], mono[n+1], mono[n+2]));        
      n+=3;
    }
  }
  else
    framePopUpStarted = frameCount;
  
} //_CODE_:savePalettes:410609:

public void backClicked(GButton source, GEvent event) { //_CODE_:back:308297:
  resetScreen();
  if(screen.screen == 4 || screen.screen == 7 || screen.screen == 9 ) {
    screen.screen -= 1;
  }
  else if(screen.screen == 10) {  //color theory to home
    screen.screen = 1;
  }
  else if(screen.screen == 5) {  //see similar colors goes back to the previous screen
    screen.screen = previousScreen;
  }
  else {
    screen.screen -= 1;
  }
} //_CODE_:back:308297:

public void deleteClicked(GButton source, GEvent event) { //_CODE_:delete:600029:
  if(showMergeAndDeleteButton) {
    for(int d = palettes.size()-1; d >= 0; d--){ // go through each palette to see which are selected to be deleted
      if(palettes.get(d).mergeDeleteSelected == true) { // delete the palettes that selected to be merged
        palettes.remove(d);
      }
    }    
    showMergeAndDeleteButton = false;
  }
} //_CODE_:delete:600029:

public void mergeClicked(GButton source, GEvent event) { //_CODE_:merge:607285:
  if(showMergeAndDeleteButton == true){
    if (numPalettesSelected < 2){ // you can't merge only one palette! display message to user so they know
      framePopUpStarted = frameCount;
      mergePalettePopUp = true;
    }
    else {
      ArrayList<Integer> mergeThese = new ArrayList<Integer>(); // temporary arrayList to store the index of the arrays to be merged
      ArrayList<Integer> mergedPaletteColors = new ArrayList<Integer>(); // temporary arrayList to store all colors in each palette that will be merged
      String newTitle = "";
    
      for(int i = 0; i < palettes.size(); i++){ // go through each palette to see which are selected to be merged
        if(palettes.get(i).mergeDeleteSelected == true) {
          mergeThese.add(i);
        }
      }

      for(int a = 0; a < mergeThese.size(); a++){
        if(a > 0)
          newTitle = newTitle + " + ";
        newTitle = newTitle + palettes.get(mergeThese.get(a)).title;
        for(int b = 0; b < palettes.get(mergeThese.get(a)).paletteColors.size(); b++) {// get all colors from the palettes to be merged
          mergedPaletteColors.add(palettes.get(mergeThese.get(a)).paletteColors.get(b));
        }
      }
      palettes.add(new MyPalette(newTitle));
      for(int c = 0; c < mergedPaletteColors.size(); c++)
        palettes.get(palettes.size()-1).paletteColors.add(mergedPaletteColors.get(c)); // add all colors from the palettes to be merged to the new, merged palette

      for(int d = palettes.size()-1; d >= 0; d--){
        if(palettes.get(d).mergeDeleteSelected == true) { // delete the palettes that were selected to be merged
          palettes.remove(d);
        }
      }

      showMergeAndDeleteButton = false;
    }
  }
} //_CODE_:merge:607285:

public void mainSliderChanged(GSlider source, GEvent event) { //_CODE_:mainSlider:664683:
  screen.y = 0-19*mainSlider.getValueI();
  for(int i = 0; i < 10; i ++) {
    for(int j = 0; j < 3; j++) {
      browseColoredSquares[i][j].ogY = 0-20*mainSlider.getValueI(); // change each coloredSquare's ogY (the y value that all coloredSquares in the array's locations are based off) so they move according to the slider value
    }
  }
} //_CODE_:mainSlider:664683:

public void seeSimilarClicked(GButton source, GEvent event) { //_CODE_:seeSimilar:278952:
  resetScreen();
  screen.screen = 5;
  screenPast = 2;
  previousScreen = 2;
  for(int i=0; i<2; i++) {
    for(int j=0; j<3; j++) {
      paletteSquares[i][j].r = colorWheelSquare.r + int(random(-50, 50));
      paletteSquares[i][j].g = colorWheelSquare.g + int(random(-50, 50));
      paletteSquares[i][j].b = colorWheelSquare.b + int(random(-50, 50));
    }
  }
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

// X button in the top right corner of the save color pop-up
public void windowXClicked(GButton source, GEvent event) { //_CODE_:windowX:545388:
  saveClicked = false;
  popUpEnabled = false;
  newPalette = false;
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
  savePalettes = new GButton(this, 75, 480, 200, 35);
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
  mainSlider = new GSlider(this, 800, 40, 560, 10, 60.0);
  mainSlider.setRotation(PI/2, GControlMode.CORNER);
  mainSlider.setLimits(0.0, 0.0, 100.0);  //(starting point, min value, max value)
  mainSlider.setNumberFormat(G4P.DECIMAL, 0);
  mainSlider.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  mainSlider.setOpaque(false);
  mainSlider.addEventHandler(this, "mainSliderChanged");
  seeSimilar = new GButton(this, 577, 550, 220, 40);
  seeSimilar.setIcon("See Similar.png", 1, GAlign.EAST, GAlign.RIGHT, GAlign.MIDDLE);
  seeSimilar.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  seeSimilar.addEventHandler(this, "seeSimilarClicked");
  redValue = new GSlider(this, 325, 435, 255, 10, 25.0);
  redValue.setLimits(0, 0, 255);
  redValue.setNumberFormat(G4P.INTEGER, 0);
  redValue.setLocalColorScheme(GCScheme.RED_SCHEME);
  redValue.setOpaque(false);
  redValue.addEventHandler(this, "redValueChanged");
  greenValue = new GSlider(this, 325, 485, 255, 10, 25.0);
  greenValue.setLimits(0, 0, 255);
  greenValue.setNumberFormat(G4P.INTEGER, 0);
  greenValue.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  greenValue.setOpaque(false);
  greenValue.addEventHandler(this, "greenValueChanged");
  blueValue = new GSlider(this, 325, 535, 255, 10, 25.0);
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
  windowX = new GButton(this, 510, 203, 38, 40);
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
