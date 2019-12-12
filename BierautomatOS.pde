/*
Bierosomat by Interaction Design at Zurich University of the Arts.
 */

//Variable Setup
int minute = 0; //used for counting -> Timetable
int d = day();
int m = month();
int y = year();
String application = "Start"; //used for application management -> Run Application
ApplicationDosen Dosen;

void setup()
{
  fullScreen(P3D);
  frameRate(25);
  pixelDensity(displayDensity());
  setupOS();

  //Application Setup
  setupDavid();
  Dosen = new ApplicationDosen();
}

void draw()
{
  timeTable(); //Checks what Application to run
  runApplication(); //Runs the Application
}

void runApplication() {
  if (application == "Dosen") {
    Dosen.run();
  }

  if (application == "Start") {
    runStartOS();
  }
  if (application == "David") {
    runDavid();
  }

  //ADD YOUR APPLICATION HERE
}

void timeTable() {
  minute = minute();

  if (frameCount <= 70) {
    application = "Start";
  } else if (minute >= 0 && minute <= 5) {
    application = "David";
  } else {
    application = "Dosen";
  }
  //ADD YOUR TIMESLOT HERE
}
