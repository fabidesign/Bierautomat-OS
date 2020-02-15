/*
Dosen by Randy Chen
 */
 
class ApplicationDosen { 
  Dose Mate;
  Dose Qfrisch;
  Dose QfrischT;
  float rz; //rotationspeed

  Stern[] sterne = new Stern [300];
  color[] colors = {  
    color(10, 32, 91), 
    color(255, 240, 92), 
    color(179, 30, 0), 
    color(255, 255, 255)
  };

  int indexColor;

  float speed=1; 
  
  ApplicationDosen () {  
    ortho();
    setupStar();

    Qfrisch = new Dose("Qfrisch.obj", width/5, "2.-", "500ml");
    QfrischT = new Dose("QfrischT.obj", width/5*2.5, "2.-", "500ml");
    Mate = new Dose("Mate.obj", width/5*4, "2.-", "330ml"); // 1_FILE, 2_POSITION X AXIS, 3_PRISE LABEL, 4_ML AMOUNT
  } 
  
  void run() { 
    directionalLight(250, 250, 250, 100, 100, -125);
    directionalLight(70, 70, 70, -width, -height, 500);
    drawStar();
    //getHandPositions();
    Qfrisch.draw();
    QfrischT.draw();
    Mate.draw();
    rz += 0.25;
  }

  class Dose {
    PShape obj;
    PVector pos;
    PVector angle;
    String prise;
    String amount;
    int size;

    Dose(String objFile, float posX, String prise, String amount) {
      this.pos = new PVector();
      this.pos.x = posX;
      this.angle = new PVector(-10, 60, 0);
      this.prise = prise;
      this.amount = amount;
      obj = loadShape(objFile);
      size = 35;
    }

    void draw() {
      pushMatrix();//fixing 0/0 of the obj itself
      translate(pos.x-80, height/2);
      rotateX(radians(angle.x)); //slight tilt to front
      pushMatrix();
      pushMatrix();
      translate( 10, 225);      //setting x/y Position to center of the object
      rotateX(radians(90));   //correct start rotation
      rotateY(radians(20));   //slight tilt to right
      pushMatrix();
      translate(-80, 0, -100);
      //rotateZ(radians(90));
      rotateX(radians(-90));
      textSize(50);
      fill(255);
      text(prise, 0, 0);
      text(amount, 0, 70);
      popMatrix();
      rotateZ(radians(rz));  //rotation speed
      scale(size);             //size
      shape(obj);
      popMatrix();
      popMatrix();

      popMatrix();
    }
  }

  //PARTICLE
  void setupStar() {
    for (int i=0; i<sterne.length; i++) {
      sterne[i] = new Stern();
    }
  }

  void drawStar() {
    background(0);
    pushMatrix();
    translate(width/2, height/2);
    speed= 1;
    for (int i=0; i<sterne.length; i++) {
      if (sterne[i].sz<1) {
        sterne[i] = new Stern();
      }
      sterne[i].update();
      sterne[i].show();
    }

    popMatrix();
  }

  class Stern {
    float sx;
    float x;
    float sy;
    float y;
    float sz;
    color c;
    Stern() {
      sx=random(-width/20, width/20);
      sy=random(-height/10, height/10);
      sz=random(100, 1000);
      c = color(colors[int(random(colors.length))]);
    }

    void update() {
      sz-=speed;
      x=map(sx/sz, 0, 1, 0, width);
      y=map(sy/sz, 0, 1, 0, height);
    }

    void show() {
      fill(c);
      ellipse(x, y, 2000/sz, 2000/sz);
      strokeWeight(0);
    }
  }
} 
