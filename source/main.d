module main;

import infrastructure;
import tlapi;
import std.stdio : writeln;

TrafficLight light1, light2;

void setup()
{
    light1 = new TrafficLight(12, 11, 10);
    light2 = new TrafficLight(9, 8, 7);
    writeln();
    light1.setState(GREEN);
    light2.setState(RED);
}

void loop()
{
    delay(7000);
    light1.changeState();
    delay(1000);
    light2.changeState();
    delay(7000);
    light2.changeState();
    delay(1000);
    light1.changeState();
}

int main(string[] args)
{
    writeln("Setup Routine:\n");
    setup();
    writeln("\nLoop Once:\n");
    loop();
    return 0;
}
