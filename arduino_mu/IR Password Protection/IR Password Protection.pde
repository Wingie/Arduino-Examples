#include <IRremote.h>
#include <EEPROM.h>

byte t,i,n,h;
int m,p,value;

IRrecv irrecv(A0);

decode_results results;

void setup()
{
  Serial.begin(9600);
  irrecv.enableIRIn();
  pinMode(2,OUTPUT);
  passret();
  Serial.println("\nEnter the psd\n");
  if(value==0)
  {
    Serial.println("No Password Getting");
    getpass();
    passset();
    digitalWrite(2,HIGH);
    Serial.println("Password Set Ok");
  }
  else
  {
    if(compass()!=1)
    {
      Serial.println("Wrong Password Resetting\n");
      digitalWrite(2,HIGH);
    }
    else
    {
      Serial.println("Password Ok");
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
        Serial.println("Enter your old psd\n");
        if(compass()==1)
        {
          Serial.println("Enter your New psd\n");
          getpass();
          passset();
          Serial.println("New Psd Updated");
          digitalWrite(2,HIGH);
        }
        else
        {
          Serial.println("Wrong Psd\n");
          n=0;
        }
      }
      default:  
        Serial.println(n,DEC);
        n=0;
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
          Serial.println("\nEnter the psd again\n");
          n=0;
          getpass();
        }
       else
        {
           if(h>=1)
            {
             if(n>0&&n<10)
              {
               Serial.print("*");
               p = p+n*powe(10,h-1);
               --h;
               n=0;
              }
            }
           else
            {
               if(n==22)
                {
                 Serial.println();
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
   Serial.print("\nPassword set suces\n");
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
