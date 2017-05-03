class LED
{
  public:
    int pin;
    
    void setup(int value)
    {
      pin = value;
      pinMode(pin, OUTPUT);
      this.turnOff();
    }
    
    void changeState()
    {
      if (state == 0)
      {
        this.turnOn();
      }
      else
      {
        this.turnOff();
      }
    }
    
  protected:
    int state = 0;
    
    void turnOn()
    {
      digitalWrite(pin, HIGH);
      state = 1;
    }

    void turnOff()
    {
      digitalWrite(pin, LOW);
      state = 0;
    }
};

class TrafficLight
{
  public:
    LED R, Y, G;
    
  protected:
    void turnGreen()
    {
      R.changeState();
      
    }
}

LED R1, Y1, G1, R2, Y2, G2;

void setup()
{
  R1.setup(12);
  R2.setup(11);
  Y1.setup(10);
  Y2.setup(9);
  G1.setup(8);
  G2.setup(7);
}

void loop()
{
  R1.changeState();
  delay(1000);
  R1.changeState();
  delay(1000);
}
