module renderer;

import consoled;
import std.stdio;

class ScreenCoordinate
{
    public int x;
    public int y;
    
    this(int posX, int posY)
    {
        this.x = posX;
        this.y = posY;
    }
}

class Tile
{
    private ScreenCoordinate coordinate;
    private string text;
    
    this()
    {
        this.coordinate = new ScreenCoordinate(0, 0);
        this.text = "";
    }
    
    this(string name, ScreenCoordinate pos)
    {
        this.text = name;
        this.coordinate = pos;
    }
    
    this(string name, int posX, int posY)
    {
        this.text = name;
        this.coordinate = new ScreenCoordinate(posX, posY);
    }
    
    public void render()
    {
        write(this.text);
    }
}

class CTile : Tile
{
    protected Color fg;
    protected Color bg;
    
    this()
    {
        this.coordinate = new ScreenCoordinate(0, 0);
        this.text = "";
        this.fg = Color.initial;
        this.bg = Color.initial;
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
        writec(this.text);
        resetColors();
    }
}

class TileRenderer
{
    private Tile[] tiles;
    private bool isClear = true;
    private bool isChanged = false;
    
    public void registerTile(Tile tile)
    {
        this.isChanged = true;
        this.tiles ~= tile;
    }
    
    public void clearTileRegistry()
    {
        this.tiles = [];
    }
    
    public void update()
    {
        if(this.isChanged)
        {
            clearScreen();
            foreach(tile; this.tiles)
            {
                setCursorPos(tile.coordinate.x, tile.coordinate.y);
                tile.render();
            }
            this.isChanged = false;
        }
        stdout.flush();
    }
    
    ~this()
    {
        setCursorPos(0, size.y + 1);
    }
}
