/*
Bierosomate by Interaction Design at Zurich University of the Arts.
 */

//Libraries Setup
import processing.video.*;
import processing.sound.*;
//LOAD LIBRARIES HERE

//Variable Setup
int minute = 0; //Used for counting -> Timetable
String application = "Start"; //Used for application management -> Run Application
ApplicationDosen Dosen;


void setup()
{
  fullScreen(P3D);
  frameRate(25);
  pixelDensity(displayDensity());
  setupOS();
  
  //Application Setup
  Dosen = new ApplicationDosen();
}

void draw()
{
  timeTable(); //Checks what Application to run
  runApplication(); //Runs the Application
  showEvent();
}

void timeTable() {
  minute = minute();

  if (frameCount <= 70) {
    application = "Start"; //Start Animation
  } else if (minute >= 0 && minute <= 59) {
    application = "Dosen";
  } else {
    application = "Dosen";
  }
  
  //ADD YOUR TIMESLOT HERE
}

void runApplication() {
  if (application == "Dosen") {
    Dosen.run();
  } else if (application == "Start") {
    runStartOS();
  }
  
  //ADD YOUR APPLICATION HERE
}
