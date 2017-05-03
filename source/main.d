import std.stdio;

const int OUTPUT, HIGH, LOW;

//Portable code
class LED
{
    public int pin;
    private int state = 0;
    
    this(int pin)
    {
        this.pin = pin;
        pinMode(this.pin, OUTPUT);
        this.turnOff();
    }
    
    public void changeState()
    {
      if (state == 0)
      {
        this.turnOn();
      }
      else
      {
        this.turnOff();
      }
    }
    
    private void turnOn()
    {
      digitalWrite(pin, HIGH);
      this.state = 1;
    }

    private void turnOff()
    {
      digitalWrite(pin, LOW);
      this.state = 0;
    }
}

class TrafficLight
{
    public LED R, Y, G;
    
    this(int pinR, int pinY, int pinG)
    {
        this.R = new LED(pinR);
        this.Y = new LED(pinY);
        this.G = new LED(pinG);
    }
}

//LED R1, Y1, G1, R2, Y2, G2;

void setup()
{
  auto light1 = new TrafficLight(12, 11, 10);
  auto light2 = new TrafficLight(9, 8, 7);
}

void loop()
{
  //R1.changeState();
  delay(1000);
  //R1.changeState();
  delay(1000);
}

//D Infrastructure

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

int main(string[] args)
{
    int i = 0;
    loop();
    return 0;
}
