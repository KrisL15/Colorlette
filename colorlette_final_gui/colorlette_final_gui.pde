// Need G4P library
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
//import peasy.*;


public void setup(){
  size(800, 600, JAVA2D);
  createGUI();
  colorWheelMain.setVisible(false);
  exploreColorsMain.setVisible(false);
  explorePalettesMain.setVisible(false);
  
  customGUI();
  // Place your setup code here
  
}

public void draw(){
  background(230);
  
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
