/* Name: Alfrancis Guerrero 
 * Date: 6/2/2016 
 * Notes: Processing file run w/Arduino and Bluetooth Module device. 
 */

import processing.serial.*;
import java.nio.ByteBuffer;

PrintWriter mLogger;

Serial myPort;
float[] mDataRead = {0.0, 0.0}; 
float mPosition;
float mPositionAfter;

float time; 
float prevtime; 
void setup()
{  
  mPosition      = 0;
  mPositionAfter = 0;
  time         = 0.0; 
  prevtime     = 0.0;

  myPort = new Serial(this, "/dev/cu.HC-06-DevB", 9600);

  mLogger = createWriter("DataOutput.csv");
  mLogger.println("Time" + "," + "Distance (m)" + "," + "");

  size(500, 500);
}

void draw()
{
  time = millis();
  background(0);
  fill(255);

  while (myPort.available() > 2) 
  {

    for (int i = 0; i < 2; i++) 
    {
      mDataRead[i] = myPort.read();
    }

    println("Data Read: " + mDataRead[0] + " " + mDataRead[1] );
  }
  mPosition = (int)mDataRead[0];
  //mPosition = map(mPosition);

  ellipse(width/2, height - height/4, 50, 50);


  rect(100, mPosition, 300, 10 );
}


/*
 if (mVal != mValPrev)
 {
 //myPort.write((int)mVal); 
 //myPort.write((int)50);
 mByte[0] = mVal;
 mByte[1] = 0;
 
 for (int i = 0; i < 2; i++)
 {    
 myPort.write((int)mByte[i]);
 }  
 
 
 print("| Tx" + 0 + "__"+mByte[0]);
 print("| Tx" + 1 + "__"+mByte[1]);
 
 for (int i = 0; i < 2; i++)
 {    
 mByteRead[i] = myPort.read();
 }      
 
 print(" | Rx" + 0 + "__"+ (int)mByteRead[0] );
 print(" | Rx" + 1 + "__"+ (int)mByteRead[1] );
 println("");
 mValPrev = mVal;
 }
 */