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
  
  //Creating the pre-made Color Palettes
  setUpPreMadeColorPalettes();   
  
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
