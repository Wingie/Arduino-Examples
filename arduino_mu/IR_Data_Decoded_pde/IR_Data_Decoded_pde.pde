#include <IRremote.h>
#include <EEPROM.h>
#include <LiquidCrystal.h>

byte t,i,n,h;
int m,p,value;

IRrecv irrecv(A0);

LiquidCrystal lcd(12, 11, A1, A2, A3, A4);

decode_results results;

void setup()
{
  lcd.begin(16, 2);
  irrecv.enableIRIn();
  pinMode(A5,OUTPUT);
  passret();
  lcd.clear();
  lcd.print("Enter the PIN:");
  lcd.setCursor(0,1); 
  if(value==0)
  {
    lcd.clear();
    lcd.print("No PIN");
    delay(3000);
    lcd.clear();
    lcd.print("Enter new PIN:");
    lcd.setCursor(0,1);
    getpass();
    passset();
    lcd.clear();
    lcd.print("PIN Stored");
    digitalWrite(A5,HIGH);
  }
  else
  {
    if(compass()!=1)
    {
      lcd.clear();
      lcd.print("Wrong PIN");
      delay(1000);
      lcd.clear();
      lcd.print("Resetting");
      digitalWrite(A5,HIGH);
      while(2>1)
      {
      }  
    }
    else
    {
      lcd.clear();  
      lcd.print("PIN OK");
      delay(1000);
      lcd.clear();
    }
  }    
}
  
void loop() 
{
  n=0;
  if (irrecv.decode(&results))
  {
    ir();
    if(n>0&&n<32)
    switch(n)
    {
      case 25:
      {
        lcd.clear();  
        lcd.print("Enter old PIN:");
        lcd.setCursor(0,1); 
        if(compass()==1)
        {
          
          lcd.clear();  
          lcd.print("Enter New PIN:");
          lcd.setCursor(0,1); 
          getpass();
          passset();
          lcd.clear();  
          lcd.print("New PIN Updated");
          digitalWrite(A5,HIGH);
        }
        else
        {
          lcd.clear();  
          lcd.print("Wrong PIN");
          delay(2000);
          lcd.clear();
          n=0;
        }
      }
      default:
    {  
        if(n!=0)
        {
        lcd.clear();
        lcd.print(n,DEC);
        n=0;
        }
    }
    }
  }
}
  
void getpass()
{
  p=0;
  h=4;
  while(1<2)
  {
    if (irrecv.decode(&results)) 
    {
      ir();
      if(n==29)
        {
          lcd.clear();
          lcd.print("Enter PIN Again:");
          lcd.setCursor(0,1);
          n=0;
          getpass();
        }
       else
        {
           if(h>=1)
            {
             if(n>0&&n<10)
              {  
               lcd.print("*");
               lcd.leftToRight(); 
               p = p+n*powe(10,h-1);
               --h;
               n=0;
              }
            }
           else
            {
               if(n==22)
                {
                 return;
                } 
             }  
          }
      
     }  
   }
 }


void ir()
{
    m = results.value;
    if(m!=0xFFFFFFFF)
    {
    n=0;
    t = ~(m & 255);
    m=0;
    for(i=7;i>=4;--i)
    {
      
      n = n|((t & powe(2,i)) >> (i-m))|((t & powe(2,7-i)) << (i-m));
      m=m+1;
     }
   }
   irrecv.resume();
}

void passset()
{
   EEPROM.write(233, p/100);
   EEPROM.write(234, p%100);
}

void passret()
{
  value = EEPROM.read(233);
  value = (value*100)+EEPROM.read(234);
}

byte compass()
{
  getpass();
  if(p==value)
   return 1;
  else
   return 2;
} 
  
int powe(byte k,byte y)
{
  int z,x=1;
  if(y==0)
  {
    return x;
  }
  else
  {
  for(z=1;z<=y;z++)
  {
    x=x*k;
  }
  return x;
  }
}  
