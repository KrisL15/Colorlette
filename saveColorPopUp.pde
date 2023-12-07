void saveColor() {
  if(saveClicked){
    stroke(110);
    // dim the background
    
    //white rectangle pop-up
    fill(255);
    rect(250, 200, 300, 200);
    
    // text
    if (popupY >= 170) {
      fill(155, 98, 197);
      textSize(24);
      text("Save color to:", 265, popupY + 50);
    }
    
    if (popupY >= 150) {
      fill(0);
      textSize(12);
      text("+ Create New Palette", 265, popupY + 70);
      line(265, popupY + 55, 535, popupY + 55);
    }
    
    for(int i = 0; i < palettes.size(); i++){
      if (popupY >= palettes.size()*20-190 && popupY <= palettes.size()+190) { // figure out these numbers
        fill(0);
        textSize(12);
        text(palettes.get(i), 265, popupY + 50);
      }
    }
  }
}
