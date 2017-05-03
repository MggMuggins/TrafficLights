module main;

import infrastructure;
import tlapi;

TrafficLight light1, light2;

void setup()
{
  light1 = new TrafficLight(12, 11, 10);
  light2 = new TrafficLight(9, 8, 7);
}

void loop()
{
  light1.changeState();
  light2.changeState();
  delay(1000);
}

int main(string[] args)
{
    setup();
    loop();
    return 0;
}
