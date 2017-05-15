module main;

import renderer;
import trafficlights;

import consoled;
import std.stdio;

int main(string[] args)
{
    //Close handler (from ConsoleD docs) so that Ctrl-C actually works...
    //This doesn't actually work...
    addCloseHandler((i){
        switch(i.type)
        {
            case CloseType.Other:
                writeln("Other");
                break;
            
            case CloseType.Interrupt:
                writeln("Ctrl+C");
                break;
            
            // Ctrl+Break for windows, Ctrl+Z for posix
            case CloseType.Stop:
                writeln("Ctrl+Break or Ctrl+Z");
                break;
            
            // Posix only
            case CloseType.Quit:
                writeln(`Ctrl+\`);
                break;
            
            default:
                break;
        }
        
        writeln(i.isBlockable);
    });
    
    /* Render Testing Stuffs
    auto render = new TileRenderer();
    render.registerTile(new CTile("Text", 4, 6, Color.initial, Color.red));
    render.registerTile(new CTile("Other Text", 8, 10, Color.initial, Color.red));
    render.update();
    Thread.sleep(dur!"seconds"(3));
    render.registerTile(new CTile("Different text", 4, 6, Color.initial, Color.green));
    render.update();
    Thread.sleep(dur!"seconds"(3));
    //*/
    //*
    auto direction = new Intersection();
    direction.lightsFromFile("/usr/local/share/mggmuggins/lights.txt");
    direction.setLightState("North", RED);
    direction.setLightState("South", RED);
    while(true)
    {
        direction.setLightState("East", GREEN);
        direction.setLightState("West", GREEN);
        delay(6);
        direction.setLightState("East", YELLOW);
        direction.setLightState("West", YELLOW);
        delay(2);
        direction.setLightState("East", RED);
        direction.setLightState("West", RED);
        delay(2);
        direction.setLightState("North", GREEN);
        direction.setLightState("South", GREEN);
        delay(6);
        direction.setLightState("North", YELLOW);
        direction.setLightState("South", YELLOW);
        delay(2);
        direction.setLightState("North", RED);
        direction.setLightState("South", RED);
        delay(2);
    }
    //*/
}
