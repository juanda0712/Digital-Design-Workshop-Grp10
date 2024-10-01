#include <SPI.h>

const int button1Pin = 4;
const int button2Pin = 5;
const int button3Pin = 6;

const int csPin = 10;

void setup() {
  pinMode(button1Pin, INPUT_PULLUP);
  pinMode(button2Pin, INPUT_PULLUP);
  pinMode(button3Pin, INPUT_PULLUP);
  
  pinMode(csPin, OUTPUT);
  digitalWrite(csPin, HIGH);

  SPI.begin();
}

void loop() {
  int button1State = !digitalRead(button1Pin);
  int button2State = !digitalRead(button2Pin);
  int button3State = !digitalRead(button3Pin);

  byte dataBus = (button1State << 2) | (button2State << 1) | button3State;

  SPI.beginTransaction(SPISettings(14000000, MSBFIRST, SPI_MODE0));
  digitalWrite(csPin, LOW);
  SPI.transfer(dataBus);
  digitalWrite(csPin, HIGH);
  SPI.endTransaction();

  delay(100);

}
