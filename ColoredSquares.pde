class ColoredSquare {
  //FIELDS
  int r, g, b;
  float ogX, ogY, x, y;
  int size, screenFor;
  boolean liked, show;
  
  //CONSTRUCTOR
  ColoredSquare(int s, float x, float y, int size) {
    this.screenFor = s;
    this.r = 0;
    this.g = 0;
    this.b = 0;
    this.ogX = 0;
    this.ogY = 0;
    this.x = x;
    this.y = y;
    this.size = size;
    this.liked = false;
    this.show = false;
  }
  
  //METHODS
  void drawSquare() {  
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(size/13);
    
    fill(getHexCode());
    square(this.ogX+this.x, this.ogY+this.y, this.size);
    
    //bar across the bottom of the square
    fill(#9F9F9F);
    rect(this.ogX+this.x, this.ogY+this.y+this.size-(this.size/7), this.size, this.size/7);
    
    if(liked)
      image(likedColor, this.ogX+this.x, this.ogY+this.y+this.size-(this.size/7), this.size/7*2.2, this.size/7);
    else
      image(notALikedColor, this.ogX+this.x, this.ogY+this.y+this.size-(this.size/7), this.size/7*2.2, this.size/7);
    
    
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
    
    text("#" + hex(getHexCode(), 6), this.ogX+this.x+(this.size/2), this.ogY+this.y+(this.size*6/13));
  }
  
  void setColor() {
    if(exploreColorType == "RED"){
      this.r = int(random(20,255));
      this.g = int(random(this.r/2));
      this.b = int(random(this.r/2));
    }
    else if(exploreColorType == "GREEN"){
      this.g = int(random(20,255));
      this.r = int(random(this.g/2));
      this.b = int(random(this.g/2));
    }
    else if(exploreColorType == "BLUE"){
      this.b = int(random(20,255));
      this.r = int(random(this.b/2));
      this.g = int(random(this.b/2));
    }
    else if(exploreColorType == "ORANGE"){
      this.g = int(random(20,255));
      this.r = this.g*2;
      this.g = int(random(this.g/2));
    }
    else if(exploreColorType == "YELLOW"){
      this.r = int(random(100,255));
      this.g = this.r;
      this.b = int(random(this.r/3));
    }
    else if(exploreColorType == "PURPLE"){
      this.r = int(random(20,255));
      this.g = int(random(this.r));
      this.b = this.r;
    }
    if(exploreColorType == "PASTEL"){
      this.r = int(random(200,255)); //high RGB values are closer to white
      this.g = int(random(200,255));
      this.b = int(random(200,255));
    }
    if(exploreColorType == "DULL"){
      this.r = int(random(10,100)); //low RGB values are closer to black
      this.g = int(random(10,100));
      this.b = int(random(10,100));
    }
    if(exploreColorType == "MONOTONE"){
      this.r = int(random(255));
      this.g = this.r;
      this.b = this.r;
    }
  }

  color getHexCode() {
    color squareCol = color(this.r, this.g, this.b);
    return squareCol;
  }
}
