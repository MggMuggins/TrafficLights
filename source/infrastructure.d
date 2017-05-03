module infrastructure;

import std.stdio : writefln;

//D Infrastructure, to allow calls to arduino functions

const int OUTPUT = 0, HIGH = 1, LOW = 0;

void digitalWrite(int pin, int type)
{
    writefln("Pin %s set to %s output level.", pin, type);
}

void delay(long time)
{
    writefln("Waiting %s miliseconds.", time);
}

void pinMode(int pin, int mode)
{
    writefln("Set pin %s to mode %s.", pin, mode);
}
