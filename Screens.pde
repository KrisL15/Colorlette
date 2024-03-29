class Screen {
  // FIELDS
  int screen, x, y;
  
  // CONSTRUCTOR
  Screen(int s) {
    this.screen = s;
    this.x = 0;
    this.y = 0;
  }
  
  // METHODS
  // calls different functions depending on which screen the user is on
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
  
  
  // bar across the top of the screen (purple 'background' color for a smoother appearance)
  void navigatorBar() {
    fill(155, 98, 197);
    noStroke();
    rect(0,0 , 800,40);
  }
  
  
  // screen 1
  void home() {
    image(colorletteLogo, 150, 40, 500, 180);
  }
  
  
  // screen 2
  void colorWheel() {
    colorWheelSquare.show = true;
    colorWheelSquare.drawSquare();
    
    //slider texts
    fill(0);
    textAlign(LEFT);
    text("red", width/4, 450);
    text("green", width/4, 500);
    text("blue", width/4, 550);
    
  }
  
  
  // screen 3
  void exploreColorsMain() {
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    text("Explore Colors!", width/2, 125);
    
    //colour options (for the "buttons")
    color[] col = {#CE5858, #E39759, #EBC267, #4A661C, #415E8B, #7C008D, #9ABED1, #3B0000, #5F5F5F};
    String[] colText = {"RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE", "PASTEL", "DULL", "MONOTONE"};
    int buttonX = 12;
    int buttonY = 200;
    
    int n = 0;
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        exploreColorsOptions(col[n], colText[n], buttonX, buttonY);
        if(j < 2)
          buttonX += 262;
        else
          buttonX = 12;
        n++;
      }
      buttonY += 125;
    }
  }
  
  
  // draw the "buttons" for the color options (these aren't GUI - they're rectangles which we use the mouse x and y to determine which color the user wants to explore)
  void exploreColorsOptions(color col, String colText, int buttonX, int buttonY) {
    fill(col);
    rect(buttonX, buttonY, 250, 100, 10, 10, 10, 10);
    fill(255);
    textSize(24);
    text(colText, buttonX+125, buttonY+55);
    mainSlider.setLimits(0, 0.0, 100.0);
  }
  
  
  // screen 4 - deeper into the explore colors (eg. if the "RED" rectangle was clicked, the user is taken to this screen and red colors are displayed)
  void exploreColors2() {
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    if(browseColoredSquares[1][1].ogY > -50)
      text(exploreColorType, width/2, 125);
    else {
      fill(255);
      rect(100, 80, 600, 50);
    }
    for(int i = 0; i < 10; i ++) {
      for(int j = 0; j < 3; j++){
        browseColoredSquares[i][j].show = true;
        browseColoredSquares[i][j].drawSquare();
      }
    }
  }
  
  
  // screen 5 - when a specific colored square is clicked (shows similar colors to the selected color)
  void exploreColorsSelected() {
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    text("Similar Colors:", 400, 125);
    
    // if the past screen was the color wheel screen
    if(screenPast == 2){
      fill(colorWheelSquare.r, colorWheelSquare.g, colorWheelSquare.b);
      square(35, 180, 280);
    
      //determine text color based on square color
      int highestVal = colorWheelSquare.r; // check which int value is the greatest - r, g, or b.
      if(highestVal < colorWheelSquare.g)
        highestVal = colorWheelSquare.g;
      if(highestVal < colorWheelSquare.b)
        highestVal = colorWheelSquare.b;
    
      if(highestVal == colorWheelSquare.b && colorWheelSquare.r < 100 && colorWheelSquare.g < 100) // When there's mostly blue, the colour is dark so we need a white text font
        fill(255);
      else if(highestVal > 150) // If highest int value between r, g, and b is greater than 100, the color is light/bright so the hexcode text is printed in black.
        fill(0);
      else // The coloured sqaure is too dark so the hexcode text should be printed in white
        fill(255);
      
      textSize(30);
      text("#" + hex(colorWheelSquare.getHexCode(), 6), 165, 330);
    }
    
    // if the past screen was not the color wheel screen (the difference is whether we get the color from the individual colorSqaure "colorWheelSquare" or the array of coloredSqaures "browseColoredSquares")
    else {
      fill(browseColoredSquares[saveBrowseI][saveBrowseJ].col);
      square(35, 180, 280);

      //determine text color based on square color
      int highestVal = browseColoredSquares[saveI][saveJ].r; // check which int value is the greatest - r, g, or b.
      if(highestVal < browseColoredSquares[saveI][saveJ].g)
        highestVal = browseColoredSquares[saveI][saveJ].g;
      if(highestVal < browseColoredSquares[saveI][saveJ].b)
        highestVal = browseColoredSquares[saveI][saveJ].b;
    
      if(highestVal == browseColoredSquares[saveI][saveJ].b && browseColoredSquares[saveI][saveJ].r < 100 && browseColoredSquares[saveI][saveJ].g < 100) // When there's mostly blue, the colour is dark so we need a white text font
        fill(255);
      else if(highestVal > 150) // If highest int value between r, g, and b is greater than 100, the color is light/bright so the hexcode text is printed in black.
        fill(0);
      else // The coloured sqaure is too dark so the hexcode text should be printed in white
        fill(255);
      
      textSize(30);
      text("#" + hex(browseColoredSquares[saveBrowseI][saveBrowseJ].getHexCode(), 6), 165, 330);
    }
    
    for(int i=0; i<2; i++) {
      for(int j=0; j<3; j++) {
        paletteSquares[i][j].show = true;
        paletteSquares[i][j].drawSquare();
      }
    }
  }
  
  
  // screen 6 - displays our pre-made palette's names
  void explorePalettes() {
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    text("Explore Our\nFavorite Color Palettes!", width/2, 125);
    
    //colour options ("buttons")
    color[] col = {#7f89be, #d9542c, #dfb486, #bf560f, #34877c, #103630, #d78850, #947dbc, #494949};
    String[] colText = {"Winter Wonderland", "Vivid Spring", "Pastel Summer", "Pumpkin Spice", "Northern Lights", "Enchanted Forest", "Sunset by the Beach", "Lavender Landscape", "Monochromatic"};
    int buttonX = 12;
    int buttonY = 230;
    
    int n = 0;
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        exploreColorsOptions(col[n], colText[n], buttonX, buttonY);
        if(j < 2)
          buttonX += 262;
        else
          buttonX = 12;
        n++;
      }
      buttonY += 125;
    }
  }
  
  
  // screen 7 - deeper into the explore palettes (displays the palette colors and an image with the colors for inspiration for the user)
  void explorePaletteSelected() {
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    text(explorePreMadePalette, width/2, 125);

    int n = 0;
    
    // set rgb values for the Winter Wonderland palette
    if(explorePreMadePalette == "Winter Wonderland"){
      image(winterWonderland, 35, 180, 280, 280);
      for(int i=0; i<2; i++) {
        for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = winterW[n]; // set the rgb values of the coloredSquares in the paletteSquares array
          paletteSquares[i][j].g = winterW[n+1];
          paletteSquares[i][j].b = winterW[n+2];

          paletteSquares[i][j].show = true;
          paletteSquares[i][j].drawSquare();

          n += 3;
        }
      }
    }
    
    // set rgb values for the Vivid Spring palette
    else if(explorePreMadePalette == "Vivid Spring"){
      image(vividSpring, 35, 180, 280, 280);
      for(int i=0; i<2; i++) {
        for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = vSpring[n];
          paletteSquares[i][j].g = vSpring[n+1];
          paletteSquares[i][j].b = vSpring[n+2];

          paletteSquares[i][j].show = true;
          paletteSquares[i][j].drawSquare();

          n += 3;
        }
      }
    }

    // set rgb values for the Pastel Summer palette
    if(explorePreMadePalette == "Pastel Summer"){
      image(pastelSummer, 35, 180, 280, 280);
      for(int i=0; i<2; i++) {
        for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = pSummer[n];
          paletteSquares[i][j].g = pSummer[n+1];
          paletteSquares[i][j].b = pSummer[n+2];

          paletteSquares[i][j].show = true;
          paletteSquares[i][j].drawSquare();

          n += 3;
        }
      }
    }

    // set rgb values for the Pumpkin Spice palette
    else if(explorePreMadePalette == "Pumpkin Spice"){
      image(pumpkinSpice, 35, 180, 280, 280);
      for(int i=0; i<2; i++) {
        for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = pumpkinS[n];
          paletteSquares[i][j].g = pumpkinS[n+1];
          paletteSquares[i][j].b = pumpkinS[n+2];

          paletteSquares[i][j].show = true;
          paletteSquares[i][j].drawSquare();

          n += 3;
        }
      }
    }

    // set rgb values for the Northern Lights palette
    else if(explorePreMadePalette == "Northern Lights"){
      image(northernLights, 35, 180, 280, 280);
      for(int i=0; i<2; i++) {
        for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = nLights[n];
          paletteSquares[i][j].g = nLights[n+1];
          paletteSquares[i][j].b = nLights[n+2];

          paletteSquares[i][j].show = true;
          paletteSquares[i][j].drawSquare();

          n += 3;
        }
      }
    }

    // set rgb values for the Enchanted Forest palette
    else if(explorePreMadePalette == "Enchanted Forest"){
      image(enchantedForest, 35, 180, 280, 280);
      for(int i=0; i<2; i++) {
        for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = eForest[n];
          paletteSquares[i][j].g = eForest[n+1];
          paletteSquares[i][j].b = eForest[n+2];

          paletteSquares[i][j].show = true;
          paletteSquares[i][j].drawSquare();

          n += 3;
        }
      }
    }

    // set rgb values for the Sunset by the Beach palette
    else if(explorePreMadePalette == "Sunset by the Beach"){
      image(sunsetByTheBeach, 35, 180, 280, 280);
      for(int i=0; i<2; i++) {
        for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = sBeach[n];
          paletteSquares[i][j].g = sBeach[n+1];
          paletteSquares[i][j].b = sBeach[n+2];

          paletteSquares[i][j].show = true;
          paletteSquares[i][j].drawSquare();

          n += 3;
        }
      }
    }

    // set rgb values for the Lavender Landscape palette
    else if(explorePreMadePalette == "Lavender Landscape"){
      image(lavenderLandscape, 35, 180, 280, 280);
      for(int i=0; i<2; i++) {
        for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = lavenderL[n];
          paletteSquares[i][j].g = lavenderL[n+1];
          paletteSquares[i][j].b = lavenderL[n+2];

          paletteSquares[i][j].show = true;
          paletteSquares[i][j].drawSquare();

          n += 3;
        }
      }
    }

    // set rgb values for the Monochromatic palette
    else if(explorePreMadePalette == "Monochromatic"){
      image(monochromatic, 35, 180, 280, 280);
      for(int i=0; i<2; i++) {
        for(int j=0; j<3; j++) {
          paletteSquares[i][j].r = mono[n];
          paletteSquares[i][j].g = mono[n+1];
          paletteSquares[i][j].b = mono[n+2];

          paletteSquares[i][j].show = true;
          paletteSquares[i][j].drawSquare();

          n += 3;
        }
      }
    }
  }

  
  // screen 8 - displays a list of the palettes the user created + the Liked Colors palette which contains all the colors the user "liked" with the heart button
  void myPalettes() {
    textAlign(CENTER);
    textSize(50);
    fill(155, 98, 197);
    text("My Palettes", width/2, 125);
    
    // for liked colors palette
    fill(200,200,200);
    rect(100, 150, 680, 60); // background rectangle/button
    fill(0);
    textAlign(LEFT);
    textSize(30);
    text("Liked Colors", 110, 190);  // title
    textAlign(RIGHT);
    textSize(30);
    text(likedColors.size() + " Color(s)", 750, 190); // num colors in list
      
    int rectY = 213;
    int textY = 256;

    // for each palette the user created
    for(int i = 0; i < palettes.size(); i++){
      // if there are colors in the palette, set the rectangle color (behind the palette title text) to the first color in the palette. Else set to grey
      if(palettes.get(i).paletteColors.size() > 0)
        fill(palettes.get(i).paletteColors.get(0));
      else
        fill(200,200,200);
      rect(100, rectY+i*63, 680, 60);
      
      // the little square to click if user wants to delete or merge palettes
      if(palettes.get(i).mergeDeleteSelected == true)
        fill(155, 98, 197);
      else
        fill(225);
      square(38, rectY+17+i*63, 25);
      
      // get the value of the first color from the arrayList in the palette to determine the rgb.
      int r = int(red(palettes.get(i).paletteColors.get(0)));
      int g = int(green(palettes.get(i).paletteColors.get(0)));
      int b = int(blue(palettes.get(i).paletteColors.get(0)));
      
      int highestVal = r; // check which int value is the greatest - r, g, or b.
      if(highestVal < g)
        highestVal = g;
      if(highestVal < b)
        highestVal = b;
    
      if(highestVal == b && r < 100 && g < 100) // When there's mostly blue, the colour is dark so we need a white text font
        fill(255);
      else if(highestVal > 150) // If highest int value between r, g, and b is greater than 100, the color is light/bright so the text is printed in black
        fill(0);
      else // The coloured is too dark so the text should be printed in white
        fill(255);
      
      textAlign(LEFT);
      float scale = float (palettes.get(i).title.length()) / 30; // set the size of the text according to the length of the palette title (so the text doesn't go off screen)
      float textsize = 30;
      if(scale > 1)
        textsize = 30 / scale;
      if(textsize < 1)
        textsize = 1;
      textSize(textsize);
      text(palettes.get(i).title, 110, textY+i*63); // title of the palette
      
      textAlign(RIGHT);
      textSize(30);
      text(palettes.get(i).paletteColors.size() + " Color(s)", 750, textY+i*65); // num colors in palette
    }
    
    if(showMergeAndDeleteButton) { // if the little square to merge/delete the palettes are clicked
      fill(0);
      rect(0, height-42, width, 42);
    }
  }
  
  
  // screen 9 - deeper into myPalettes (shows the colors in the palette that the user chose to view)
  void myPalettesSelected() {
    int n = 0;
    textAlign(CENTER);
    float scale = float (paletteSelected.length()) / 30; // set the size of the text according to the length of the palette title (so the text doesn't go off screen)
    float textsize = 50;
    if(scale > 1)
      textsize = 50 / scale;
    if(textsize < 1)
      textsize = 1;
    textSize(textsize);
    fill(155, 98, 197);
    try {
      if(browseColoredSquares[1][1].ogY > -50) // to make the palette title "disapear" if the scroll bar moves the coloredSquares above it
        text(paletteSelected, width/2, 125);
      else {
        fill(255);
        rect(100, 80, 600, 50);
      }
    }
    catch(IndexOutOfBoundsException e){}
    
    // draw the appropriate amount of coloredSquares based on the amount of colors in the liked colors palette
    if(paletteSelected == "Liked Colors"){
      while(n < likedColors.size()) {
        for(int i = 0; i < 10 && n < likedColors.size(); i ++) {
          for(int j = 0; j < 3 && n < likedColors.size(); j++){
            browseColoredSquares[i][j].show = true;
            browseColoredSquares[i][j].drawSquare();
            n++;
          }
        }
      }
    }
    
    // if the palette view is one the user created
    else {
      int savePalette = -1;
      for(int p = 0; p < palettes.size(); p++){
        if(palettes.get(p).title.equals(paletteSelected)){ // detect which palette was selected
          savePalette = p;
        }
      }
      n = 0;
      try {
        while(n < palettes.get(savePalette).paletteColors.size()) { // draw the appropriate amount of coloredSquares based on the amount of colors in the palette
          for(int i = 0; i < 10 && n < palettes.get(savePalette).paletteColors.size(); i ++) {
            for(int j = 0; j < 3 && n < palettes.get(savePalette).paletteColors.size(); j++){
              browseColoredSquares[i][j].show = true;
              browseColoredSquares[i][j].drawSquare();
              n++;
            }
          }
        }
      } catch(IndexOutOfBoundsException e){} 
    }
  }
  
  
  // screen 10 - formated like a document. Explains elements of color theory to the user
  void colorTheory() {
    // Images
    image(ct1, this.x+100, this.y+370, 250, 250);
    image(ct2, this.x+465, this.y+730, 235, 175);
    image(ct3, this.x+460, this.y+910, 250, 250);
    image(ct4, this.x+100, this.y+1130, 250, 250);
    image(ct5, this.x+465, this.y+1340, 250, 250);
    image(ct6, this.x+465, this.y+1660, 250, 250);
    image(ct7, this.x+460, this.y+1910, 250, 250);
    
    // Headings
    textAlign(LEFT);
    textSize(24);
    fill(155, 98, 197);
    text("Color Theory", this.x+100, this.y+100);
    text("Intro to Color Theory", this.x+100, this.y+250);
    text("Terms", this.x+100, this.y+760);
    text("Complementary Colors", this.x+100, this.y+930);
    textAlign(RIGHT);
    text("Analogous Colors", this.x+700, this.y+1180);
    textAlign(LEFT);
    text("Triadic Colors", this.x+100, this.y+1400);
    text("60-30-10 Rule", this.x+100, this.y+1570);
    text("Monochromatic Colors", this.x+100, this.y+1720);
    text("Color Psychology", this.x+100, this.y+1850);
    text("More Tips and Tricks", this.x+100, this.y+2170);
    
    // Text
    textAlign(LEFT);
    textSize(12);
    fill(0);
    text("Did you know that people decide whether or not they like a product within 90 seconds of first seeing it? 90% of that decision is based on the color of the product. This is why color theory plays a crucial role in all business and design aspects. If you want your product, media, or artwork to be marketable or liked by your audience, you have come to the right place. Remember, art and design are processes that involve problem-solving. They won’t come to you in one day.",
      this.x+100, this.y+110, 600, 140);
    text("Color theory not only plays a part in the lives of traditional artists (eg. painters, drawers, etc.), but also in the lives of designers and influencers of growing online platforms. Picking colors may seem like an easy choice. It just has to look good, right? Unfortunately, it’s not that easy. Everyone has different colour preferences, so it can be very time-consuming to come up with the perfect color combination that appeals to everyone.",
      this.x+100, this.y+260, 600, 140);
    text("To begin, we must talk about the primary colors, which are red, yellow and blue. Using these colors, as well as black and white, you can create any color in the world. While the mixing of colors may be different in traditional art, RGB and CMYK, they are all perceived similarly to the average human. So how do we put colors together? And what do we need to watch out for?",
      this.x+100, this.y+640, 600, 140);
    text("Hue - The colors of the rainbow like red, orange, yellow, etc. \nShade - When you add black to a hue to make it darker \nTint - When you add white to a hue to make it lighter. Pastels are tints. \nTone - When you add gray to a hue to make the color less saturated. Gray consists of equal amounts of black and white",
      this.x+100, this.y+770, 365, 140);
    text("Complementary colors are colors that are located on opposite sides of the color wheel. For example, red and green. They are colors that help each other stand out, giving a very bold effect to your design. But watch out! They are colors that really require you to find the right shade. Otherwise, it could be very tiring on the eyes. A tip to make complementary colors look better together is to add a bit of the other color into them (eg. mixing a little red into the green shade and a little green into the red shade). This method also works with other colors.",
      this.x+100, this.y+940, 360, 200);
    textAlign(RIGHT);
    text("Analogous colors are the three colors that are right beside each other on the color wheel. For example, red, orange and yellow. Numerous brands use analogous colors to make their websites and apps pleasing to the eye. For example, Canva’s colours range from bright cyan to purple. This colour choice works well in most use cases. For things like interior or aesthetic design, try to go for more muted tones of the three colors.",
      this.x+360, this.y+1190, 340, 200);
    textAlign(LEFT);
    text("Triadic colors are very similar to complementary colors. However, instead of opposites, they take colors that are evenly spaced from each other. This appears as a triangle shape on the color wheel. Like complementary colors, triadic colors make the colors pop in a harmonious way. When using triadic colors, a good rule to consider is the 60-30-10 rule.",
      this.x+100, this.y+1410, 360, 200);
    text("The 60-30-10 rule is a rule that helps you balance the colors used in a design so they don't appear to be overdone or have too many colors. Of course, with experience you may not want to follow this rule all the time. This rule separates the percentages of each of the three colors. Your main color, or base color, will cover 60% of the design, your secondary color will fill 30%, and the final 10% will be the accent color.",
      this.x+100, this.y+1580, 600, 140);
    text("Monochromatic colors are different tints, shades and tones of one color. They are often used for minimalistic aesthetics and simple designs. One benefit of using monochromatic colors is that they will never clash since it’s a single colour.",
      this.x+100, this.y+1730, 360, 200);
    text("Different colors often have different meanings based on where they are normally used or where you see them. By using different colors in their art, artists are able to send a deeper message to their audience. Keep in mind that some colors have different meanings in other cultures or regions. \n\nRed - passion, danger, excitement, traditional, good luck \nOrange - creativity, energy, adventure, youth, warmth \nYellow - happy, optimistic, cheerful, wealth, time, light \nGreen - nature, environment, growth, healthy \nBlue - sadness, loyal, calm, stable, trustworthy \nPurple - royalty, wealth, creativity, mystery, wisdom \nBlack - formal, luxury, negativity, evil, death \nWhite -  purity, innocence, positivity, calm, death",
      this.x+100, this.y+1860, 360, 300);
    text(" -  Use only a few colors. Too many colors, especially bold ones, can take away from the effect, and can even make your project look cluttered. \n -  A saturated color will pop more when paired with a less saturated color. On the other hand, a bunch of saturated colors can overwhelm the audience. \n -  Do not rely solely on color to communicate a message since many people experience color blindness. For example, if a person is unable to see a shade of green, the emotion associated with that particular shade of green will not appear for them. \n -  Make sure that layered colors contrast from each other, so that the text/content is distinguishable from the surrounding colors. For example, avoid adding white text on top of light colors such as yellow so it is more accessible to people with visual impairments. \n -  Note how the appearance of a color is affected by the colors surrounding it. Make the appropriate changes to enhance the appearance.",
      this.x+100, this.y+2180, 600, 500);
  }
}
