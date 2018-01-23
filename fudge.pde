
PImage img_before;
PImage img_after;
int dist = 4;

void setup() {

  // Set Window Size
  size(2880, 1000);
  
  // Load Image
  img_before = loadImage("img.jpg");
  
  // Draw Original Image
  image(img_before, 0, 0);
  
  // Generate New image
  updateImages();
}


int index(int x, int  y) {
    return x + y * img_after.width;
}
 
void updateImages() {
  
  // Blank the distorted image
  img_after = createImage(img_before.width, img_before.height, RGB);
  
  
  // Loop through pixels.
  img_after.loadPixels();
  for (int y = 1 + dist; y < img_after.height - dist; y++) {
    for (int x = 1 + dist; x < img_after.width - dist; x++) {
            
      // Center Pixel
      int i = index(x,y);
      color p = img_before.pixels[i];
      float r = red(p);
      float g = green(p);
      float b = blue(p);
            
      // Pixel 1
      int i1 = index(x,y-dist);
      color p1 = img_before.pixels[i1];
      float p1r = red(p1);
      float p1g = green(p1);
      float p1b = blue(p1);
      
      // Pixel 2dist
      int i2 = index(x+dist,y-dist);
      color p2 = img_before.pixels[i2];
      float p2r = red(p2);
      float p2g = green(p2);
      float p2b = blue(p2);
      
      // Pixel 3
      int i3 = index(x-dist,y);
      color p3 = img_before.pixels[i3];
      float p3r = red(p3);
      float p3g = green(p3);
      float p3b = blue(p3);
      
      // Pixel 4
      int i4 = index(x,y);
      color p4 = img_before.pixels[i4];
      float p4r = red(p4);
      float p4g = green(p4);
      float p4b = blue(p4);
      
      // Pixel 5
      int i5 = index(x+dist,y);
      color p5 = img_before.pixels[i5];
      float p5r = red(p5);
      float p5g = green(p5);
      float p5b = blue(p5);
      
      // Pixel 6
      int i6 = index(x-dist,y+dist);
      color p6 = img_before.pixels[i6];
      float p6r = red(p6);
      float p6g = green(p6);
      float p6b = blue(p6);
      
      // Pixel 7
      int i7 = index(x,y+dist);
      color p7 = img_before.pixels[i7];
      float p7r = red(p7);
      float p7g = green(p7);
      float p7b = blue(p7);
      
      // Pixel 8
      int i8 = index(x+dist,y+dist);
      color p8 = img_before.pixels[i8];
      float p8r = red(p8);
      float p8g = green(p8);
      float p8b = blue(p8);
      
      float min_start = 0;
      float max_start = 255;
      float min_end = 0;
      float max_end = 255;
      
      // Distort the r, g, b values
      float r_new_unscaled = p1r * (1/8)   + p2r * (2/8)   + p3r * (3/8)   + p4r * (4/8)   + p5r * (5/8)   + p6r * (6/8)   + p7r * (7/8)   + p8r * (8/8);
      float g_new_unscaled = p1r * (4/8)   + p2r * (5/8)   + p3r * (6/8)   + p4r * (7/8)   + p5r * (8/8)   + p6r * (1/8)   + p7r * (2/8)   + p8r * (3/8);
      float b_new_unscaled = p1r * (8/8)   + p2r * (7/8)   + p3r * (6/8)   + p4r * (5/8)   + p5r * (4/8)   + p6r * (3/8)   + p7r * (2/8)   + p8r * (1/8);
      
      // Scale the r, g, b values after distortion, mapping them from 0 to 255 
      int r_new = round(map(r_new_unscaled, min_start, max_start, min_end, max_end));
      int g_new = round(map(g_new_unscaled, min_start, max_start, min_end, max_end));
      int b_new = round(map(b_new_unscaled, min_start, max_start, min_end, max_end));
      
      // Set the new Pixel Value for x, y
      img_after.pixels[index(x,y)] = color(r_new, g_new, b_new);
    }
  }

  img_after.updatePixels();
}

void draw() {
  
  
  if (mousePressed && (mouseButton == LEFT)) {
    if (dist < 250) {
    dist += 1;
    updateImages();
    }
  } else if (mousePressed && (mouseButton == RIGHT)) {
    if (dist > 1) {
      dist -= 1;
    updateImages();
    }
  }
  

  // Draw images again
  image(img_before, 0, 0);
  image(img_after, img_before.width, 0);

}
