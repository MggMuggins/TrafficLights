module trafficlights;

import renderer;
import consoled;
import std.stdio : File;
import std.stdio : write;
import std.file : exists;
import std.string : strip;
import std.format : formattedRead;

enum LightState
{
    GREEN, YELLOW, RED
}

enum UpdateMode
{
    autoR, manR
}

alias GREEN = LightState.GREEN;
alias YELLOW = LightState.YELLOW;
alias RED = LightState.RED;

class TrafficLight : CTile
{
    this(string name, ScreenCoordinate pos)
    {
        this.name = name;
        this.pos = pos;
    }
    
    this(string name, int posX, int posY)
    {
        this.name = name;
        this.pos.x = posX;
        this.pos.y = posY;
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
                break;
        }
    }
}

class Intersection
{
    private TrafficLight[string] lights;
    private TileRenderer renderer;
    private UpdateMode rendermode = UpdateMode.autoR;
    
    this()
    {
        this.renderer = new TileRenderer();
    }
    
    public void addFileLights(string path)
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
            throw new Exception("Invalid Filename");
        }
        while(!file.eof())
        {
            line = file.readln();
            line = strip(line);
            line.formattedRead("%s, %s, %s", &name, &posX, &posY);
            this.addLight(new TrafficLight(name, posX, posY));
        }
        file.close();
        if (this.rendermode == UpdateMode.autoR)
            this.render();
    }
    
    public void addLight(TrafficLight light)
    {
        this.lights[light.getName()] = light;
        if (this.rendermode == UpdateMode.autoR)
            this.render();
    }
    
    public void setLightState(string name, LightState state)
    {
        this.lights[name].setState(state);
        if (this.rendermode == UpdateMode.autoR)
            this.render();
    }
    
    public void setRenderMode(RenderMode mode)
    {
        this.renderer.setRenderMode(mode);
    }
    
    public void setUpdateMode(UpdateMode mode)
    {
        this.rendermode = mode;
    }
    
    //Don't really want to re-add all the tiles, just the ones that need to be rendered differently
    public void render()
    {
        this.renderer.clearTileRegistry();
        foreach(tile; this.lights)
        {
            this.renderer.registerTile(tile);
        }
        this.renderer.update();
    }
}
