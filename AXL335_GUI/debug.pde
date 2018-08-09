/*********************************************************
This set of functions is meant to be used in debugging and
they were also used in testing the code. Feel free to use them, 
however they may not be of much use. 
**********************************************************/

/**
* does a printout of all
* the serial data
*/
void printSerialData(){
  println("In Coming Data String");
  println(dataIn);
  if(serialData != null){
    String dataStr = "" + serialData[0];
    for(int i = 1; i < serialData.length; i++){
      dataStr = dataStr + "," + serialData[i];
    }
    println("In Coming Data Parsed: ");
    println(dataStr);
  }
}
