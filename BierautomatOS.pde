int d = day();
int m = month();
int y = year();

String application = "Dosen";

void setup()
{
  fullScreen(P3D);
  ortho();
  frameRate(25);
  pixelDensity(displayDensity());
  println(d, ".", m,".", y);
  
  setupDosen();
}
 
void draw()
{
  background(0);
  fill(255);
  rect(50,50,50,50);
  println(frameCount);
  
  runApplication();
}

void runApplication(){
  if(application == "Dosen"){
    runDosen();
  }
}
