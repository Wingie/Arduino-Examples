// IR sensor shield
// digital read 10. it'll b one or 0. 
int val;
void setup()
{
Serial.begin(9600);
pinMode(6,OUTPUT);
pinMode(10, INPUT);
}

void loop()
{
 val = digitalRead(10);
 Serial.println(val,DEC);
 digitalWrite(6,!val);
}
