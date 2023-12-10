class ColoredSquare {
  //FIELDS
  int r, g, b;
  float ogX, ogY, x, y;
  int size;
  boolean liked, included, show;
  color col;
  
  //CONSTRUCTOR
  ColoredSquare(float x, float y, int size) {
    this.r = 0;
    this.g = 0;
    this.b = 0;
    this.col = 0;
    this.ogX = 0; // when scroll bar is moved, ogX and ogY are changed, which affects the location of all squares in the array so they move in sync
    this.ogY = 0;
    this.x = x;
    this.y = y;
    this.size = size;
    this.liked = false;
    this.included = false;
    this.show = false;
  }
  
  //METHODS
  void drawSquare() {  
    if(this.show){
      textAlign(CENTER);
      textSize(size/13);
      
      if(screen.screen < 8)
        this.col = getHexCode();
        this.r = int(red(this.col));
        this.g = int(green(this.col));
        this.b = int(blue(this.col));

      // colored square
      fill(this.col);
      square(this.ogX+this.x, this.ogY+this.y, this.size);
    
      //bar across the bottom of the square
      fill(#9F9F9F);
      rect(this.ogX+this.x, this.ogY+this.y+this.size-(this.size/7), this.size, this.size/7);
    
      // check if this color has been liked by the user (in the likedColors ArrayList)
      for(int i = 0; i < likedColors.size(); i++){
        if(likedColors.get(i) == this.getHexCode()){
          this.included = true;
        }
      }
      
      // if the color is liked, draw the pink like button, if not like, draw the grey like button
      if(this.liked == true && this.included == true)
        image(likedColor, this.ogX+this.x, this.ogY+this.y+this.size-(this.size/7), this.size/7*2.2, this.size/7);
      else
        image(notALikedColor, this.ogX+this.x, this.ogY+this.y+this.size-(this.size/7), this.size/7*2.2, this.size/7);
    
      this.included = false; // set back to false for the next frame
    
      int highestVal = this.r; // check which int value is the greatest - r, g, or b.
      if(highestVal < this.g)
        highestVal = this.g;
      if(highestVal < this.b)
        highestVal = this.b;
    
      if(highestVal == this.b && this.r < 100 && this.g < 100) // When there's mostly blue, the colour is dark so we need a white text font
        fill(255);
      else if(highestVal > 150) // If highest int value between r, g, and b is greater than 100, the color is light/bright so the hexcode text is printed in black.
        fill(0);
      else // The coloured sqaure is too dark so the hexcode text should be printed in white
        fill(255);
      
      // prints the hex color in the middle of the square
      text("#" + hex(this.col, 6), this.ogX+this.x+(this.size/2), this.ogY+this.y+(this.size*6/13));
      
      this.show = false; // set back to false for the next frame
    }
  }
  
  void setColor() {
    if(exploreColorType == "RED"){
      this.r = int(random(75,255));
      this.g = int(random(this.r/3));
      this.b = int(random(this.r/3));
    }
    else if(exploreColorType == "GREEN"){
      this.g = int(random(20,255));
      this.r = int(random(this.g/2));
      this.b = int(random(this.g/2));
    }
    else if(exploreColorType == "BLUE"){
      this.b = int(random(20,255));
      this.r = int(random((this.b/2)-20));
      this.g = int(random(this.b/2));
    }
    else if(exploreColorType == "ORANGE"){
      this.g = int(random(40,170)); // orange consists of 3xmore red than green but 2xless blue than green
      this.r = this.g*3;
      this.b = int(random(this.g/2));
    }
    else if(exploreColorType == "YELLOW"){
      this.r = int(random(225,255)); // yellow contains a high value of red, slightly lower value of green and a much lower value of blue
      this.g = this.r-int(random(20,50));
      this.b = int(random(this.r/3));
    }
    else if(exploreColorType == "PURPLE"){
      this.r = int(random(20,255)); // purple contains equal amounts of red and blue with green being less than the red/blue value
      this.g = int(random(this.r));
      this.b = this.r;
    }
    if(exploreColorType == "PASTEL"){
      this.r = int(random(200,255)); // high RGB values are closer to white
      this.g = int(random(200,255));
      this.b = int(random(200,255));
    }
    if(exploreColorType == "DULL"){
      this.r = int(random(10,100)); // low RGB values are closer to black
      this.g = int(random(10,100));
      this.b = int(random(10,100));
    }
    if(exploreColorType == "MONOTONE"){
      this.r = int(random(255)); // shades of grey have equal amount of red, green and blue
      this.g = this.r;
      this.b = this.r;
    }
  }

  // returns an integer that is used to get the hex code
  color getHexCode() {
    int hexCol = color(this.r, this.g, this.b);
    return hexCol;
  }
  
}
