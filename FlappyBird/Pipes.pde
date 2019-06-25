class Pipes {
  int barX, barY, w, h;
  boolean checked;
  
  Pipes() {
    this(width);
  }
  
  Pipes(int v) {
    barX = v;
    barY = (int)random(40, 230) - 760;
    w = 50;
    h = 800;
  }
  
  void randBarY(){
    barY = (int)random(40, 230) - 760;
  }
  
  void setBarX(int w) {
    barX = w;
  }
  
  int getBarX() {
    return barX;
  }
  
  void setChecked(boolean bool) {
    checked = bool;
  }
  
  boolean isTouching(float xPos, float yPos) {
        // right side          left side
    if(xPos + 70 > barX && xPos < barX + w - 40) { // x boundries
      // y boundaries
      if(yPos < barY + h - 17) // top bar
        return true;
      if(yPos + 54 > barY + 974) // bottom bar
        return true;
    }
    return false;
  }
  
  boolean score(float xPos) {
    if(barX < xPos && !checked) {
      setChecked(true);
      return true;
    }
    return false;
  }
  
  void draw() {
    //image(top, barX, barY, w, h);
    //image(bottom, barX, barY, w, h); 
    fill(0, 204, 0);
    rect(barX, barY, w, h);
    rect(barX, barY + 950, w, h);
  }
  
  void update() {
    barX -= 1.5;
  }
}