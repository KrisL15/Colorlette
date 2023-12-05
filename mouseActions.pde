void mouseReleased() {
  if(screen.screen == 3){ // Explore Colours screen
       
    // for each specific button, get the color the user selected
    if (mouseY > 200 && mouseY < 275) { // first row of colors
      if (mouseX > 50 && mouseX < 250) {
        exploreColorType = "RED";
      }
      else if (mouseX > 300 && mouseX < 500) {
        exploreColorType = "ORANGE";
      }
      else if (mouseX > 550 && mouseX < 750) {
        exploreColorType = "YELLOW";
      }
    }
    
    else if (mouseY > 325 && mouseY < 400) { // second row of colors
      if (mouseX > 50 && mouseX < 250) {
        exploreColorType = "GREEN";
      }
      else if (mouseX > 300 && mouseX < 500) {
        exploreColorType = "BLUE";
      }
      else if (mouseX > 550 && mouseX < 750) {
        exploreColorType = "PURPLE";
      }
    }
    
    else if (mouseY > 450 && mouseY < 525) { // third row of colors
      if (mouseX > 50 && mouseX < 250) {
        exploreColorType = "PASTEL";
      }
      else if (mouseX > 300 && mouseX < 500) {
        exploreColorType = "DULL";
      }
      else if (mouseX > 550 && mouseX < 750) {
        exploreColorType = "MONOTONE";
      }
    }
  
    // if on any of the color "buttons", change to the next screen and set the square colors
    if((mouseY > 200 && mouseY < 275) || (mouseY > 325 && mouseY < 400) || (mouseY > 450 && mouseY < 525)) {
      if((mouseX > 50 && mouseX < 250) || (mouseX > 300 && mouseX < 500) || (mouseX > 550 && mouseX < 750)){
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
        }
          
    // else if mouse is over the save button, run the save function
    
    // else, take you to view the color + complementary/similar colors
      }
    }
  }
}
