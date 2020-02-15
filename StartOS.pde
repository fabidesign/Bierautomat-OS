SoundFile startSound;
PFont Roboto;

void setupOS() {
  //Basics

  setupFont();  //Loads Font

  startSound = new SoundFile(this, "start.wav"); //Start Sound
  
  noStroke();
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
  textSize(2*frameCount);
  textAlign(CENTER, CENTER);
  text("Bierautomat OS", width/2, height/2);
  popStyle();
  if (frameCount == 2) {
    startSound.play();
  }
}

void setupFont() {
  Roboto = createFont("caravan-120-aaa.otf", 70);
  textFont(Roboto);
}
