
const int buttonPin = 4;
const int ledPin = 13;

static boolean running = false;
static boolean buttonPressed = false;

void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);
  Serial.begin(31250);
  enableInterrupts(true);
}

void loop(){
  if (digitalRead(buttonPin) == HIGH) {
    buttonPressed = true;
  }
  if (buttonPressed) {
    digitalWrite(ledPin, HIGH);
  } else {
    digitalWrite(ledPin, LOW);
  }
  delay(10);
}

void interruptTrig() {
  enableInterrupts(false);
  Serial.print(0xF8, BYTE); //Clock
  enableInterrupts(true);
}

void interruptTrigSynk() {
  enableInterrupts(false);
  Serial.print(0xF8, BYTE);
  if (buttonPressed) {
    if (running) {
      Serial.print(0xFC, BYTE); //Stop
      running = false;
    } else {
      //Serial.print(0xFB, BYTE); //Continue
      Serial.print(0xFA, BYTE); //Start
      running = true;
    }
    buttonPressed = false;
  }
  enableInterrupts(true);
}
      

void enableInterrupts(boolean enable) {
  if (enable) {
    attachInterrupt(0, interruptTrig, RISING);
    attachInterrupt(1, interruptTrigSynk, RISING);
  } else {
    detachInterrupt(0);
    detachInterrupt(1);
  }
}
