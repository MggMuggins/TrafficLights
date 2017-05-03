module tlapi;

import infrastructure;

const int OUTPUT, HIGH, LOW;

//Portable code
class Led
{
    public int pin;
    private int state = 0;
    
    this(int pin)
    {
        this.pin = pin;
        pinMode(this.pin, OUTPUT);
        this.turnOff();
    }
    
    public void turnOn()
    {
      digitalWrite(pin, HIGH);
      this.state = 1;
    }

    public void turnOff()
    {
      digitalWrite(pin, LOW);
      this.state = 0;
    }
}

class TrafficLight
{
    private Led R, Y, G;
    //State is 0 for green, 1 for yellow, and 2 for red
    private int state;
    
    this(int pinR, int pinY, int pinG)
    {
        this.R = new Led(pinR);
        this.Y = new Led(pinY);
        this.G = new Led(pinG);
    }
    
    public void changeState()
    {
        if (this.state == 0)
        {
            this.turnRed(1000);
        }
        else
        {
            this.turnGreen();
        }
    }
    
    private void turnGreen()
    {
        assert(this.state == 2);
        this.R.turnOff();
        
        this.G.turnOn();
        this.state = 0;
    }
    
    private void turnRed(long time)
    {
        assert(this.state == 0);
        this.G.turnOff();
        
        this.Y.turnOn();
        this.state = 1;
        delay(time);
        this.Y.turnOff();
        
        this.R.turnOn();
        this.state = 2;
    }
}
