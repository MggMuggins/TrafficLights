module tlapi;

import infrastructure;

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
    private int state = 0;
    
    this(int pinR, int pinY, int pinG)
    {
        this.R = new Led(pinR);
        this.Y = new Led(pinY);
        this.G = new Led(pinG);
    }
    
    public void changeState(long time)
    {
        if (this.state == 0)
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
            case 0:
                this.turnGreen();
                break;
            case 1:
                this.turnYellow();
                break;
            case 2:
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
        this.state = 0;
    }
    
    private void turnYellow()
    {
        this.turnOff();
        this.Y.turnOn();
        this.state = 1;
    }
    
    private void turnRed()
    {
        this.turnOff();
        this.R.turnOn();
        this.state = 2;
    }
    
    private void turnOff()
    {
        switch (this.state)
        {
            case 0:
                this.G.turnOff();
                break;
            case 1:
                this.Y.turnOff();
                break;
            case 2:
                this.R.turnOff();
                break;
            default:
                throw new Exception("Incorrect State");
        }
    }
}
