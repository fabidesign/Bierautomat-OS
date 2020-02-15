void showEvent() {
  if (day()== 14 && month() == 2 && year() == 2020)
  {
    drawEvent("This ia a fairly long message to test something");
  }

  if (day()== 19 && month() == 2 && year() == 2020)
  {
    drawEvent("Punkt Vernissage ab 18:00");
  }

  if (day()== 20 && month() == 2 && year() == 2020)
  {
    drawEvent("Punkt austtellung bis sonntag");
  }

  if (day()== 21 && month() == 2 && year() == 2020)
  {
    drawEvent("Punkt austtellung bis sonntag");
  }

  if (day()== 22 && month() == 2 && year() == 2020)
  {
    drawEvent("Punkt austtellung bis sonntag");
  }

  if (day()== 23 && month() == 2 && year() == 2020)
  {
    drawEvent("Punkt austtellung - nur noch heute!");
  }
  
  if (day()== 18 && month() == 3 && year() == 2020)
  {
    drawEvent("fibi mit ibm dude");
  }
}

void drawEvent(String text) {
  pushStyle();

  fill(238, 228, 103);
  rect(0, 0, width, height/8);

  popStyle();

  pushStyle();

  fill(0);
  textSize(50);

  String c = text;
  float cw = textWidth(c);
  text(c, (width-cw)/2, (height/16)+10);
  line(cw, 0, cw, 50); 

  popStyle();
}
