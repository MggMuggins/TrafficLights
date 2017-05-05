module renderer;

import consoled;
import std.stdio;

interface Renderer
{
    void update();
}

interface TerminalRenderer : Renderer
{
    public void registerTile(string tile, ScreenCoordinate pos);
    public void registerTile(string tile, int posX, int posY);
    private char[][] drawScreen();
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

class LightRenderer : TerminalRenderer
{
    private ScreenCoordinate[string] tiles;
    private bool isClear = true;
    private bool isChanged = false;
    
    public void registerTile(string tile, ScreenCoordinate pos)
    {
        this.isChanged = true;
        tiles[tile] = pos;
    }
    
    public void registerTile(string tile, int posX, int posY)
    {
        this.isChanged = true;
        tiles[tile] = new ScreenCoordinate(posX, posY);
    }
    
    public void update()
    {
        if(this.isClear)
        {
            char[][] screen = this.drawScreen();
            foreach(indx, y; screen)
            {
                foreach(x; screen[indx])
                {
                    write(x);
                }
                writeln();
            }
            this.isClear = false;
        }
        else if(this.isChanged)
        {
            //Iterate over the tiles to render and rewrite them
            foreach(name, lightCoord; this.tiles)
            {
                setCursorPos(lightCoord.x, lightCoord.y);
                write(name);
            }
            setCursorPos(size.x, size.y - 1);
        }
        else {}
    }
    
    private char[][] drawScreen()
    {
        char[][] screen;
        char[] line;
        ulong counter;
        //Iterate over Y of screen
        foreach(posY; 0..size.y)
        {
            //Iterate over X of screen
            foreach(posX; 0..size.x)
            {
                //Iterate over the tiles to render and write them if the current insertion point is at their location
                foreach(name, lightCoord; this.tiles)
                {
                    if(lightCoord.x - 1 == posX && lightCoord.y - 1 == posY)
                    {
                        line ~= name;
                        counter = name.length;
                    }
                }
                //Make sure there wasn't a tile inserted
                if (counter != 0)
                {
                    --counter;
                }
                else
                {
                    line ~= '.';
                }
            }
            screen ~= line;
            line = [];
        }
        return screen;
    }
}
