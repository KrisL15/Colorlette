void saveColor() {
  if(saveClicked){
    
    stroke(110);
    // dim the background
    tint(0,0,0,125);
    image(winterWonderland, 0, 40, 800, 600);
    noTint();
    maxPalettesReached();
    
    //white rectangle pop-up
    fill(255);
    rect(250, 200, 300, 200);
    
    if (!newPalette) {
      // text dividers
      fill(255);
      int rectY = 260;
      for(int i = 0; i < 6; i++){
        rect(250, rectY+(20*i), 300, 20);
      }
      
      // text
      fill(155, 98, 197);
      textSize(24);
      text("Save color to:", 265, 250);
      
      fill(0);
      textSize(12);
      text("+   Create New Palette", 265, 275);
    
      for(int i = 0; i < palettes.size(); i++){
        fill(0);
        textSize(12);
        text(palettes.get(i).title, 287, 275+(20*(i+1)));
       
      }
    }
    
    else { // the user selected "create new palette"
      fill(155, 98, 197);
      textSize(24);
      text("Name your new palette:", 265, 270);
      
      fill(0);
      noStroke();
      fill(200,200,200);
      rect(265, 280, 270, 40); // writing text
      rect(485, 330, 50, 25);// save button
      
      fill(0);
      textSize(15);
      text("Save", 495, 348);
      textSize(20);
      text(paletteName, 270, 310);
    }
  }
}

void maxPalettesReached() { //message displayed at the bottom of the screen when max # of palettes have been made
  if (palettesMaxed){
    textSize(16);
    fill(237, 79, 62);
    rect(0, 45, 800, 50);
    fill(255);
    text("6/6 palettes have been made. To create a new palette, delete or merge some of your palettes.", 30, 77);
  
  }
}
