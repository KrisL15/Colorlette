import g4p_controls.*;

//PImage ct1 = loadImage("ColorTheoryImg1.png");
//PImage ct2 = loadImage("ColorTheoryImg2.png");
//PImage ct3 = loadImage("ColorTheoryImg3.png");
//PImage ct4 = loadImage("ColorTheoryImg4.png");
//PImage ct5 = loadImage("ColorTheoryImg5.png");
//PImage ct6 = loadImage("ColorTheoryImg6.png");
//PImage ct7 = loadImage("ColorTheoryImg7.png");

//PImage[] colorTheoryImg = new PImage[7];
PImage colorletteLogo;

Screen screen = new Screen(1);

void setup() {
  createGUI();
  size(800, 600);
  //colorTheoryImg = {ct1, ct2, ct3, ct4, ct5, ct6, ct7};
  colorletteLogo = loadImage("ColorletteLogo.png");
}


void draw() {
  background(255);
  screen.callScreens();
  screen.navigatorBar();
  invisibleControls();
}
