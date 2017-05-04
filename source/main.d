module main;

import infrastructure;
import tlapi;
import std.stdio : writeln;

Intersection collageAndConstitution;

void setup()
{
    collageAndConstitution = new Intersection();
    collageAndConstitution.addLight("eastCollage", 12, 11, 10);
    collageAndConstitution.addLight("northConstitution", 9, 8, 7);
    collageAndConstitution.addLight("southConstitution", 6, 5, 4);
    writeln();
    collageAndConstitution.setLightState("eastCollage", GREEN);
    
    collageAndConstitution.addLayout("ns", "northConstitution", "southConstitution");
    collageAndConstitution.setLayoutState("ns", RED);
}

void loop()
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

int main(string[] args)
{
    writeln("Setup Routine:\n");
    setup();
    writeln("\nLoop Once:\n");
    loop();
    return 0;
}
