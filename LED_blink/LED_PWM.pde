// make sure the chosen pin has pwn written on it
// this makes it an analogue out pin.
// connect it to an LED on the breadboard making sure ground is connected
// also keep a 2.2k resistor between PIN and LED *NoT* LED and GND
int ledPin = 11;
float sinVal;
int ledVal;

void setup() {
   pinMode(ledPin, OUTPUT);
}


void loop() 
{
  for (int x=0; x<180; x++) 
  {    
      sinVal = (sin(x*(3.1412/180)));
      ledVal = int(sinVal*255);
      analogWrite(ledPin, ledVal);
      delay(10);
  }
}
