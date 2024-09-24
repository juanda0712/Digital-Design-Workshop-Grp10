const int button1Pin = 4;
const int button2Pin = 5;
const int button3Pin = 6;

const int dataPin1 = 2;
const int dataPin2 = 3;
const int dataPin3 = 7;
const int clkPin = 8;

void setup() {
  pinMode(button1Pin, INPUT_PULLUP);
  pinMode(button2Pin, INPUT_PULLUP);
  pinMode(button3Pin, INPUT_PULLUP);

  pinMode(dataPin1, OUTPUT);
  pinMode(dataPin2, OUTPUT);
  pinMode(dataPin3, OUTPUT);
  pinMode(clkPin, OUTPUT);

  digitalWrite(clkPin, LOW);

}

void loop() {
  int button1State = !digitalRead(button1Pin);
  int button2State = !digitalRead(button2Pin);
  int button3State = !digitalRead(button3Pin);

  digitalWrite(dataPin1, button1State);
  digitalWrite(dataPin2, button2State);
  digitalWrite(dataPin3, button3State);

  digitalWrite(clkPin, HIGH);
  delayMicroseconds(1);  // Small delay for clock pulse
  digitalWrite(clkPin, LOW);

  delay(1000);

}
