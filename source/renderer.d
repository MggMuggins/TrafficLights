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
    public ScreenCoordinate coordinate;
    public string text;
    
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
}

class CTile : Tile
{
    public Color fg = Color.initial;
    public Color bg = Color.initial;
    
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
    
    public void registerTile(string name, ScreenCoordinate pos)
    {
        
        this.isChanged = true;
        this.tiles ~= new Tile(name, pos);
    }
    
    public void registerTile(string name, int posX, int posY)
    {
        this.isChanged = true;
        this.tiles ~= new Tile(name, posX, posY);
    }
    
    public void update()
    {
        if(this.isClear)
        {
            clearScreen();
            this.isClear = false;
        }
        
        if(this.isChanged)
        {
            clearScreen();
            this.writeTiles();
            this.isChanged = false;
        }
    }
    
    private void writeTiles()
    {
        foreach(tile; this.tiles)
        {
            setCursorPos(tile.coordinate.x, tile.coordinate.y);
            write(tile.text);
        }
    }
    
    ~this()
    {
        setCursorPos(0, size.y + 1);
    }
}

class CTileRenderer : TileRenderer
{
    private CTile[] tiles;
    
    public void registerTile(string name, ScreenCoordinate pos, Color fg)
    {
        this.tiles ~= new CTile(name, pos, fg);
    }
    
    public void registerTile(string name, ScreenCoordinate pos, Color fg, Color bg)
    {
        this.tiles ~= new CTile(name, pos, fg, bg);
    }
    
    public void registerTile(string name, int x, int y, Color fg)
    {
        this.tiles ~= new CTile(name, x, y, fg);
    }
    
    public void registerTile(string name, int x, int y, Color fg, Color bg)
    {
        this.tiles ~= new CTile(name, x, y, fg, bg);
    }
    
    private void writeTiles()
    {
        foreach(tile; this.tiles)
        {
            setCursorPos(tile.coordinate.x, tile.coordinate.y);
            foreground(tile.fg);
            background(tile.bg);
            writec(tile.text);
        }
    }
}
