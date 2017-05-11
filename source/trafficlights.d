module trafficlights;

//import infrastructure;
import renderer;
import consoled;

class TrafficLight : CTile
{
    this(string name, ScreenCoordinate pos)
    {
        super(name, pos);
    }
    
    this(string name, int posX, int posY)
    {
        super(name, posX, posY);
    }
    
    public void turnGreen()
    {
        this.bg = Color.green;
    }
    
    public void turnYellow()
    {
        this.bg = Color.yellow;
    }
    
    public void turnRed()
    {
        this.bg = Color.red;
    }
}

class TrafficDirection
{
    private TrafficLight[] lights;
    private TileRenderer renderer;
    private bool hasRenderer = false;
    
    public void addLight(TrafficLight light)
    {
        this.lights ~= light;
    }
    
    public void addLight(TrafficLight[] light)
    {
        this.lights ~= light;
    }
    
    public void render()
    {
        if(!this.hasRenderer)
        {
            this.renderer = new TileRenderer();
        }
        this.renderer.clearTileRegistry();
        foreach(tile; this.lights)
        {
            this.renderer.registerTile(tile);
        }
        this.renderer.update();
    }
}

/*Old Traffic Light Stuff
const byte GREEN = 0, YELLOW = 1, RED = 2;
const byte OFF = 0, ON = 1;

class Led
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

class TrafficLight
{
    private Led R, Y, G;
    //State is 0 for green, 1 for yellow, and 2 for red
    //Use byte constants declared in this module instead of literals
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
    
    //changeState deafults to a 1000 milisecond yellow if no time is given
    public void changeState()
    {
        this.changeState(1000);
    }
    
    //Prefer changeState over setState
    //Honestly don't know why I have this, although makes sense as a setter
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
    public TrafficLight[string] lights;
    private string[][string] orientations;
    
    public void addLight(string name, int pinR, int pinY, int pinG)
    {
        this.lights[name] = new TrafficLight(pinR, pinY, pinG);
    }
    
    //For specific light functions. Prefer to use setLightState.
    public TrafficLight getLight(string name)
    {
        if (name in this.lights)
        {
            return this.lights[name];
        }
        else
        {
            throw new Exception("Incorrect Light Reference");
        }
    }
    
    public void setLightState(string name, int state)
    {
        this.lights[name].setState(state);
    }
    
    public void addLayout(string direction, string[] lights...)
    {
        this.orientations[direction] = lights;
    }
    
    public void setLayoutState(string name, int state)
    {
        foreach(light; this.orientations[name])
        {
            this.lights[light].setState(state);
        }
    }
}
*/
