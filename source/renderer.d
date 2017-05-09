module renderer;

import consoled;
import std.stdio;

interface Renderer
{
    void update();
    private Cchar[][] drawScreen();
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
}

class Cchar
{
    public char ch;
    public Color bgColor = Color.initial;
    public Color fgColor = Color.initial;
    
    this(char ch)
    {
        this.ch = ch;
    }
}

class Tile
{
    public ScreenCoordinate coordinate;
    public string text;
    
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

class TileRenderer : Renderer
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
            //Render a new screen, and output it
            Cchar[][] screen = this.drawScreen();
            foreach(indx, y; screen)
            {
                foreach(x; screen[indx])
                {
                    foreground = x.fgColor;
                    background = x.bgColor;
                    writec(x.ch);
                }
                writeln();
            }
            this.isClear = false;
        }
        else if(this.isChanged)
        {
            //Iterate over the tiles to rewrite them
            foreach(tile; this.tiles)
            {
                setCursorPos(tile.coordinate.x, tile.coordinate.y);
                write(tile.text);
            }
            setCursorPos(size.x - 1, size.y - 1);
        }
        else {}
    }
    
    private Cchar[][] drawScreen()
    {
        Cchar[][] screen;
        Cchar[] line;
        ulong counter;
        //Iterate over Y of screen
        foreach(posY; 0..size.y)
        {
            //Iterate over X of screen
            foreach(posX; 0..size.x)
            {
                //Iterate over the tiles to render and write them if the current insertion point is at their location
                foreach(tile; this.tiles)
                {
                    if(tile.coordinate.x - 1 == posX && tile.coordinate.y - 1 == posY)
                    {
                        //Run through the string and write it into the colored character manually
                        foreach(ch; tile.text)
                        {
                            line ~= new Cchar(ch);
                        }
                        counter = tile.text.length;
                    }
                }
                //Make sure there wasn't a tile inserted
                if (counter != 0)
                {
                    --counter;
                }
                else
                {
                    line ~= new Cchar('.');
                }
            }
            screen ~= line;
            line = [];
        }
        return screen;
    }
}
