module main;

import infrastructure;
import renderer;
import trafficlights;

import std.stdio : writeln;
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
*/

int main(string[] args)
{
    /* Skipping all this for rendering Testing
    Intersection collageAndConstitution = new Intersection();
    writeln("Setup Routine:\n");
    collageAndConstitution.setup();
    writeln("\nLoop Once:\n");
    collageAndConstitution.loop();
    */
    writeln(size);
    auto render = new CTileRenderer();
    render.registerTile("Text", 4, 6, Color.red);
    render.registerTile("Other Text", 8, 10, Color.red);
    render.update();
    render.registerTile("Different text", 4, 6, Color.green);
    render.update();
    Thread.sleep(dur!"seconds"(3));
    return 0;
}
