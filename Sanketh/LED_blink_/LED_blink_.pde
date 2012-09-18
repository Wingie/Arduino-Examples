int ledPin = 12;
long t1=0,t2=0;
volatile int state = LOW, state2=LOW;
void setup()
{
  pinMode(12,OUTPUT);
  Serial.begin(9600);
}
void loop()
{
  state=digitalRead(2);  
  Serial.println(state);
  //Serial.println(t);
  if(state==1)
  {
       t1=millis();
       while(state==1)
         t2=millis();
       if((t1-t2)>1000)
       {        
        blink();
       }
       else
       {
          digitalWrite(ledPin, state);
       } 
  } 
  else
  {
    digitalWrite(ledPin, LOW);
    t1=t2=0;
  } 
  
}

void blink()
{
  
  digitalWrite(ledPin, state2);
  state2=!state2;
  delay(100);
}

  
