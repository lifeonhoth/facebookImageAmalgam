/*
Fletcher Bach 2015
 Averages pixel r, g, and b values from a series of source images.  
*/

PImage sourceImgs[] = new PImage[30];

void setup() {
  size(500,500); // source images must be the exact same pixel dimensions as canvas size!
  loadSrcImgs();  //loads source images into array from data folder
  getPixelVals(); //gets pixel values from each image
  saveImage();    //saves new image made from average of pixel values
}

void draw() {
  
}

void loadSrcImgs() {
  for (int i = 0; i < sourceImgs.length; i++) {
    sourceImgs[i] = loadImage("image" + i + ".jpg");
  }
}

void getPixelVals() {
  loadPixels(); 

  //sourceImgs[0].loadPixels(); 
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      //for(int i = 0; i < sourceImgs.length; i++){

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      //      float r = red(sourceImgs[i].pixels[loc]);
      //      float g = green(sourceImgs[i].pixels[loc]);
      //      float b = blue(sourceImgs[i].pixels[loc]);
      
      // totals across all images
      float rTotal = 0;
      float gTotal = 0;
      float bTotal = 0;

      for(int i = 0; i < sourceImgs.length; i++){
         rTotal = rTotal + red(sourceImgs[i].pixels[loc]);
         gTotal = gTotal + green(sourceImgs[i].pixels[loc]);
         bTotal = bTotal + blue(sourceImgs[i].pixels[loc]);
      }


      float rAvg = rTotal/sourceImgs.length;
      float gAvg = gTotal/sourceImgs.length;
      float bAvg = bTotal/sourceImgs.length;

      // Set the display pixel to the image pixel
      pixels[loc] =  color(rAvg, gAvg, bAvg); 
      
    }
  }
  updatePixels();
}

void saveImage() {
  save("outputImage.jpg");
}








