module main;

import renderer;
import trafficlights;

import core.thread;

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
    direction.lightsFromFile("/usr/local/share/lights.txt");
    direction.render();
    Thread.sleep(dur!"seconds"(2));
    direction.render();
    //*/
    return 0;
}
