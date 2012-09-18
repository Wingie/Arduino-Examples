#include <Wire.h>

void setup()
{
  Wire.begin(); // join i2c bus (address optional for master)
  Serial.begin(9600);  //Start Serial Communication
}

int x = 0;

void loop()
{
  x = Serial.read();
  Serial.println(x);
  Wire.beginTransmission(4); // transmit to device #4
  Wire.send("x is ");        // sends five bytes
  Wire.send(x);              // sends one byte  
  Wire.endTransmission();    // stop transmitting

  x++;
  delay(1000);
}
