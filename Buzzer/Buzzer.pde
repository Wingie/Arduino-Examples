// uses the buzzer on the pin. digital write causaes a 


int ledPin = 6;
float sinVal;
int ledVal;
int val;
void setup()
{
pinMode(9, INPUT);
pinMode(6,OUTPUT);
Serial.begin(9600);
val = 0;
}

void loop()
{
  val = digitalRead(9);
  Serial.println(val,DEC);

// dig write
  digitalWrite(6,!val);
// analogue write
  if(val == 0)
    siren();
}

void siren()
{
for (int x=0; x<180; x++) 
  {    
      sinVal = (sin(x*(3.1412/180)));
      ledVal = int(sinVal*255);
      analogWrite(ledPin, ledVal);
      delay(10);
  }
}
