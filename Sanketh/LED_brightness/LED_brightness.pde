int sensorVal=0,ledPin=10;
void setup()
{
  pinMode(ledPin,OUTPUT);
  Serial.begin(9600);
}

void loop() 
{
  sensorVal = analogRead(A0);
  sensorVal/=4;
  Serial.println(sensorVal);
  analogWrite(ledPin, sensorVal);
 }
