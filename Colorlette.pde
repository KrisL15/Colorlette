import g4p_controls.*;

Screen screen = new Screen(0);

void setup() {
  createGUI();
  size(800, 600);
  
  
}


void draw() {
  screen.callScreens();
}
