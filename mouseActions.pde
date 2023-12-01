void mouseReleased() {
  if(screen.screen == 3){ // Explore Colours screen
  // if on one of the "buttons", change to the next screen
    if((mouseY > 200 && mouseY < 275) || (mouseY > 325 && mouseY < 400) || (mouseY > 450 && mouseY < 525)) {
      if((mouseX > 50 && mouseX < 250) || (mouseX > 300 && mouseX < 500) || (mouseX > 550 && mouseX < 750)){
       screen.screen =  4;
      }
    }
  }
  if(screen.screen == 4 || screen.screen == 2 || screen.screen == 5 || screen.screen == 7 || screen.screen == 9){ // screens with colored squares
    //retrieve heart/save button locations from the text file
  
    //if mouse is over the heart button, turn it to the opposite (if liked, unlike; if not liked, like)
    
    //if mouse is over the save button, run the save function
  }
}
