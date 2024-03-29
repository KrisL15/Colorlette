import g4p_controls.*;

PImage ct1, ct2, ct3, ct4, ct5, ct6, ct7, colorletteLogo, likedColor, notALikedColor, winterWonderland, vividSpring, pastelSummer, pumpkinSpice, northernLights, enchantedForest, sunsetByTheBeach, lavenderLandscape, monochromatic;
String exploreColorType = "NONE";
String explorePreMadePalette = "NONE";

boolean saveClicked = false; // when the save button is clicked and the pop-up appears, it changes the mouse clicking options (variable mostly used in mouseActions, controls and popUps)
boolean popUpEnabled = false;
int saveI; // saves the i and j value of the specific browseColoredSquares or paletteSquares when the save button is clicked
int saveJ;
int saveBrowseI;
int saveBrowseJ;
boolean newPalette = false; // if the user wants to create a new palette
String paletteName = ""; // new palette name
boolean palettesMaxed = false; // up to 6 palettes can be made at once. This variable tracks whether the max # of palettes have been reached.
String paletteSelected;
int screenPast = 0;
boolean likeButtonClicked;
boolean showMergeAndDeleteButton = false;
boolean savePreMadePalettePopUp = false;
boolean mergePalettePopUp = false;
int numPalettesSelected;
int framePopUpStarted; // when the pop-up appears, track the frame so the pop-up stays on the screen for a certain amount of frames

Screen screen = new Screen(1);

// Colored squares - 3 different sizes and array lengths
ColoredSquare colorWheelSquare = new ColoredSquare(237.5, 80, 325);
ColoredSquare[][] browseColoredSquares = new ColoredSquare[10][3];
ColoredSquare[][] paletteSquares = new ColoredSquare[2][3];

ArrayList<Integer> likedColors = new ArrayList<Integer>(); // saves the colors the user likes
ArrayList<MyPalette> palettes = new ArrayList<MyPalette>(); // saves the palettes the user creates

// pre-made color palettes
// format: int paletteTitle[] = {r1,g1,b1 , r2,g2,b2 , r3,g3,b3};
int winterW[] = {127,137,190  ,  97,89,113  ,  53,207,196  ,  176,165,179  ,  52,38,50  ,  248,222,203};
int vSpring[] = {100,151,85  ,  116,114,47  ,  242,205,160  ,  232,168,55  ,  217,84,44  ,  113,48,21};
int pSummer[] = {147,182,175  ,  203,214,212  ,  234,219,221  ,  223,180,134  ,  207,151,166  ,  138,106,86};
int pumpkinS[] = {191,86,15  ,  207,195,181  ,  224,153,78  ,  40,26,16  ,  100,63,33  ,  193,138,89};
int nLights[] = {44,68,86  ,  27,38,47  ,  67,98,94  ,  52,135,124  ,  137,220,169  ,  218,250,212};
int eForest[] = {5,26,25  ,  223,202,167  ,  16,54,48  ,  79,89,90  ,  145,147,148  ,  54,85,32};
int sBeach[] = {215,136,80 ,  48,43,44  ,  71,151,137  ,  207,184,144  ,  251,236,167  , 127,95,76};
int lavenderL[] = {148,125,188  ,  241,159,154  ,  238,211,206  ,  46,29,29  ,  89,43,81  ,  139,74,57};
int mono[] = {177,177,177  ,  235, 235, 235  ,  34,34,34  ,  73,73,73  ,  117,117,117  ,  249,249,249};


void setup() {
  createGUI();
  size(800, 600);
  
  //setup browseColoredSquares
  int x = 60;
  int y = 160;
  for(int i = 0; i < 10; i++) {
    for(int j = 0; j < 3; j++) {
      browseColoredSquares[i][j] = new ColoredSquare(x, y, 200);
      x+=240;
    }
    y += 240;
    x = 60;
  }

  //setup paletteSquares
  x = 350;
  y = 180;
  for(int i = 0; i < 2; i++) {
    for(int j = 0; j < 3; j++) {
      paletteSquares[i][j] = new ColoredSquare(x, y, 125);
      x+=145;
    }
    y += 155;
    x = 350;
  }
  
  // Uploading the color theory images, logo, and like buttons
  ct1 = loadImage("ColorTheoryImg1.png");
  ct2 = loadImage("ColorTheoryImg2.png");
  ct3 = loadImage("ColorTheoryImg3.png");
  ct4 = loadImage("ColorTheoryImg4.png");
  ct5 = loadImage("ColorTheoryImg5.png");
  ct6 = loadImage("ColorTheoryImg6.png");
  ct7 = loadImage("ColorTheoryImg7.png");
  colorletteLogo = loadImage("ColorletteLogo.png");
  likedColor = loadImage("LikedColor.png");
  notALikedColor = loadImage("NotALikedColor.png");
  
  //palette images
  winterWonderland = loadImage("Winter Wonderland.png");
  vividSpring = loadImage("Vivid Spring.png");
  pastelSummer = loadImage("Pastel Summer.png");
  pumpkinSpice = loadImage("Pumpkin Spice.png");
  northernLights = loadImage("Northern Lights.png");
  enchantedForest = loadImage("Enchanted Forest.png");
  sunsetByTheBeach = loadImage("Sunset by the Beach.png");
  lavenderLandscape = loadImage("Lavender Landscape.png");
  monochromatic = loadImage("Monochromatic.png");
}


void draw() {
  background(255);
  likeButtonClicked = false;
  screen.callScreens();
  screen.navigatorBar();
  invisibleControls();
  saveColorPopUp();
  maxPalettesReached();
  savedPalettePopUp();
  mergeErrorPalettePopUp();
}
