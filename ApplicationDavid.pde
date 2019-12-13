import geomerative.*;

RShape nieves;
RShape envies;

RPoint[] pointsNieves;
RPoint[] pointsEnvies;

PVector posNieves;
PVector posEnvies;

float globalScale = 0.8;
int amtBetween = 10;

float stepCounter = 0;
int counter = 0;

int startIndex = 0;
int pointIteratorStepSize = 1;

boolean disableLerp = false;
boolean magicDirection = true;

float magicValue;
float x;

void setupDavid () {
  RG.init(this);

  nieves = RG.loadShape("line.svg");
  nieves = RG.centerIn(nieves, g);
  pointsNieves = nieves.getPoints();
  posNieves = new PVector(width * 0.25, height / 2 + 25);
}

float gaussian(float x, float mean, float variance) {
  return (1 / sqrt(TWO_PI * variance)) * exp(-sq(x - mean) / (2 * variance));
}  

void runDavid() {
  background(0);

  if (magicDirection == true) {
    magicValue++;

    if (magicValue > 1000) {
      magicDirection = false;
    }
  }

  if (magicDirection == false) {
    magicValue--;

    if (magicValue < 2)
    {
      magicDirection = true;
    }
  }

  float x = constrain(abs(magicValue), 1, width);
  float t = abs(map(gaussian(abs(map(magicValue, 0, 560, -1, 1)) / 1.8, 0, 0.2), 0, 1, -1, 1) * 10);

  if (x < 25) {
    t = 1;
  } 

  if ( x > 25 && x < 600) {
    t = map(x, 0, 250, 1, 15);
  } else if (x >= 600 && x < 1300) {
    t = map(x, 600, 1400, 15, 8);
  } else {
    t = 1;
  }
  println(x);

  pointIteratorStepSize = constrain((int) t, 1, 20);

  float stepSize = 1f / amtBetween;
  stepCounter += stepSize;


  //println(pointIteratorStepSize);
  float pieceScale = x * 0.01;
  //ntln(mprintln(pieceScale);
  pieceScale = constrain(pieceScale, 0, 3);
  drawSnake(startIndex, posNieves, pointsNieves, 0, globalScale, pieceScale, stepCounter);

  if (stepCounter > 1 ) {
    stepCounter = 0;
  }

  counter++;
};

void drawSnake(int startPoint, PVector position, RPoint[] points, float rotation, float gScale, float scaleDiameter, float stepCounter) {

  float strokeWeight = (abs(magicValue)) * 0.003 + 1;

  disableLerp = scaleDiameter > 1.5;

  push();
  translate(position.x, position.y);
  rotate(rotation);
  scale(gScale);

  fill(0, 0, 0, 0);
  stroke(255);
  strokeWeight(0.1);

  drawSnakePiece(points[0].x, points[0].y, scaleDiameter, strokeWeight);
  for (int i = startPoint; i<points.length - pointIteratorStepSize; i = i + pointIteratorStepSize) {
    RPoint point1 = points[i];
    RPoint point2 = points[i+1];
    //filter(BLUR, 1);

    float pieceRotation = (float)i / pointsNieves.length * magicValue * 0.01;
    push();
    if (disableLerp) {
      translate(point1.x, point1.y);
    } else {
      translate(lerp(point1.x, point2.x, stepCounter), lerp(point1.y, point2.y, stepCounter));
    }
    rotate(pieceRotation);

    // adaptive snake draw
    int skip = constrain(round(map(scaleDiameter, 1.0, width * 0.01, 1, 20)), 1, 10);
    //if (i % skip == 0)
    drawSnakePiece(0, 0, scaleDiameter, strokeWeight);

    pop();

    //render last piece with rotation
    if (i >= points.length - 1) {
      push();
      translate(points[points.length-1].x, points[points.length-1].y);
      rotate(pieceRotation);
      drawSnakePiece(0, 0, scaleDiameter, strokeWeight);
      pop();
    }
  }

  pop();
}

void drawSnakePiece(float x, float y, float scaleDiameter, float strokeWeight) {
  float s = scaleDiameter;
  //min scaleDiameter
  if (scaleDiameter > 0 && scaleDiameter < 0.25) {
    s = 0.25;
  } else if (scaleDiameter < 0 && scaleDiameter > -0.25) {
    s = -0.25;
  }
  strokeWeight(strokeWeight);
  noFill();
  ellipseMode(CORNER);
  ellipse(x, y, 250 * s, 325 * s);
}
