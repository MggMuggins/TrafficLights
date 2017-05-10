module main;

import infrastructure;
import renderer;
import trafficlights;

import std.stdio : writeln;
import std.stdio : stdout;
import core.thread;
import consoled;

/*Skipping all this for render testing
void setup(Intersection collageAndConstitution)
{
    collageAndConstitution.addLight("eastCollage", 12, 11, 10);
    collageAndConstitution.addLight("northConstitution", 9, 8, 7);
    collageAndConstitution.addLight("southConstitution", 6, 5, 4);
    writeln();
    collageAndConstitution.setLightState("eastCollage", GREEN);
    
    collageAndConstitution.addLayout("ns", "northConstitution", "southConstitution");
    collageAndConstitution.setLayoutState("ns", RED);
}

void loop(Intersection collageAndConstitution)
{
    delay(7000);
    collageAndConstitution.getLight("eastCollage").changeState();
    delay(1000);
    collageAndConstitution.getLight("southConstitution").changeState();
    collageAndConstitution.getLight("northConstitution").changeState();
    delay(7000);
    collageAndConstitution.getLight("southConstitution").changeState();
    collageAndConstitution.getLight("northConstitution").changeState();
    delay(1000);
    collageAndConstitution.getLight("eastCollage").changeState();
}
//*/

int main(string[] args)
{
    /* Skipping all this for rendering Testing
    Intersection collageAndConstitution = new Intersection();
    writeln("Setup Routine:\n");
    collageAndConstitution.setup();
    writeln("\nLoop Once:\n");
    collageAndConstitution.loop();
    //*/
    /* Render Testing Stuffs
    auto render = new CTileRenderer();
    render.registerTile("Text", 4, 6, Color.initial, Color.red);
    render.registerTile("Other Text", 8, 10, Color.initial, Color.red);
    render.update();
    Thread.sleep(dur!"seconds"(3));
    render.registerTile("Different text", 4, 6, Color.initial, Color.green);
    render.update();
    Thread.sleep(dur!"seconds"(3));
    //*/
    //*
    auto direction = new TrafficDirection();
    auto lights = [new TrafficLight("South", 4, 4), new TrafficLight("North", 4, 8)];
    direction.addLight(lights);
    direction.render();
    //*/
    return 0;
}
