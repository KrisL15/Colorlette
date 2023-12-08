void mouseReleased() {
  
  if(saveClicked){
    if(newPalette){ // creating a new palette
      if(mouseX >= 485 && mouseX <= 535 && mouseY >= 330 && mouseY <= 355){ // within the save button
        palettes.add(new MyPalette(paletteName));
        palettes.get(palettes.size()-1).addColor(hex(colorWheelSquare.getHexCode(), 6));
        paletteName = "";
        newPalette = false;
      }
    }
    
    else { //adding to a palette
      if(mouseX >= 250 && mouseX <= 550){
        if(mouseY >= 260 && mouseY <= 280){ // within the create new palette section
          if(palettes.size() < 6) // max # palettes at once is 6
            newPalette = true;
          else
            palettesMaxed = true;
        }
            
        else if(mouseY > 280 && mouseY < 400) { // within a palette space
          boolean included = false;
          int y = 280;
          for(int i = 0; i < 6; i++){
            if(mouseY > y && mouseY < y+20){
              try {
                for(int a = 0; a < palettes.get(i).paletteColors.size(); a++){ // check if the color is already in the palette
                  if(palettes.get(i).paletteColors.get(a).equals(hex(colorWheelSquare.getHexCode(), 6))){
                    included = true;
                  }
                }
                if(included) // if color is already in palette, remove from palette
                  palettes.get(i).removeColor(hex(colorWheelSquare.getHexCode(), 6));
                else // if color is not in palette, add to palette
                  palettes.get(i).addColor(hex(colorWheelSquare.getHexCode(), 6));
                  
              }
              catch(IndexOutOfBoundsException e){}
            }
            y += 20;
            
          }
        }
      }
    }
  }
  
  
  if(screen.screen == 2 || screen.screen == 4){ // screens with colorSquares on them
    if(saveClicked == false){
      // if mouse is over coloredSquare
      if(mouseX >= colorWheelSquare.x && mouseX <= colorWheelSquare.x + colorWheelSquare.size && mouseY >= colorWheelSquare.y && mouseY <= colorWheelSquare.y + colorWheelSquare.size) {
        // if mouse is over the heart button, turn it to the opposite (if liked, unlike; if not liked, like)
        if(mouseX <= colorWheelSquare.x + colorWheelSquare.size/7*1.1 && mouseY >= colorWheelSquare.y + colorWheelSquare.size - (colorWheelSquare.size/7)) {
          if(colorWheelSquare.liked == false) {
            colorWheelSquare.liked = true;
            likedColors.add(hex(colorWheelSquare.getHexCode(), 6));
          }
          else {
            colorWheelSquare.liked = false;
            likedColors.remove(hex(colorWheelSquare.getHexCode(), 6));
          }
        }
          
        // else if mouse is over the save button, run the save function
        else if (mouseX >= colorWheelSquare.x + colorWheelSquare.size/7*1.1 && mouseX <= colorWheelSquare.x + colorWheelSquare.size/7*2.2 && mouseY >= colorWheelSquare.y + colorWheelSquare.size - (colorWheelSquare.size/7)) {
          saveClicked = true;
        
        }
        // else, take you to view the color + complementary/similar colors
        //else {
        //  screen.screen = 5;
          
        //}
      }
    }
  }
  
  
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


void keyPressed() {
  int characterLimit = 20;
  if(newPalette == true){
    if (key == BACKSPACE) {
      int l = paletteName.length();
      if (l > 0) {
        paletteName = paletteName.substring(0, l - 1);
      }
    } 
    else if (key != ENTER && key != CODED) { // excludes up, down, left, right, alt, control, shift, ect.
      if (paletteName.length() < characterLimit) {
        paletteName = paletteName + key;
      }
    }
    else if (key == ENTER) {
      palettes.add(new MyPalette(paletteName));
      palettes.get(palettes.size()-1).addColor(hex(colorWheelSquare.getHexCode(), 6));
      paletteName = "";
      newPalette = false;
    }
  }
}
