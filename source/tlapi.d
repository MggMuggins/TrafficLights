module tlapi;

import infrastructure;

//Portable code

//Useable aliases for certain values
const byte GREEN = 0, YELLOW = 1, RED = 2;
const byte OFF = 0, ON = 1;

extern (C++) class Led
{
    public int pin;
    private byte state = OFF;
    
    this(int pin)
    {
        this.pin = pin;
        pinMode(this.pin, OUTPUT);
        this.turnOff();
    }
    
    public void turnOn()
    {
        if (this.state == OFF)
        {
            digitalWrite(pin, HIGH);
            this.state = ON;
        }
    }

    public void turnOff()
    {
        if (this.state == ON)
        {
            digitalWrite(pin, LOW);
            this.state = OFF;
        }
    }
}

extern (C++) class TrafficLight
{
    private Led R, Y, G;
    //State is 0 for green, 1 for yellow, and 2 for red
    private byte state = 0;
    
    this(int pinR, int pinY, int pinG)
    {
        this.R = new Led(pinR);
        this.Y = new Led(pinY);
        this.G = new Led(pinG);
    }
    
    public void changeState(long time)
    {
        if (this.state == GREEN)
        {
            this.turnYellow();
            delay(time);
            this.turnRed();
        }
        else
        {
            this.turnGreen();
        }
    }
    
    public void changeState()
    {
        this.changeState(1000);
    }
    
    public void setState(int state)
    {
        switch (state)
        {
            case GREEN:
                this.turnGreen();
                break;
            case YELLOW:
                this.turnYellow();
                break;
            case RED:
                this.turnRed();
                break;
            default:
                throw new Exception("Incorrect State");
        }
    }
    
    private void turnGreen()
    {
        this.turnOff();
        this.G.turnOn();
        this.state = GREEN;
    }
    
    private void turnYellow()
    {
        this.turnOff();
        this.Y.turnOn();
        this.state = YELLOW;
    }
    
    private void turnRed()
    {
        this.turnOff();
        this.R.turnOn();
        this.state = RED;
    }
    
    private void turnOff()
    {
        switch (this.state)
        {
            case GREEN:
                this.G.turnOff();
                break;
            case YELLOW:
                this.Y.turnOff();
                break;
            case RED:
                this.R.turnOff();
                break;
            default:
                throw new Exception("Incorrect State");
        }
    }
}

class Intersection
{
    
    
    this()
    {
        
    }
}
