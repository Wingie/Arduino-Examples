// PIR model seems to differ... TOFO: find exaact pir model we have and get datasheet of that
int calibrationTime = 15;        
int pirPin = 3;
int ledPin = 13;




void setup(){
  Serial.begin(9600);
  pinMode(pirPin, INPUT);
  pinMode(ledPin, OUTPUT);
  digitalWrite(pirPin, LOW);

  //give the sensor some time to calibrate
  Serial.print("calibrating sensor ");
    for(int i = 0; i < calibrationTime; i++){
      Serial.print(".");
      delay(1000);
      }
    Serial.println(" done");
    Serial.println("SENSOR ACTIVE");
    delay(50);
  }

////////////////////////////
//LOOP
void loop(){
    digitalWrite(ledPin, digitalRead(pirPin));
  }
