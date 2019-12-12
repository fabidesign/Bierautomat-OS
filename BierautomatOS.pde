import processing.sound.*;
SoundFile file;

int d = day();
int m = month();
int y = year();

String application = "Start";

void setup()
{
  fullScreen(P3D);
  ortho();
  frameRate(25);
  pixelDensity(displayDensity());
  println(d, ".", m, ".", y);
  
  file = new SoundFile(this, "start.wav");
  
  setupFont();
  setupDosen();
}

void draw()
{
  background(0);
  fill(255);
  rect(50, 50, 50, 50);
  println(frameCount);

  checkRun();
  runApplication();
}

void runApplication() {
  if (application == "Dosen") {
    runDosen();
  }
  if (application == "Start") {
    runStartOS();
  }
}

void checkRun() {
  if (frameCount <= 70) {
    application = "Start";
  } else {
    application = "Dosen";
  }
}
