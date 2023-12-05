void mouseReleased() {
  if(screen.screen == 3){ // Explore Colours screen
       
    // for each specific button, get the color the user selected
    if (mouseY >= 200 && mouseY <= 300) { // first row of colors
      if (mouseX >= 12 && mouseX <= 262) {
        exploreColorType = "RED";
      }
      else if (mouseX >= 274 && mouseX <= 524) {
        exploreColorType = "ORANGE";
      }
      else if (mouseX >= 536 && mouseX <= 786) {
        exploreColorType = "YELLOW";
      }
    }
    
    else if (mouseY >= 325 && mouseY <= 425) { // second row of colors
      if (mouseX >= 12 && mouseX <= 262) {
        exploreColorType = "GREEN";
      }
      else if (mouseX >= 274 && mouseX <= 524) {
        exploreColorType = "BLUE";
      }
      else if (mouseX >= 536 && mouseX <= 786) {
        exploreColorType = "PURPLE";
      }
    }
    
    else if (mouseY >= 450 && mouseY <= 550) { // third row of colors
      if (mouseX >= 12 && mouseX <= 262) {
        exploreColorType = "PASTEL";
      }
      else if (mouseX >= 274 && mouseX <= 524) {
        exploreColorType = "DULL";
      }
      else if (mouseX >= 536 && mouseX <= 786) {
        exploreColorType = "MONOTONE";
      }
    }
  
    // if on any of the color "buttons", change to the next screen and set the square colors
    if((mouseY >= 200 && mouseY <= 300) || (mouseY >= 325 && mouseY <= 425) || (mouseY >= 450 && mouseY <= 550)) {
      if((mouseX >= 12 && mouseX <= 262) || (mouseX >= 274 && mouseX <= 524) || (mouseX >= 536 && mouseX <= 786)){
        for(int i = 0; i < 10; i++) {
          for(int j = 0; j < 3; j++) {
            browseColoredSquares[i][j].setColor();
            screen.screen =  4;
          }
        }
      }
    }
  }
  
  
  if(screen.screen == 4 || screen.screen == 2 || screen.screen == 5 || screen.screen == 7 || screen.screen == 9){ // screens with colored squares
   
    for(int i = 0; i < 10; i++) {
      for(int j = 0; j < 3; j++) {
       
        // if mouse is over coloredSquare
        if(mouseX >= browseColoredSquares[i][j].ogX + browseColoredSquares[i][j].x && mouseX <= browseColoredSquares[i][j].ogX + browseColoredSquares[i][j].x + browseColoredSquares[i][j].size && mouseY >= browseColoredSquares[i][j].ogY + browseColoredSquares[i][j].y && mouseY <= browseColoredSquares[i][j].ogY + browseColoredSquares[i][j].y + browseColoredSquares[i][j].size) {
       
          // if mouse is over the heart button, turn it to the opposite (if liked, unlike; if not liked, like)
          if(mouseX <= browseColoredSquares[i][j].ogX + browseColoredSquares[i][j].x + browseColoredSquares[i][j].size/7*1.1 && mouseY >= browseColoredSquares[i][j].ogY + browseColoredSquares[i][j].y + browseColoredSquares[i][j].size - (browseColoredSquares[i][j].size/7)) {
            if(browseColoredSquares[i][j].liked == false) {
              browseColoredSquares[i][j].liked = true;
              likedColors.add("#"+hex(browseColoredSquares[i][j].getHexCode(), 6));
            }
            else {
              browseColoredSquares[i][j].liked = false;
              likedColors.remove("#"+hex(browseColoredSquares[i][j].getHexCode(), 6));
            }
          }
          
          // else if mouse is over the save button, run the save function
    
          // else, take you to view the color + complementary/similar colors
          //else {
          //  screen.screen = 5;
          
          //}
        }
      }
    }
  }
  
  
  if(screen.screen == 6){ // Explore Palettes screen
  
    // for each specific button, get the color the user selected
    if (mouseY >= 230 && mouseY <= 330) { // first row of colors
      if (mouseX >= 12 && mouseX <= 262) {
        explorePreMadePalette = "Winter Wonderland";
      }
      else if (mouseX >= 274 && mouseX <= 524) {
        explorePreMadePalette = "Vivid Spring";
      }
      else if (mouseX >= 536 && mouseX <= 786) {
        explorePreMadePalette = "Pastel Summer";
      }
    }
    
    else if (mouseY >= 355 && mouseY <= 455) { // second row of colors
      if (mouseX >= 12 && mouseX <= 262) {
        explorePreMadePalette = "Pumpkin Spice";
      }
      else if (mouseX >= 274 && mouseX <= 524) {
        explorePreMadePalette = "Northern Lights";
      }
      else if (mouseX >= 536 && mouseX <= 786) {
        explorePreMadePalette = "Enchanted Forest";
      }
    }
    
    else if (mouseY >= 480 && mouseY <= 580) { // third row of colors
      if (mouseX >= 12 && mouseX <= 262) {
        explorePreMadePalette = "Sunset by the Beach";
      }
      else if (mouseX >= 274 && mouseX <= 524) {
        explorePreMadePalette = "Lavender Landscape";
      }
      else if (mouseX >= 536 && mouseX <= 786) {
        explorePreMadePalette = "Monochromatic";
      }
    }
  
    // if on any of the color "buttons", change to the next screen and set the square colors
    if((mouseY >= 230 && mouseY <= 330) || (mouseY >= 355 && mouseY <= 455) || (mouseY >= 480 && mouseY <= 580)) {
      if((mouseX >= 12 && mouseX <= 262) || (mouseX >= 274 && mouseX <= 524) || (mouseX >= 536 && mouseX <= 786)){
        for(int i = 0; i < 10; i++) {
          for(int j = 0; j < 3; j++) {
            // make a new function to set the values of the colors and draw the image
            screen.screen =  7;
          }
        }
      }
    }
  }
  
}
