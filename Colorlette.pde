import g4p_controls.*;

PImage ct1, ct2, ct3, ct4, ct5, ct6, ct7, colorletteLogo, likedColor, notALikedColor;
String exploreColorType;

Screen screen = new Screen(1);
ColoredSquare colorWheelSquare = new ColoredSquare(2, 237.5, 80, 325);
ColoredSquare[] coloredSquares = new ColoredSquare[12];


void setup() {
  createGUI();
  size(800, 600);
  int x = 60;
  int y = 150;
  int n = 0;
  for(int i = 0; i < 4; i++) {
    for(int j = 0; j < 3; j++) {
      coloredSquares[n] = new ColoredSquare(4, x, y, 200);
      x+=240;
      n++;
    }
    y += 240;
    x = 60;
  }
        
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
}


void draw() {
  background(255);
  screen.callScreens();
  screen.navigatorBar();
  invisibleControls();
}
