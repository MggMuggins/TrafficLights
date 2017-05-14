module renderer;

import consoled;
import std.stdio;
import std.format;

enum RenderMode
{
    raw,
    fancy
}

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
    protected ScreenCoordinate pos;
    protected string name;
    
    this()
    {
        this.pos = new ScreenCoordinate(0, 0);
        this.name = "";
    }
    
    this(string name, ScreenCoordinate pos)
    {
        this.name = name;
        this.pos = pos;
    }
    
    this(string name, int posX, int posY)
    {
        this.name = name;
        this.pos = new ScreenCoordinate(posX, posY);
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
        this.pos = new ScreenCoordinate(0, 0);
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
    private RenderMode rendermode = RenderMode.fancy;
    
    
    public void registerTile(Tile tile)
    {
        this.tileRegistry ~= tile;
    }
    
    public void clearTileRegistry()
    {
        this.tileRegistry = [];
    }
    
    public void setRenderMode(RenderMode mode)
    {
        this.rendermode = mode;
    }
    
    //For debugging, so that you don't include the screen positions
    private void updateRaw()
    {
        foreach(tile; this.tileRegistry)
        {
            tile.render();
            write(" ", tile.pos.x, ", ", tile.pos.y);
            writeln();
        }
    }
    
    //Currently Redrawing all the tiles
    //I don't like this, adding to todo
    private void updateFancy()
    {
        clearScreen();
        foreach(tile; this.tileRegistry)
        {
            setCursorPos(tile.pos.x, tile.pos.y);
            tile.render();
        }
        stdout.flush();
    }
    
    
    public void update()
    {
        if(this.rendermode == RenderMode.fancy)
        {
            this.updateFancy();
        }
        else if(this.rendermode == RenderMode.raw)
        {
            this.updateRaw();
        }
    }
    
    ~this()
    {
        setCursorPos(0, size.y + 1);
    }
}
