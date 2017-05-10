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
    
    public void render()
    {
        write(this.text);
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
        this.text = name;
        this.coordinate = new ScreenCoordinate(x, y);
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
            tile.render();
        }
    }
    
    ~this()
    {
        setCursorPos(0, size.y + 1);
    }
}

class CTileRenderer : TileRenderer
{
    public void registerTile(string name, ScreenCoordinate pos, Color fg)
    {
        this.tiles ~= new CTile(name, pos, fg);
        this.isChanged = true;
    }
    
    public void registerTile(string name, ScreenCoordinate pos, Color fg, Color bg)
    {
        this.tiles ~= new CTile(name, pos, fg, bg);
        this.isChanged = true;
    }
    
    public void registerTile(string name, int x, int y, Color fg)
    {
        this.tiles ~= new CTile(name, x, y, fg);
        this.isChanged = true;
    }
    
    public void registerTile(string name, int x, int y, Color fg, Color bg)
    {
        this.tiles ~= new CTile(name, x, y, fg, bg);
        this.isChanged = true;
    }
}
