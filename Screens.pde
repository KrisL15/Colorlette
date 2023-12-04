class Screen {
  // FIELDS
  PImage brand;
  //brand = loadImage("Colorlette.png");
  PFont brandFont;  //upload brand font (for text and/or brand title)
  //brandFont = createFont("Cambria-Bold-48.vwl". 48);

  int screen, x, y;
  
  // CONSTRUCTOR
  Screen(int s) {
    //this.brand =   loadImage("Colorlette.png");
    //this.brandFont = createFont("Cambria-Bold-48.vwl". 48);
    this.screen = s;
    this.x = 0;
    this.y = 0;
  }
  
  // METHODS
  void callScreens() {
    if(this.screen == 1)
      home();
    else if(this.screen == 2)
      colorWheel();
    else if(this.screen == 3)
      exploreColorsMain();
    else if(this.screen == 4)
      exploreColors2();
    else if(this.screen == 5)
      exploreColorsSelected();
    else if(this.screen == 6)
      explorePalettes();
    else if(this.screen == 7)
      explorePaletteSelected();
    else if(this.screen == 8)
      myPalettes();
    else if(this.screen == 9)
      myPalettesSelected();
    else if(this.screen == 10)
      colorTheory();
  }
  
  
  void navigatorBar() {
    fill(155, 98, 197);
    noStroke();
    rect(0,0 , 800,40);
  }
  
  
  void home() {
    image(colorletteLogo, 150, 40, 500, 180);
  }
  
  
  void colorWheel() {
    colorWheelSquare.drawSquare();
    
    //slider texts
    //textFont(brandFont);
    fill(0);
    textAlign(LEFT);
    text("red", width/4, 450);
    text("green", width/4, 500);
    text("blue", width/4, 550);
    
  }
  
  
  void exploreColorsMain() {
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    text("Explore Colors!", width/2, 125);
    
    //colour options ("buttons")
    color[] col = {#CE5858, #E39759, #EBC267, #4A661C, #415E8B, #7C008D, #9ABED1, #D2009F, #5F5F5F};
    String[] colText = {"RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE", "PASTEL", "SATURATED", "MONOTONE"};
    int buttonX = 50;
    int buttonY = 200;
    
    int n = 0;
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        exploreColorsOptions(col[n], colText[n], buttonX, buttonY);
        if(j < 2)
          buttonX += 250;
        else
          buttonX = 50;
        n++;
      }
      buttonY += 125;
    }
  }
  
  
  void exploreColorsOptions(color col, String colText, int buttonX, int buttonY) {
    fill(col);
    rect(buttonX, buttonY, 200, 75, 10, 10, 10, 10);
    fill(255);
    textSize(24);
    text(colText, buttonX+100, buttonY+45);
  }
  
  void exploreColors2() {
    textSize(50);
    fill(155, 98, 197);
    text(exploreColorType, width/2, 125);
    
  }
  
  void exploreColorsSelected() {
  }
  
  void explorePalettes() {
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    text("Explore Our" + "\n" + "Favorite Color Palettes!", width/2, 125);
  }
  
  void explorePaletteSelected() {
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    //text(colorPalette, width/2, 150);
    
  }
  
  void myPalettes() {
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    text("My Palettes", width/2, 125);
  }
  
  void myPalettesSelected() {
    //textFont(brandFont);
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    //text(myPalette, width/2, 125);
  }
  
  void colorTheory() {
    // Headings
    textSize(40);
    fill(155, 98, 197);
    text("Color Theory", this.x+100, this.y+100);
    text("Intro to Color Theory", this.x+100, this.y+100);
    text("Terms", this.x+100, this.y+100);
    text("Complementary Colors", this.x+100, this.y+100);
    text("Analogous Colors", this.x+100, this.y+100);
    text("Triadic Colors", this.x+100, this.y+100);
    text("60-30-10 Rule", this.x+100, this.y+100);
    text("Monochromatic Colors", this.x+100, this.y+100);
    text("Color Psychology", this.x+100, this.y+100);
    text("More Tips and Tricks", this.x+100, this.y+100);
    
    // Text
    textSize(24);
    fill(0);
    text("Did you know that people decide whether or not they like a product within 90 seconds of first seeing it? 90% of that decision is based on the color of the product. This is why color theory plays a crucial role in all business and design aspects. If you want your product, media, or artwork to be marketable or liked by your audience, you have come to the right place. Remember, art and design are processes that involve problem-solving. They won’t come to you in one day.",
      this.x+100, this.y+100, this.x+100, this.y+100);
    text("Color theory not only plays a part in the lives of traditional artists (eg. painters, drawers, etc.), but also in the lives of designers and influencers of the growing online platforms. Picking colors may seem like an easy choice. It just has to look good, right? Unfortunately, it’s not that easy. Different groups of people enjoy different looks, and with the psychology behind colors, it can be much more time-consuming to come up with the perfect color combination.",
      this.x+100, this.y+100, this.x+100, this.y+100);
    text("To begin, we must talk about the primary colors, which are typically red, yellow and blue, as you would learn in elementary school. Using these colors, as well as black and white, you can create any color in the world. While the mixing of colors may be different in traditional art, RGB and CMYK, they are all perceived similarly to the average human. So how do we put colors together? And what do we need to watch out for?",
      this.x+100, this.y+100, this.x+100, this.y+100);
    text("Hue - The colors of the rainbow like red, orange, yellow, etc. \nShade - When you add black to a hue to make it darker \nTint - When you add white to a hue to make it lighter. Pastels are tints \nTone - When you add gray to a hue to make the color less saturated. Gray consists of equal amounts of black and white",
      this.x+100, this.y+100, this.x+100, this.y+100);
    text("Complementary colors are colors that are opposites on the color wheel. For example, red and green. They are colors that help each other stand out, giving a very bold effect to your design. But watch out! They are colors that really require you to find the right shade. Otherwise, it could be very tiring on the eyes. A tip to make complementary colors look better together is to add a bit of the other color into them (eg. mixing a little red into the green shade and a little green into the red shade). This method also works with other colors.",
      this.x+100, this.y+100, this.x+100, this.y+100);
    text("Analogous colors are the three colors that are right beside each other on the color wheel. For example, red, orange and yellow. Numerous brands use analogous colors to make their websites and apps pleasing to the eye. For example, Canva’s colours range from bright cyan to purple. This colour choice works well in most usecases. For things like interior or aesthetic design, try to go for more muted tones of the three colors.",
      this.x+100, this.y+100, this.x+100, this.y+100);
    text("Triadic colors are very similar to complementary colors. However, instead of opposites, they take colors that are evenly spaced from each other. This appears as a triangle shape on the color wheel. Like complementary colors, triadic colors make the colors pop in a harmonious way. When using triadic colors, a good rule to consider is the 60-30-10 rule.",
      this.x+100, this.y+100, this.x+100, this.y+100);
    text("The 60-30-10 rule is a rule that helps you balance the colors used in a design so they don't appear to be overdone or have too many colors. Of course, with experience you may not want to follow this rule all the time. This rule separates the percentages of each of the three colors. Your main color, or base color, will cover 60% of the design, your secondary color will fill 30%, and the final 10% will be the accent color that gives an extra little push.",
      this.x+100, this.y+100, this.x+100, this.y+100);
    text("Different colors often have different meanings to them based on where they are normally used or where you see them. By using different colors in their art, artists are able to send a deeper message to their audience. Keep in mind that some colors have different meanings in other cultures or areas. \n\n\n\nRed - passion, danger, excitement, traditional, good luck \nOrange - creativity, energy, adventure, youth, warmth \nYellow - happy, optimistic, cheerful, wealth, time, light \nGreen - nature, environment, growth, healthy \nBlue - sadness, loyal, calm, stable, trustworthy \nPurple - royalty, wealth, creativity, mystery, wisdom \nBlack - formal, luxury, negativity, evil, death \nWhite -  purity, innocence, positivity, calm, death",
      this.x+100, this.y+100, this.x+100, this.y+100);
    text(" - Keep it at a few colors. Too many colors, especially bold ones, can take away from the effect, and can even make your project look cluttered. \n - A saturated color will pop more when paired with a less saturated color. On the other hand, a bunch of saturated colors can overwhelm the audience. \n - Do not only rely on color to communicate messages. There are many people who may not associate the colors with the emotions you are trying to convey. \n - Make sure that the colours you use are easily readable. Avoid adding white text on top of light colours (eg. yellow or pink). \n - Note how the appearance of a color is affected by the colors surrounding it. Make the appropriate changes to enhance the appearance.",
      this.x+100, this.y+100, this.x+100, this.y+100);
    
    //// Images
    //image(colorTheoryImg[1], this.x+100, this.y+100);
    //image(colorTheoryImg[2], this.x+100, this.y+100);
    //image(colorTheoryImg[3], this.x+100, this.y+100);
    //image(colorTheoryImg[4], this.x+100, this.y+100);
    //image(colorTheoryImg[5], this.x+100, this.y+100);
    //image(colorTheoryImg[6], this.x+100, this.y+100);
    //image(colorTheoryImg[7], this.x+100, this.y+100);
    
    //Back button
    
  }
}
