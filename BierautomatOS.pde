int d = day();
int m = month();
int y = year();
int minute = 0;

String application = "Start";

void setup()
{
  fullScreen(P3D);
  ortho();
  frameRate(25);
  pixelDensity(displayDensity());
  println(d, ".", m, ".", y);
  
  setupStartOS();
  setupFont();
  setupDosen();
  setupDavid();
}

void draw()
{
  background(0);
  fill(255);
  rect(50, 50, 50, 50);
  println(frameCount);
  
  timeTable();
  runApplication();
}

void runApplication() {
  if (application == "Dosen") {
    runDosen();
  }
  if (application == "Start") {
    runStartOS();
  }
  if (application == "David") {
    runDavid();
  }
}

void timeTable() {
  minute = minute();
  
  if (frameCount <= 70) {
    application = "Start";
  } else if(minute >= 0 && minute <= 20){
    application = "David";
  } else {
    application = "Dosen";
  }
}
