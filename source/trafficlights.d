module trafficlights;

import renderer;
import consoled;
import std.stdio;

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

class Intersection
{
    private TrafficLight[] lights;
    private TileRenderer renderer;
    //private bool isGreen;
    
    this()
    {
        this.renderer = new TileRenderer();
    }
    
    public void addLight(TrafficLight light)
    {
        this.lights ~= light;
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
