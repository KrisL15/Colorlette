void mouseReleased() {

  if (!(mouseX >= 675 && mouseX <= 778 && mouseY >= 550 && mouseY <= 585)) { // first detect if it over the back button. The GUI doesn't run until after mouseReleased is run so we have to make sure the user isn't trying to click the back button.
    // The GUI doesn't run until after mouseReleased is run so we have to make sure the user isn't trying to click the delete or merge button.
    if (screen.screen != 8 || (screen.screen == 8 && (!showMergeAndDeleteButton || (showMergeAndDeleteButton && !((mouseX >= 0 && mouseX <= 180 && mouseY >= 560 && mouseY <= 600) || (mouseX >= 627 && mouseX <= 800 && mouseY >= 560 && mouseY <= 600)))))) {
      // Run these functions for each ColoredSquare tile to detect when the heart and save icons are clicked (the 2 functions are defined furhter down below)
      if(screen.screen == 2){
        likeButton(colorWheelSquare, 0, 0);
        saveColor(colorWheelSquare);
        if (saveClicked)
          popUpEnabled = true;
      }
      else if(screen.screen == 4 || screen.screen == 9){
        previousScreen = screen.screen;
        int n = 0;
        for(int i = 0; i < 10 && saveClicked == false; i++){
          for(int j = 0; j < 3 && saveClicked == false; j++){
            if(screen.screen == 9) {
              if(paletteSelected == "Liked Colors"){
                if (n < likedColors.size()) {
                  likeButton(browseColoredSquares[i][j], i, j);
                  n++;
                }
              }
              else {
                int savePalette = 0;
                for(int p = 0; p < palettes.size(); p++){
                  if(palettes.get(p).title.equals(paletteSelected)){
                    savePalette = p;
                  }
                }
                try {
                  if (n < palettes.get(savePalette).paletteColors.size()) {
                    likeButton(browseColoredSquares[i][j], i, j);
                    n++;
                    println (i,j,hex(browseColoredSquares[i][j].col,6));
                    println (saveI, saveJ);
                  }
                } catch(IndexOutOfBoundsException e){}
              }
            }
            else {
              likeButton(browseColoredSquares[i][j], i, j);
            }
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
            println ( "GOing to 4");
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
        if(mouseX >= 100 && mouseX <= 680){ // if the mouseX is over the location for the palettes
          if(mouseY >= 150 && mouseY <= 210){ // when the liked colors palette is clicked
            paletteSelected = "Liked Colors";
            for(int i = 0; i < 10; i ++) {
              for(int j = 0; j < 3; j++){
                if(n < likedColors.size()) {
                  browseColoredSquares[i][j].show = true;
                  browseColoredSquares[i][j].col = likedColors.get(n);
                  browseColoredSquares[i][j].liked = true;
                  n++;
                  screen.screen = 9;
                }
                else{
                  browseColoredSquares[i][j].col = 0;
                }
              }
            }
          }
          else {
            for(int a = 0; a < palettes.size(); a++){
              n = 0;
              if(mouseY >= y+a*63 && mouseY <= y+a*63+60){
                paletteSelected = palettes.get(a).title;
                for(int i = 0; i < 10; i ++) {
                  for(int j = 0; j < 3; j++){
                    if (n < palettes.get(a).paletteColors.size()) {
                      browseColoredSquares[i][j].show = true;
                      browseColoredSquares[i][j].col = palettes.get(a).paletteColors.get(n);
                      n++;
                      screen.screen = 9;
                    }
                    else {
                      browseColoredSquares[i][j].col = 0;
                    }
                  }
                }
              }
            }
          }
        }
        if(mouseX >= 38 && mouseX <= 63){ // if the mouseX is within the x loacation of the little squares (the user wants to merge or delete a list)
          for(int i = 0; i < palettes.size(); i++){
            if(mouseY >= 230+i*63 && mouseY <= 255+i*63) {
              if(palettes.get(i).mergeDeleteSelected == false)
                palettes.get(i).mergeDeleteSelected = true;
              else if(palettes.get(i).mergeDeleteSelected == true)
                palettes.get(i).mergeDeleteSelected = false;
            }
          }
      
          showMergeAndDeleteButton = false;
          numPalettesSelected = 0;
          for(int i = 0; i < palettes.size(); i++){ // go through each palette to see if any are selected to be merged or deleted
            if(palettes.get(i).mergeDeleteSelected == true)
              showMergeAndDeleteButton = true;
              numPalettesSelected += 1;
          }
        }
      }
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
                  // remove the palette if it's empty
                  if(palettes.get(i).paletteColors.size() == 0)
                    palettes.remove(i);
                  if(screen.screen == 9){
                    int n = 0;
                    for(int j = 0; j < 10 && n < 6; j ++) {
                      for(int k = 0; k < 3 && n < 6; k++) {
                        println ("palette size = ", palettes.get(i).paletteColors.size());
                        if(n < palettes.get(i).paletteColors.size()) {
                          println (j,k,"good");
                          browseColoredSquares[j][k].show = true;
                          browseColoredSquares[j][k].col = palettes.get(i).paletteColors.get(n);                          
                        }
                        else {
                          println (j,k,"bad");
                          browseColoredSquares[j][k].col = 0;
                        }
                        n++;
                      }
                    }
                  }
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
          likedColors.add(a.col);
        }
        else {
          for(int i = 0; i < likedColors.size(); i++) {
            if(likedColors.get(i) == a.col)
              likedColors.remove(i);
          }
          if (screen.screen < 9) {
            a.liked = false;
            likeButtonClicked = true;
          }
          else {
            int n = 0;
            for(int i = 0; i < 10 && n < 6; i ++) {
              for(int j = 0; j < 3 && n < 6; j++) {
                if (n < likedColors.size()) {
                  browseColoredSquares[i][j].show = true;
                  browseColoredSquares[i][j].col = likedColors.get(n);
                }
                else {
                  browseColoredSquares[i][j].show = false;
                  browseColoredSquares[i][j].col = 0;
                }
                n++;
              }
            }
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
      else if(screen.screen == 4 && likeButtonClicked == false) {
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
      // else, take you to view the color + similar colors
      else if(screen.screen == 9 && likeButtonClicked == false) {
        saveBrowseI = saveThisI;
        saveBrowseJ = saveThisJ;
        screenPast = screen.screen;
        println (">>>",saveThisI, saveThisJ, hex(browseColoredSquares[saveThisI][saveThisJ].col, 6));
        for(int i=0; i<2; i++) {
          for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = browseColoredSquares[saveThisI][saveThisJ].r + int(random(-50, 50));
          paletteSquares[i][j].g = browseColoredSquares[saveThisI][saveThisJ].g + int(random(-50, 50));
          paletteSquares[i][j].b = browseColoredSquares[saveThisI][saveThisJ].b + int(random(-50, 50));
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
