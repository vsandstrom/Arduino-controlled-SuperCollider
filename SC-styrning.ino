int pin0 = 0;
int pin1 = 1;
int pin2 = 2;
int pin3 = 3;
int pin4 = 4;
int pin5 = 5;

int potValue0 = 0;
int potValue1 = 0;
int potValue2 = 0;
int potValue3 = 0;
int potValue4 = 0;
int potValue5 = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);

}

void loop() {
  // put your main code here, to run repeatedly:
  potValue0 = analogRead(pin0);
  potValue1 = analogRead(pin1);
  potValue2 = analogRead(pin2);
  potValue3 = analogRead(pin3);
  potValue4 = analogRead(pin4);
  potValue5 = analogRead(pin5);
  Serial.print(potValue0);
  Serial.print("a");
  Serial.print(potValue1);
  Serial.print("b");
  Serial.print(potValue2);
  Serial.print("c");
  Serial.print(potValue3);
  Serial.print("d");
  Serial.print(potValue4);
  Serial.print("e");
  Serial.print(potValue5);
  Serial.print("f");
  delay(1);
}
