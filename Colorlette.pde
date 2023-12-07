import g4p_controls.*;

PImage ct1, ct2, ct3, ct4, ct5, ct6, ct7, colorletteLogo, likedColor, notALikedColor, winterWonderland, vividSpring, pastelSummer, pumpkinSpice, northernLights, enchantedForest, sunsetByTheBeach, lavenderLandscape, monochromatic;
String exploreColorType = "NONE";
String explorePreMadePalette = "NONE";


Screen screen = new Screen(1);

ColoredSquare colorWheelSquare = new ColoredSquare(2, 237.5, 80, 325);
ColoredSquare[][] browseColoredSquares = new ColoredSquare[10][3];
ColoredSquare[][] preMadePaletteSquares = new ColoredSquare[2][3];

ExploreSpecificColor[] exploreSpecificCol = new ExploreSpecificColor[17];

ArrayList<String> likedColors = new ArrayList<String>();
ArrayList<String> palettes = new ArrayList<String>();

// pre-made color palettes
color winterW[] = {#7f89be, 615971, #35cfc4, #b0a5b3, #342632, #f8decb};
color vSpring[] = {#649755, #74722f, #f2cda0, #e8a837, #d9542c, #713015};
color pSummer[] = {#93b6af, #cbd6d4, #eadbdd, #dfb486, #cf97a6, #8a6a56};
color pumpkinS[] = {#cfc3b5, #e0994e, #bf560f, #281a10, #643f21, #c18a59};
color nLights[] = {#2c4456, #1b262f, #43625e, #34877c, #89dca9, #dafad4};
color eForest[] = {#051a19, #dfcaa7, #103630, #4f595a, #919394, #365520};
color sBeach[] = {#302b2c, #479789, #cfb890, #fbeca7, #7f5f4c, #d78850};
color lavenderL[] = {#f19f9a, #947dbc, #eed3ce, #2e1d1d, #592b51, #8b4a39};
color mono[] = {#b1b1b1, #ebebeb, #222222, #494949, #757575, #f9f9f9};

void setup() {
  createGUI();
  size(800, 600);
  int x = 60;
  int y = 160;
  for(int i = 0; i < 10; i++) {
    for(int j = 0; j < 3; j++) {
      browseColoredSquares[i][j] = new ColoredSquare(4, x, y, 200);
      x+=240;
    }
    y += 240;
    x = 60;
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
  screen.callScreens();
  screen.navigatorBar();
  invisibleControls();
  println(likedColors);
}
