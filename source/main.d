module main;

import renderer;
import trafficlights;

int main(string[] args)
{
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
    direction.setLightState("North", GREEN);
    direction.setLightState("South", RED);
    delay(6);
    direction.setLightState("North", YELLOW);
    delay(2);
    direction.setLightState("North", RED);
    delay(1);
    direction.setLightState("South", GREEN);
    delay(6);
    delay(2);
    //*/
    return 0;
}
