# Traffic Light Controller
Better name TBD.

Here is my experiment with object-oriented traffic light control and terminal rendering. The project started as a simple object-oriented traffic light controller for Arduino, naturally written in C\++. However, I hate C\++'s object-oriented syntax, and I like D better anyway, so I decided to port what code I had to D and continue building from there.

Now the project is becoming a terminal rendering engine with the help of [ConsoleD](https://github.com/robik/ConsoleD), and I'm using traffic lights as my pretense.

**This prject is highly experimental and may not work as expected. Do not expect a mature or useable api for a while. Mature releases will be posted in due time.**

# Building/Contributing
To build, you'll need dub (for build system, and dependency managment). You'll also need a D2 compiler. Simply run ```dub``` in the root directory to build and run.

# Devnotes
* If weird output stuff happens, run ```dub build --force```.
