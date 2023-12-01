class ColoredSquare {
  //FIELDS
  int r, g, b;
  float x, y;
  int size, screenFor;
  boolean liked, show;
  
  //CONSTRUCTOR
  ColoredSquare(int s, float x, float y, int size) {
    this.screenFor = s;
    this.r = 0;
    this.g = 0;
    this.b = 0;
    this.x = x;
    this.y = y;
    this.size = size;
    this.liked = false;
    this.show = false;
  }
  
  //METHODS
  void drawSquare() {  
    //textFont(brandFont);
    textSize(25);
    textAlign(CENTER);
    
    fill(getHexCode());
    square(this.x, this.y, size);
    
    //bar across the bottom of the square
    fill(#9F9F9F);
    rect(this.x, this.y+size-(size/7), size, size/7);
    
    if(liked)
      image(likedColor, this.x, this.y+size-(size/7), 100, size/7);
    else
      image(notALikedColor, this.x, this.y+size-(size/7), 100, size/7);
    
    
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
    
    text("#" + hex(getHexCode(), 6), width/2, 225);
  } 

  color getHexCode() {
    color squareCol = color(this.r, this.g, this.b);
    return squareCol;
  }
}
