

int an1,an2 = 0;
int redLedPin =13;
boolean triggered = false;

void setup(){
Serial.begin(9600);
pinMode(redLedPin, OUTPUT); // set the red LED pin to be an output
// Serial.println("Starting");
}
void loop(){
// read analog value in
int an2 = analogRead(0);
Serial.print("Y");
Serial.println(an2,DEC);
//threshold
int an1= analogRead(5);
Serial.print("X");
Serial.println(an1,DEC);


if(an1 > an2 && !triggered){
  triggered = true;
  digitalWrite(redLedPin, HIGH); // turn off the red LED
}
if(an1 <= an2 && triggered){
  triggered = false;
  digitalWrite(redLedPin, LOW); // turn off the red LED
}
} 
