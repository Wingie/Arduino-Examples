// the sensor shield has two LEDs atached on pin 0 and 1. 
//this code alternates then using the delay functions


void setup()
{
  pinMode(0,OUTPUT);
  pinMode(1,OUTPUT);
}

void loop()
{
  digitalWrite(0,LOW);
  digitalWrite(1,HIGH);
  delay(1000);
  digitalWrite(0,HIGH);
  digitalWrite(1,LOW);
  delay(1000);
}
