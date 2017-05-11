module renderer;

import consoled;
import std.stdio;
import std.format;

class ScreenCoordinate
{
    public int x;
    public int y;
    
    this(int posX, int posY)
    {
        this.x = posX;
        this.y = posY;
    }
    
    public override string toString()
    {
        return format("%s, %s", this.x, this.y);
    }
}

class Tile
{
    protected ScreenCoordinate coordinate;
    protected string name;
    
    this()
    {
        this.coordinate = new ScreenCoordinate(0, 0);
        this.name = "";
    }
    
    this(string name, ScreenCoordinate pos)
    {
        this.name = name;
        this.coordinate = pos;
    }
    
    this(string name, int posX, int posY)
    {
        this.name = name;
        this.coordinate = new ScreenCoordinate(posX, posY);
    }
    
    public void render()
    {
        write(this.name);
    }
}

class CTile : Tile
{
    protected Color fg = Color.white;
    protected Color bg = Color.initial;
    
    this()
    {
        this.coordinate = new ScreenCoordinate(0, 0);
        this.name = "";
    }
    
    this(string name, ScreenCoordinate pos)
    {
        super(name, pos);
    }
    
    this(string name, int posX, int posY)
    {
        super(name, posX, posY);
    }
    
    this(string name, ScreenCoordinate pos, Color fg)
    {
        super(name, pos);
        this.fg = fg;
    }
    
    this(string name, ScreenCoordinate pos, Color fg, Color bg)
    {
        super(name, pos);
        this.fg = fg;
        this.bg = bg;
    }
    
    this(string name, int x, int y, Color fg)
    {
        super(name, x, y);
        this.fg = fg;
    }
    
    this(string name, int x, int y, Color fg, Color bg)
    {
        super(name, x, y);
        this.fg = fg;
        this.bg = bg;
    }
    
    public override void render()
    {
        foreground(this.fg);
        background(this.bg);
        writec(this.name);
        resetColors();
    }
}

class TileRenderer
{
    private Tile[] tileRegistry;
    
    public void registerTile(Tile tile)
    {
        this.tileRegistry ~= tile;
    }
    
    public void clearTileRegistry()
    {
        this.tileRegistry = [];
    }
    
    //For debugging, so that you don't include the screen positions
    public void rawUpdate()
    {
        foreach(tile; this.tileRegistry)
        {
            tile.render();
        }
    }
    
    //Currently Redrawing all the tiles
    //I don't like this, adding to todo
    public void update()
    {
        clearScreen();
        foreach(tile; this.tileRegistry)
        {
            setCursorPos(tile.coordinate.x, tile.coordinate.y);
            tile.render();
        }
        stdout.flush();
    }
    
    ~this()
    {
        setCursorPos(0, size.y + 1);
    }
}
