//pwn code.. issues with this code might be due to pwn inteference from breadboard. check connections repeatedly.

int servo = 6;

int angle;
int pwm;

void setup()
{
  pinMode(servo, OUTPUT);
  Serial.begin();
}

void loop ()
{
  for (angle = 0; angle <= 180; angle += 10)  {
    servoPulse(servo, angle
    );  
  }
  for (angle = 180; angle >= 0; angle -= 10)  {
    servoPulse(servo, angle);  }
}
  
void servoPulse (int servo, int angle)
{
  pwm = (angle*11) + 500;      // Convert angle to microseconds
  digitalWrite(servo, HIGH);
  delayMicroseconds(10);
  digitalWrite(servo, LOW);
  delay(50);                   // Refresh cycle of servo
} 

