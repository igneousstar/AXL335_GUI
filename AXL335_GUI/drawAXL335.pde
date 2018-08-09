
void drawAXL335(float x, float y, float z){
  int w = width/2;
  int h = height/2;
  PVector currentV = new PVector(x, y, z);
  currentV.setMag(160);
  
  strokeWeight(5);

  
  stroke(#0000ff);
  line(w, h, 0, currentV.x + w, currentV.z + h, currentV.y);
  stroke(#0f000f);
  line(w, h, 0, -currentV.x + w, -currentV.z + h, -currentV.y);
  
}
