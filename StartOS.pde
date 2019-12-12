import processing.sound.*;
SoundFile startSound;
PFont Roboto;

void setupOS() {
  //Basics
  println(d, ".", m, ".", y);

  setupFont();  //Loads Font

  startSound = new SoundFile(this, "start.wav"); //Start Sound
}

//Start Animation
void runStartOS() {
  background(0);
  pushStyle();
  ellipseMode(CENTER);
  ellipse(width/2, height/2, frameCount*frameCount, frameCount*frameCount);
  popStyle();
  pushStyle();
  fill(210-frameCount*3);
  textSize(1*frameCount);
  textAlign(CENTER, CENTER);
  text("Bierautomat OS", width/2, height/2);
  popStyle();
  if (frameCount == 2) {
    startSound.play();
  }
}

void setupFont() {
  Roboto = createFont("Roboto-Medium.ttf", 70);
  textFont(Roboto);
}
