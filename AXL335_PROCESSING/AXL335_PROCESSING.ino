//Z 412, 277 (ARROW DOWN, TAIL DOWN)
//Y 267, 400 
//X 270, 403

/**
 * The pins for the accelerometer
 */
#define X_PIN A0
#define Y_PIN A1
#define Z_PIN A2

/**
 * These need to be found
 * by testing the accelerometer
 */
#define X_MAX 403
#define X_MIN 270

#define Y_MAX 400
#define Y_MIN 267

#define Z_MAX 412
#define Z_MIN 277

#define OUT_DATA_SIZE 3

//Variables used to send data
float outGoingData[OUT_DATA_SIZE];

int xCenter;
int yCenter;
int zCenter;

void setup() {
  Serial.begin(9600);
  pinMode(X_PIN, INPUT);
  pinMode(Y_PIN, INPUT);
  pinMode(Z_PIN, INPUT);

  //find the point of 0 G's
  xCenter = (X_MAX + X_MIN) / 2;
  yCenter = (Y_MAX + Y_MIN) / 2;
  zCenter = (Z_MAX + Z_MIN) / 2;
}

void loop() {
  outGoingData[0] = analogRead(X_PIN) - xCenter;
  outGoingData[1] = analogRead(Y_PIN) - yCenter;
  outGoingData[2] = analogRead(Z_PIN) - zCenter;
  sendData();
}


/**
 * sends data to the computer
 */
void sendData(){
  //start the string with the first value
  String outGoingString = "";
  for(int i = 0; i < OUT_DATA_SIZE; i++){
    outGoingString = outGoingString + outGoingData[i];
    outGoingString = outGoingString + ",";
  }
  Serial.println(outGoingString);
}



