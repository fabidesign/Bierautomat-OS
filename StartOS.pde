void runStartOS(){
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
  if(frameCount == 2){
    file.play();
  }
}
