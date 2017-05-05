module infrastructure;

import std.stdio : writefln;
import consoled;

//D Infrastructure, to allow calls to arduino functions
//This stuff is all deprecated. I'll write replacements for it sometime.
const int OUTPUT = 0, HIGH = 1, LOW = 0;

deprecated void digitalWrite(int pin, int type)
{
    writefln("Pin %s set to %s output level.", pin, type);
}

deprecated void delay(long time)
{
    writefln("Waiting %s miliseconds.", time);
}

deprecated void pinMode(int pin, int mode)
{
    writefln("Set pin %s to mode %s.", pin, mode);
}
