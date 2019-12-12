int d = day();
int m = month();
int y = year();

char application = 'x';

void setup()
{
  size(1920,1080);
  frameRate(25);
  pixelDensity(displayDensity());
  println(d, ".", m,".", y);
}
 
void draw()
{
  background(0);
  println(frameCount);
  
  runApplication();
}

void runApplication(){
  if(application == 'x'){
    runX();
  }
}
