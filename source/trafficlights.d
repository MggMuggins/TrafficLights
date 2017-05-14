module trafficlights;

import renderer;
import consoled;
import std.stdio;
import std.file : exists;
import std.string;
import std.format : formattedRead;

enum LightState : byte
{
    GREEN = 0,
    YELLOW = 1,
    RED = 2
}

alias GREEN = LightState.GREEN;
alias YELLOW = LightState.YELLOW;
alias RED = LightState.RED;

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
    
    public void setState(LightState state)
    {
        final switch (state)
        {
            case GREEN:
                this.bg = Color.green;
                break;
            case YELLOW:
                this.bg = Color.yellow;
                break;
            case RED:
                this.bg = Color.red;
        }
    }
}

class Intersection
{
    private TrafficLight[string] lights;
    private TileRenderer renderer;
    //private bool isGreen;
    
    this()
    {
        this.renderer = new TileRenderer();
    }
    
    public void lightsFromFile(string path)
    {
        string line, name;
        int posX, posY;
        File file;
        if(path.exists())
        {
            file.open(path, "r");
        }
        else
        {
            write("Invalid Filename");
            return;
        }
        while(!file.eof())
        {
            line = file.readln();
            line = strip(line);
            line.formattedRead("%s, %s, %s", &name, &posX, &posY);
            this.addLight(new TrafficLight(name, posX, posY));
        }
        file.close();
    }
    
    public void addLight(TrafficLight light)
    {
        this.lights[light.name] = light;
    }
    
    public void setLightState(string name, LightState state)
    {
        this.lights[name].setState(state);
    }
    
    //Don't really want to re-add all the tiles, just the ones that need to be rendered differently
    public void render()
    {
        this.renderer.clearTileRegistry();
        foreach(tile; this.lights)
        {
            this.renderer.registerTile(tile);
        }
        //Uncomment for raw rendering
        //this.renderer.rawUpdate();
        //Uncomment for regular rendering
        this.renderer.update();
    }
}
