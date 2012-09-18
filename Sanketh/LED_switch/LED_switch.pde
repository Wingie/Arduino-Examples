int ledPin = 12;
volatile int state = LOW;
void setup()
{
  pinMode(12,OUTPUT);
  Serial.begin(9600);
}
void loop()
{
  state=digitalRead(2);
  Serial.println(state);
  digitalWrite(ledPin, state);
}  


  
