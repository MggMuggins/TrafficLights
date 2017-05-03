module infrastructure;

import std.stdio : writefln;

//D Infrastructure, to allow calls to arduino functions

void digitalWrite(int pin, int type)
{
    writefln("Pin %s turned %s.", pin, type);
}

void delay(long time)
{
    writefln("Waiting %s miliseconds.", time);
}

void pinMode(int pin, int mode)
{
    writefln("Set pin %s to mode %s.", pin, mode);
}
