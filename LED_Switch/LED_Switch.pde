
#include <avr/interrupt.h>

int ledPin = 12;

volatile int state = LOW;

/*
hardware notes:
led on pin 12 
pin 2 is INT0 Connected to ground with resistor. 
the other end of pin to VCC.
the switch beghins interrupts

serial line is also open and outputs the led state
*/

void setup() {
    Serial.begin(9600);
    pinMode(12, OUTPUT);
   attachInterrupt(0, blink, FALLING);

}



void loop() 
{
  digitalWrite(ledPin,state);
}

void blink()
{
  state = !state;
  if(state == 1)
    Serial.println("Light ON");
  else
    Serial.println("Light OFF");  
}


