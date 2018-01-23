
PImage img_before;
PImage img_after;
int scale;
int dist = 4;

void setup() {
  img_before = loadImage("img.jpg");
  img_after = loadImage("img.jpg");
  size(2880, 1000);
  // Draw original image on left
  image(img_before, 0, 0);
  scale = 5;
  updateImages();
}


int index(int x, int  y) {
    return x + y * img_after.width;
}
 
void updateImages() {
  
  img_after = createImage(img_before.width, img_before.height, RGB);
  
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
      float r_new_unscaled = p1r * (1/8)   + p2r * (2/8)   + p3r * (3/8)   + p4r * (4/8)   + p5r * (5/8)   + p6r * (6/8)   + p7r * (7/8)   + p8r * (8/8);
      float g_new_unscaled = p1r * (4/8)   + p2r * (5/8)   + p3r * (6/8)   + p4r * (7/8)   + p5r * (8/8)   + p6r * (1/8)   + p7r * (2/8)   + p8r * (3/8);
      float b_new_unscaled = p1r * (8/8)   + p2r * (7/8)   + p3r * (6/8)   + p4r * (5/8)   + p5r * (4/8)   + p6r * (3/8)   + p7r * (2/8)   + p8r * (1/8);
      
      int r_new = round(map(r_new_unscaled, min_start, max_start, min_end, max_end));
      int g_new = round(map(g_new_unscaled, min_start, max_start, min_end, max_end));
      int b_new = round(map(b_new_unscaled, min_start, max_start, min_end, max_end));
      

      img_after.pixels[index(x,y)] = color(r_new, g_new, b_new);

      //img_after.pixels[i1] = color(int(red(p1) * (1/8)), int(green(p1) * (4/8)), int(blue(p1) * (8/8)));
      //img_after.pixels[i2] = color(int(red(p2) * (2/8)), int(green(p2) * (5/8)), int(blue(p2) * (7/8)));
      //img_after.pixels[i3] = color(int(red(p3) * (3/8)), int(green(p3) * (6/8)), int(blue(p3) * (6/8)));
      //img_after.pixels[i4] = color(int(red(p4) * (4/8)), int(green(p4) * (7/8)), int(blue(p4) * (5/8)));
      //img_after.pixels[i5] = color(int(red(p5) * (5/8)), int(green(p5) * (8/8)), int(blue(p5) * (4/8)));
      //img_after.pixels[i6] = color(int(red(p6) * (6/8)), int(green(p6) * (1/8)), int(blue(p6) * (3/8)));
      //img_after.pixels[i7] = color(int(red(p7) * (7/8)), int(green(p7) * (2/8)), int(blue(p7) * (2/8)));
      //img_after.pixels[i8] = color(int(red(p8) * (8/8)), int(green(p8) * (3/8)), int(blue(p8) * (1/8)));

    }
  }

  img_after.updatePixels();
}

void draw() {
  
  
  // Draw Buttons
  
  

  int scale_change = 5;
  
  
  if (mousePressed && (mouseButton == LEFT)) {
    if (dist < 250) {
    dist += 1;
    updateImages();
    }
    print(scale,"\n");
  } else if (mousePressed && (mouseButton == RIGHT)) {
    if (dist > 1) {
      dist -= 1;
    updateImages();
    }
  }
  

  // And Draw new image on right
  image(img_before, 0, 0);
  image(img_after, img_before.width, 0);

}
