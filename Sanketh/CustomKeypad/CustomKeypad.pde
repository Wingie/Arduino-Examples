/* @file CustomKeypad.pde
|| @version 1.0
|| @author Alexander Brevig
|| @contact alexanderbrevig@gmail.com
||
|| @description
|| | Demonstrates changing the keypad size and key values.
|| #
*/
#include <Keypad.h>

const byte ROWS = 4; //four rows
const byte COLS = 4; //four columns
//define the cymbols on the buttons of the keypads
char hexaKeys[ROWS][COLS] = {
  {'7','8','9','x'},
  {'4','5','6','/'},
  {'1','2','3','+'},
  {'0','.','=','-'}
};
byte rowPins[ROWS] = {8, 7, 6, 5}; //connect to the row pinouts of the keypad
byte colPins[COLS] = {9, 2, 3, 4}; //connect to the column pinouts of the keypad

//initialize an instance of class NewKeypad
Keypad cusomKeypad = Keypad( makeKeymap(hexaKeys), rowPins, colPins, ROWS, COLS); 

void setup(){
  Serial.begin(9600);
}
  
void loop(){
  char customKey = cusomKeypad.getKey();
  
  if (customKey != NO_KEY){
    Serial.println(customKey);
  }
}
