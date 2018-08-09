import processing.serial.*;

/**
* The com port the arduino is on
*/

Serial myPort;

/**
* the incoming String from 
* the Arduino
*/
String dataIn;

/**
* The expected data recieved 
*/
static final int dataSize = 3;

/**
* The incomeing serial data
*/
float[] serialData;

/**
* A timer for different actions
*/
long timer;

/**
* displays for the x, y, z acceloration
*/

Gauge x;
Gauge y;
Gauge z;

Graph xyz;

float[] graphData = {0,0,0,0};

void setup(){
  
  //set up the array
  serialData = new float[dataSize];
  for(int i = 0; i < dataSize; i++){
    serialData[i] = 0;
  }
  
  x = new Gauge("X", width/5, height/4, 0, 255);
  y = new Gauge("Y", width/5, height/2, 0, 255);
  z = new Gauge("Z", width/5, (height*3)/4, 0, 255);
  
  String[] names = {"X", "Y", "Z", "C"};
  int[] colors = {#ff0000, #00ff00, #0000ff, #000000};
  
  xyz = new Graph("XYZ", (4*width)/5, height/2, names, 5000);
  
  xyz.setColors(colors);
  
  x.setSecondColor(#ff0000);
  y.setSecondColor(#00ff00);
  z.setSecondColor(#0000ff);
  
  //set the window and background
  size(1400, 700, P3D);
  background(#044f6f);
  
  //start the timer for comSelect
  timer = millis() -3000;
}

void draw(){
  
  background(#044f6f);
  if(myPort == null){
    selectCom();
  }
  else{
    readSerial();
    
    drawAXL335(serialData[0], serialData[1], serialData[2]);
    
    x.setValues(abs(serialData[0]));
    y.setValues(abs(serialData[1]));
    z.setValues(abs(serialData[2]));
    
    graphData[0] = serialData[0];
    graphData[1] = serialData[1];
    graphData[2] = serialData[2];
    xyz.setValues(graphData);
    
    x.drawUI();
    y.drawUI();
    z.drawUI();
    xyz.drawUI();
    printSerialData();
  }
}
