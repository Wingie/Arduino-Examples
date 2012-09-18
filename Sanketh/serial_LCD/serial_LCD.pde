#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
int rx=2,tx=3;
char a[14];
int ctr;
void setup()
{
  lcd.begin(16, 2);
 // pinMode(rx, INPUT);
   Serial.begin(9600);
}
void loop()
{
   if(Serial.available())
  {
    while(Serial.available()>0 && ctr<16)
    {
      a[ctr]=Serial.read();
      ctr++;
    }
  }
 // Serial.println(a);
 lcd.clear();
    lcd.setCursor(0, 0); 
     lcd.print(a);
     delay(200);
}
  
