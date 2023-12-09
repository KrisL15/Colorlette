void mouseReleased() {
  // Run these functions for each ColoredSquare tile to detect when the heart and save icons are clicked (the 2 functions are defined furhter down below)
  if(screen.screen == 2){
    likeButton(colorWheelSquare, 0, 0);
    saveColor(colorWheelSquare);
  }
  else if(screen.screen == 4 || screen.screen == 9){
    for(int i = 0; i < 10 && saveClicked == false; i++){
      for(int j = 0; j < 3 && saveClicked == false; j++){
        likeButton(browseColoredSquares[i][j], i, j);
      }
    }
    saveColor(browseColoredSquares[saveI][saveJ]);
    if (saveClicked)
      popUpEnabled = true;
  }
  else if(screen.screen == 5 || screen.screen == 7){
    for(int i = 0; i < 2 && saveClicked == false; i++){
      for(int j = 0; j < 3 && saveClicked == false; j++){
        likeButton(paletteSquares[i][j], i, j);
      }
    }
    saveColor(paletteSquares[saveI][saveJ]);
    if (saveClicked)
      popUpEnabled = true;
  }

  // When on the Explore Colours screen
  if(screen.screen == 3){
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
  
  // When on the Explore Palettes screen
  if(screen.screen == 6){
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
  
  
  // When on the myPalettes Screen
  if(screen.screen == 8) {
    int y = 213;
    int n = 0;
    if(mouseX >= 100 && mouseX <= 680){
      if(mouseY >= 150 && mouseY <= 210){ // when the liked colors palette is clicked
        paletteSelected = "Liked Colors";
        while(n < likedColors.size()) {
          for(int i = 0; i < 10 && n < likedColors.size(); i ++) {
            for(int j = 0; j < 3 && n < likedColors.size(); j++){
              browseColoredSquares[i][j].show = true;
              browseColoredSquares[i][j].col = likedColors.get(n);
              println(browseColoredSquares[i][j].col);
              n++;
            }
          }
        }
      }
      else {
        for(int i = 0; i < palettes.size(); i++){
          if(mouseY >= y+i*63 && mouseY <= y+i*63+60){
            paletteSelected = palettes.get(i).title;
          }
        }
      }
      
      screen.screen = 9;
    }
  }
}

  
void saveColor(ColoredSquare a) {
  if(saveClicked){
    if(newPalette){ // creating a new palette
      if(mouseX >= 485 && mouseX <= 535 && mouseY >= 330 && mouseY <= 355){ // within the save button
        palettes.add(new MyPalette(paletteName));
        palettes.get(palettes.size()-1).addColor(a.getHexCode());
        paletteName = "";
        newPalette = false;
      }
    }
    
    else if (popUpEnabled) { //adding to a palette
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
          for(int i = 0; i < 6; i++){ // for each palette in the palette arrayList:
            if(mouseY > y && mouseY < y+20){
              try {
                for(int b = 0; b < palettes.get(i).paletteColors.size(); b++){ // check if the color is already in the palette
                  if(palettes.get(i).paletteColors.get(b) == a.getHexCode()){
                    println (hex (a.getHexCode(), 6));
                    included = true;
                  }
                }
                if(!included) { // if color is not in palette, add to palette
                  palettes.get(i).addColor(a.getHexCode());
                   println ("add", hex (a.getHexCode(), 6));
                }
                else { // if color is in palette, remove from palette
                  palettes.get(i).removeColor(a.getHexCode());
                  println ("del", hex (a.getHexCode(), 6));
                }
              }
              catch(IndexOutOfBoundsException e){}
            }
            y += 20;
          }
        }
      }
    }
  }
}
  
  
void likeButton(ColoredSquare a, int saveThisI, int saveThisJ) {
  if(saveClicked == false){
    // if mouse is over coloredSquare
    if(mouseX >= a.ogX + a.x && mouseX <= a.ogX +a.x + a.size && mouseY >= a.ogY +a.y && mouseY <= a.ogY +a.y + a.size) {
      
      // if mouse is over the heart button, turn it to the opposite (if liked, unlike; if not liked, like)
      if(mouseX <= a.x + (a.size/7)*1.1 && mouseY >= a.ogY +a.y + a.size - (a.size/7)) {
        if(a.liked == false) {
          a.liked = true;
          likeButtonClicked = true;
          likedColors.add(a.getHexCode());
          println(likedColors);
        }
        else {
          a.liked = false;
          likeButtonClicked = true;
          for(int i = 0; i < likedColors.size(); i++) {
            if(likedColors.get(i) == a.getHexCode())
              likedColors.remove(i);
          }
        }
      }
          
      // else if mouse is over the save button, run the save function
      else if (mouseX >= a.ogX + a.x + a.size/7*1.1 && mouseX <= a.ogX + a.x + a.size/7*2.2 && mouseY >= a.ogY + a.y + a.size - (a.size/7)) {
        saveClicked = true;
        saveI = saveThisI;
        saveJ = saveThisJ;
      }
      
      // else, take you to view the color + similar colors
      else if((screen.screen == 4 || screen.screen == 9) && likeButtonClicked == false) {
        saveBrowseI = saveThisI;
        saveBrowseJ = saveThisJ;
        screenPast = screen.screen;
        for(int i=0; i<2; i++) {
          for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = browseColoredSquares[saveBrowseI][saveBrowseJ].r + int(random(-50, 50));
          paletteSquares[i][j].g = browseColoredSquares[saveBrowseI][saveBrowseJ].g + int(random(-50, 50));
          paletteSquares[i][j].b = browseColoredSquares[saveBrowseI][saveBrowseJ].b + int(random(-50, 50));
          }
        screen.screen = 5;
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
      if(screen.screen == 2){
        palettes.get(palettes.size()-1).addColor(colorWheelSquare.getHexCode());
      }
      else if (screen.screen == 4 || screen.screen == 9){
        palettes.get(palettes.size()-1).addColor(browseColoredSquares[saveI][saveJ].getHexCode());
      }
      else if (screen.screen == 5 || screen.screen == 7){
        palettes.get(palettes.size()-1).addColor(paletteSquares[saveI][saveJ].getHexCode());
      }
      paletteName = "";
      newPalette = false;
    }
  }
}
