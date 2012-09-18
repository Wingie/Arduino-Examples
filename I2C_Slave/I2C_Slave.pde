#include <Wire.h>

void setup()
{
  pinMode(13, OUTPUT);  
  Serial.begin(9600);           // start serial for output
  Wire.begin(4);                // join i2c bus with address #4
  Wire.onReceive(receiveEvent); // register event
}

void loop()
{
  delay(100);
}

// function that executes whenever data is received from master
// this function is registered as an event, see setup()
void receiveEvent(int howMany)
{
  while(1 < Wire.available()) // loop through all but the last
  {
    char c = Wire.receive(); // receive byte as a character
    Serial.print(c);         // print the character
  }
  int x = Wire.receive();    // receive byte as an integer
  Serial.println(x);         // print the integer
  digitalWrite(13, HIGH);
  delay(x);
  digitalWrite(13, LOW);
  delay(x);
  
}
