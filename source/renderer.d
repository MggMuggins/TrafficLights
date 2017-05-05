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
    char[][] constructScreen();
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
    
    public void registerTile(string tile, ScreenCoordinate pos)
    {
        tiles[tile] = pos;
    }
    
    public void registerTile(string tile, int posX, int posY)
    {
        tiles[tile] = new ScreenCoordinate(posX, posY);
    }
    
    char[][] constructScreen()
    {
        char[][] screen;
        char[] line;
        ulong counter;
        foreach(posY; 0..size.y)
        {
            foreach(posX; 0..size.x)
            {
                foreach(name, lightCoord; this.tiles)
                {
                    if(lightCoord.x == posX && lightCoord.y == posY)
                    {
                        line ~= name;
                        counter = name.length - 1;
                    }
                    else if (counter != 0)
                    {
                        --counter;
                    }
                    else
                    {
                        line ~= ' ';
                    }
                }
                screen ~= line;
                line = [];
            }
        }
        return screen;
    }
    
    void update()
    {
        char[][] screen = this.constructScreen();
        foreach(indx, foo; screen)
        {
            foreach(bar; screen[indx])
            {
                write(bar);
            }
        }
        writeln();
    }
}
